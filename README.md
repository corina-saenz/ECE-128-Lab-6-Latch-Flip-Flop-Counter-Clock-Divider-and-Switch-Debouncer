# ECE-128-Lab-6-Latch-Flip-Flop-Counter-Clock-Divider-and-Switch-Debouncer

Author: Corina Saenz
Date: October 23, 2025
Course: ECE 128 – FPGA Laboratory
Board: Digilent Basys3 (Xilinx Artix-7 XC7A35T)


# Overview
This lab explores fundamental sequential logic components implemented using Verilog HDL on the Basys3 FPGA.
The designs include latches, flip-flops, a 3-bit counter, a frequency divider, and a switch debouncer.
Each module was written, simulated in Vivado, and analyzed through power and resource utilization reports.


# Objectives
- Design and simulate an SR latch and SR flip-flop.
- Implement synchronous and asynchronous D flip-flops.
- Design a T flip-flop and use it to create a 3-bit counter.
- Create a 25 MHz clock divider using the onboard 100 MHz clock.
- Implement a switch debouncer and test it on the Basys3 board using a push button and an LED output.


# Module Summary
Module	Description
sr_latch.v        Cross-coupled NOR-based SR latch for basic storage demonstration.
sr_ff.v           Edge-triggered SR flip-flop; updates on rising clock edges.
dff_sync.v        D flip-flop with synchronous reset; output resets only at clock edges.
dff_async.v       D flip-flop with asynchronous reset; output resets immediately.
tff.v             T flip-flop that toggles output on each clock edge when T=1.
counter3_tff.v	  3-bit synchronous counter built using T flip-flops.
clk_div25.v	      Clock divider generating a 25 MHz signal from a 100 MHz input clock.
debouncer.v	      Push button debouncer using a two-flop synchronizer and counter for stability filtering.
top_debouncer.v	  Top-level module for hardware testing (button input → debounced LED output).


# Simulation Results
- All simulations were performed in Vivado 2023.1.
- SR latch verified correct set/reset/hold behavior.
- Flip-flops responded correctly to clock and reset signals.
- Counter incremented from 0–7 and repeated synchronously.
- Clock divider output frequency reduced to 25 MHz with 50% duty cycle.
- Debouncer filtered noisy input; output changed only after stable input state for ~10 ms.

Waveforms and timing diagrams for each module are included in the /sim directory and in the lab report appendix.


# FPGA Implementation
Only the debouncer was implemented on the physical Basys3 board.
Connections were made as follows:

Signal	      Basys3 Pin	      Description
clk	              W5	          100 MHz system clock
btnC	           U18	          Center push button input
Q[0]	           U16	          LED0 output (debounced signal)

When the button is pressed and released, the LED turns on and off once per press, with no flicker, confirming proper debounce behavior.


# Usage Instructions

1- Open Vivado Project
    - Create a new Vivado project.
    - Add all .v source files and the Basys3 .xdc constraint file.
    - Set top_debouncer.v (or top_match_xdc_min.v) as the Top Module.

2- Simulation
    - Run behavioral simulation for each testbench in /sim.
    -  View waveform timing diagrams.

4- Synthesis & Implementation
    - Run Synthesis → Implementation → Generate Bitstream.

5 - Programming the FPGA
    - Connect Basys3 via USB.
    - Open Hardware Manager → Program Device.
    - Press BTNC to observe the debounced LED behavior.

# Results and Observations
- Each sequential design performed as expected in simulation.
- Resource utilization remained below 0.1% for all modules.
- The clock divider and debouncer consumed the most dynamic power.
- Hardware demonstration confirmed the debouncer successfully eliminated button noise.


