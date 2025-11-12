🧮 4-Stage Pipelined Multiplier (Verilog, Vivado Implementation)
📘 Project Overview

This project presents the design and implementation of a 4×4 pipelined multiplier using Verilog HDL, simulated and verified in Xilinx Vivado.

The core objective is to demonstrate pipelined architecture in arithmetic circuits, where a multiplication operation is divided into multiple sequential stages to improve performance and throughput.
Unlike a combinational multiplier, this pipelined design can process new inputs every clock cycle once the pipeline is filled, achieving a one-result-per-cycle throughput.

⚙️ Key Features

✅ 4×4 unsigned multiplier

✅ Fully synchronous 4-stage pipelined design

✅ One output per clock after pipeline fill (high throughput)

✅ Register-based data flow ensuring stable intermediate values

✅ Implemented and simulated on Xilinx Vivado 2022.2

✅ Behavioral and post-synthesis simulation supported

✅ VCD waveform file for visualization in Vivado

Pipeline Stages
Stage	Operation	Description
Stage 1	Partial Product Generation	Generates four partial products using bitwise ANDs between A and bits of B.
Stage 2	Addition 1	Adds partial products pp0 and pp1.
Stage 3	Addition 2	Adds partial products pp2 and pp3.
Stage 4	Final Addition	Adds the results of stage 2 and stage 3 to produce the final 8-bit product.

🧠 Learning Outcomes

Deep understanding of pipelined arithmetic units

Verilog modeling of sequential systems

Timing improvement through register partitioning

Practical exposure to Vivado simulation and synthesis flow

Comparison between combinational and pipelined multipliers

👤 Author

Harsh Pandey
