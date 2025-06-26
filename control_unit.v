`include "alu_decoder.v"
`include "main_decoder.v"

module control_unit(
    input  [6:0] op,
    input  [6:0] funct7,
    input  [2:0] funct3,
    output       reg_write,
    output       alu_src,
    output       mem_write,
    output       result_src,
    output       branch,
    output [1:0] imm_src,
    output [2:0] alu_control
);

wire [1:0] alu_op;
wire       zero = 0;  // You need to either compute or set this properly
wire       pc_src;    // Optional: expose it if needed

main_decoder u_main_decoder (
    .op(op),
    .zero(zero),
    .reg_write(reg_write),
    .imm_src(imm_src),
    .mem_write(mem_write),
    .result_src(result_src),
    .alu_src(alu_src),
    .alu_op(alu_op),
    .pc_src(pc_src)
);

alu_decoder u_alu_decoder (
    .alu_op(alu_op),
    .funct3(funct3),
    .funct7(funct7),
    .op5(op[5]),
    .alu_control(alu_control)
);

assign branch = pc_src;  // Optional: expose it if needed

endmodule
