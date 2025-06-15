`include "alu_decoder.v"
`include "main_decoder.v"

module Control_Unit_Top(
    input [6:0]op,funct7,
    input [2:0]funct3,
    output reg_write,
    output alu_src,
    output mem_write,
    output result_src,
    output branch;
    output [1:0]imm_src;
    output [2:0] alu_control;
);

wire [1:0]alu_op;

main_decoder main_decoder(
                .op(op),
                .reg_write(reg_write),
                .ImmSrc(ImmSrc),
                .mem_write(mem_write),
                .result_src(result_src),
                .branch(branch),
                .alu_src(alu_src),
                .alu_op(alu_op)
    );    

alu_decoder alu_decoder(
                            .alu_op(alu_op),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(op),
                            .alu_control(alu_control)
    );    


endmodule