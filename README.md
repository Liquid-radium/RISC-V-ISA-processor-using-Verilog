# RISC-V-ISA-processor-using-Verilog
This project implements a 32-bit RISC-V (RV32I) single-cycle processor using Verilog HDL. It serves as a fundamental building block for understanding RISC-V architecture, digital design principles, and processor design using hardware description languages.

Features
Implements the RV32I base integer instruction set

Supports the following instruction types:

R-type (e.g., ADD, SUB, AND, OR)

I-type (e.g., ADDI, LOAD)

S-type (e.g., STORE)

B-type (e.g., BEQ, BNE)

U-type (e.g., LUI)

J-type (e.g., JAL)

Single-cycle datapath

Modular Verilog design with separate modules for:

ALU

Register file

Control unit

Instruction memory

Data memory

Immediate generator

Program counter

Testbench support with sample programs

Easily extensible for pipelining or other ISA extensions

Directory Structure
csharp
Copy
Edit
RISC-V-ISA-processor-using-Verilog/
├── alu.v                 # Arithmetic Logic Unit
├── control_unit.v        # Main control logic
├── data_memory.v         # Data memory
├── immediate_generator.v # Immediate value extraction
├── instruction_memory.v  # Instruction memory
├── mux.v                 # Multiplexers
├── program_counter.v     # PC logic
├── register_file.v       # Register file (32 x 32-bit)
├── top_module.v          # Top-level processor module
├── testbench/            # Contains testbench files
└── README.md             # Project documentation
🛠️ How It Works
The processor fetches an instruction from the instruction memory based on the current value of the program counter (PC), decodes it using the control unit and immediate generator, performs the required computation via the ALU, accesses memory if needed, and writes back results to the register file—all within a single clock cycle.

Running the Simulation
Prerequisites
Icarus Verilog (iverilog)

GTKWave (for waveform viewing)

Optional: Cocotb (for Python-based co-simulation)

Steps
Clone the repository:

bash
Copy
Edit
git clone https://github.com/Liquid-radium/RISC-V-ISA-processor-using-Verilog.git
cd RISC-V-ISA-processor-using-Verilog
Compile and run the simulation:

bash
Copy
Edit
iverilog -o riscv_tb top_module.v testbench/top_tb.v *.v
vvp riscv_tb
View waveform (if dump.vcd is generated):

bash
Copy
Edit
gtkwave dump.vcd
Future Improvements
Add pipelining stages (IF, ID, EX, MEM, WB)

Support more RISC-V extensions (e.g., RV32M, RV64I)

Implement hazard detection and forwarding

Integrate with cocotb testbenches

Add a GUI for loading and executing programs
