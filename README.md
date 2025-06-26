# RISC-V Single-Cycle Processor in Verilog

This project implements a **single-cycle RISC-V processor** using Verilog HDL. It is capable of executing a subset of RISC-V instructions and includes status flag detection for **carry**, **overflow**, **negative**, and **zero** results. The design is fully simulated using **ModelSim**.

## Project Highlights

- RISC-V ISA Subset Support:
  - `ADD`, `SUB`, `AND`, `OR`, `NOT`, `SLT`
-  Status Flags:
  - Carry, Overflow, Negative, Zero
-  Design Type:
  - **Single-cycle architecture**
-  Simulation:
  - Performed using **ModelSim**
  
---

##  What is a Single-Cycle Processor?

A **single-cycle processor** completes the execution of each instruction in exactly **one clock cycle**. This means that every instruction — no matter how simple or complex — progresses through **fetch, decode, execute, memory, and write-back** phases within the same cycle.

> While it simplifies control and makes timing predictable, this architecture may lead to longer clock periods to accommodate the slowest instruction.

---

##  Project Directory Structure

riscv-single-cycle-processor/
│
├── alu.v # Arithmetic and Logic Unit

├── alu_decoder.v # Decodes ALU operation based on instruction funct fields

├── control_unit.v # Generates control signals for datapath

├── adder.v # Program Counter increment logic

├── data_memory.v # Data memory unit (read/write)

├── extend.v # Sign-extension for immediate values

├── instr_memory.v # Instruction memory (read-only)

├── main_decoder.v # Decodes opcodes into control signals

├── program_counter.v # Maintains and updates PC

├── register_file.v # RISC-V register file (32 registers)

├── single_cycle_top.v # Top-level integration of all modules

└── testbench.v # Testbench for simulation in ModelSim


## Instruction Support
| Instruction | Description               |
| ----------- | ------------------------- |
| `ADD`       | Adds two registers        |
| `SUB`       | Subtracts second register |
| `AND`       | Bitwise AND               |
| `OR`        | Bitwise OR                |
| `NOT`       | Bitwise NOT               |
| `SLT`       | Set if less than (signed) |

## Flags Generated

Carry: Detected during unsigned addition
Overflow: Detected for signed arithmetic
Negative: Set if result is negative (MSB = 1)
Zero: Set if result is zero

## Future Work 

Add more RISC-V instructions (e.g., load/store, branches).
Extend to pipelined or multi-cycle architecture.
Implement memory-mapped I/O for embedded-style interaction.
Connect to UART or GPIO on FPGA.

License
This project is open-source and available under the MIT License.

Contributions
Feel free to fork this repository, suggest improvements, or open pull requests.

Author
Shruti Hegde
Feel free to connect on GitHub or LinkedIn!
