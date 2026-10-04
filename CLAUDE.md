# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Port of Pavel Demin's red-pitaya-notes HPSDR receiver/transceiver to the **Antminer S9 control board** (Xilinx Zynq-7000) with an **AD9226 ADC** and **DAC904** DAC. It has two halves that must stay in sync:

- **PL gateware** — a Vivado block design described by TCL fragments (`projects/sdr_transceiver_hpsdr_61_44/*.tcl`, `cfg/`).
- **ARM/Linux userspace server** — `projects/sdr_transceiver_hpsdr_61_44/server/sdr-transceiver-hpsdr.c`, which speaks the HPSDR/Metis protocol to PowerSDR/Thetis clients over UDP.

## The build framework is NOT in this repo

The `.tcl` files use custom commands (`cell`, `wire`, `module`, `source`) and custom IP (`pavel-demin:user:*`, e.g. `axi_hub`, `port_slicer`, `axis_fifo`). These only exist inside **pavel-demin/red-pitaya-notes**. This repo is a *project overlay* for that framework — that's why there is no top-level Makefile or `build.tcl`. To build the bitstream you drop these files into the red-pitaya-notes tree and drive its Makefile with Vivado. Don't try to synthesize the TCL standalone.

**PS configuration (MIO/DDR/clocks/FCLK) is not here and not in the bitstream.** It lives in the XSA/boot image (`ps7_init` run by the U-Boot SPL at boot) and must match the Antminer board. `block_design.tcl` imports a board preset `cfg/red_pitaya.xml` that is **absent from the repo** and is Red-Pitaya-specific — it must be supplied/replaced with an Antminer PS config to actually boot.

## Build (server)

```sh
cd projects/sdr_transceiver_hpsdr_61_44/server
make          # builds sdr-transceiver-hpsdr and sdr-transceiver-hpsdr-thetis
make clean
```

`CFLAGS` target `armv7-a`/`cortex-a9`/NEON, so this must be compiled **for the ARM target** (on-board gcc or a cross toolchain), not for the host. The `-thetis` binary is the same source with `-DTHETIS`.

## Architecture: the axi_hub register bridge

`axi_hub` (`hub_0` in `block_design.tcl`) is the single bridge between the ARM (PS) and the gateware (PL):

- PS reaches it over **M_AXI_GP0** at physical base **`0x40000000`**. The C server `mmap`s `/dev/mem` at `0x40000000` (cfg), `0x41000000` (sts), `0x42000000` (fifo), `0x43000000` (codec), `0x44000000` (xadc), `0x45000000` (alex), `0x46000000`/`0x47000000` (ramps) — these are the hub's sub-ports.
- Config flows PS→PL as a **320-bit `cfg_data`** word; status flows PL→PS as a **96-bit `sts_data`** word.
- The register map is carved by `port_slicer` cells: each pulls a bit range out of `cfg_data` and routes it to rx/tx/codec/alex logic (e.g. `cfg_slice_0` = bits 159:32 → RX, `cfg_slice_1` = 255:160 → TX, `cfg_slice_2` = 319:256 → codec; low bits are resets/PTT/keyer/select).

**Key cross-file invariant:** the `cfg_data`/`sts_data` bit layout in `block_design.tcl` and the offsets/bitfields written by the C server must agree. Changing the register map means editing **both** the `port_slicer` ranges in the TCL **and** the matching code in `sdr-transceiver-hpsdr.c`.

## Clocking

All PL logic is driven by the **external ADC clock** (board pin `K17`, port `adc_clk_i`) through `clk_wiz pll_0`: `clk_out1` = 61.44 MHz (main fabric + `axi_hub` + `M_AXI_GP*_ACLK`), `clk_out2` = 122.88 MHz @180° and `clk_out3` = 122.88 MHz for the DAC. If the ADC clock is absent the PLL never locks and PS accesses to `0x4000_0000` stall.

## Signal flow

RX: `axis_red_pitaya_adc` (`adc_0`) → `rx_0` (DDC) → `fifo` → hub → server → UDP to client.
TX: client → server → hub → `tx_0` (DUC) / `codec` → `axis_red_pitaya_dac` (`dac_0`).
External RF-board control (Alex filters, band/PTT/preamp/attenuators) goes out via the expansion connector (`exp_*` ports) and over **I2C** — the server drives PCA9555 GPIO expanders at `0x20`–`0x23` on `/dev/i2c-0` (a PS I2C controller on MIO, configured in the device tree, not in this repo).

## Where things live

- `cfg/ports.tcl` — declares block-design ports (ADC/DAC/expansion).
- `cfg/ports.xdc` — **Antminer-specific** FPGA pin assignments (ADC/DAC/expansion). This is the main hardware-adaptation file vs. Red Pitaya.
- `cfg/clocks.xdc` — ADC input timing constraints.
- `cfg/dds.mem` — DDS phase-to-amplitude LUT init.
- `cores/axis_red_pitaya_adc.v`, `cores/axis_red_pitaya_dac.v` — the only local Verilog cores (ADC/DAC front ends).
- `projects/sdr_transceiver_hpsdr_61_44/block_design.tcl` — top-level block design; `rx.tcl`/`tx.tcl`/`codec.tcl` are `source`d sub-modules.
- `projects/.../filters/*.r` — FIR coefficient files for the DDC/DUC.

## Reference

See `README.md` for build/hardware/software write-ups at enthru.net.
