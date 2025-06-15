`include "program_counter.v"
`include "instruction_memory.v"
`include "register_file.v"
`include "extend.v"
`include "alu.v"
`include "control_unit_top.v"
`include "data_memory.v"
`include "adder.v"

module single_cycle_top(
    input clk,
    input rst

);

wire [31:0] pc_top;
wire [31:0] rd_instr;
wire [31:0] rd1_top;
wire [31:0] imm_ext_top;
wire [31:0] alu_control_top;
wire [31:0] alu_result;
wire reg_write;
wire read_data;
wire [31:0] pc_new;

program_counter pc(
    .clk(clk),
    .rst(rst),
    .pc_next(pc_new),
    .pc(pc_top)
);

instr_mem im(
    .rst(rst),
    .a(pc_top),
    .rd(rd_instr)
);

reg_file rf(
    .clk(clk),
    .rst(rst),
    .we3(reg_write),
    .wd3(read_data),
    .a1(rd_instr[15:9]),
    .a2(),
    .a3(rd_instr[11:7]),
    .rd1(rd1_top),
    .rd2()
);

sign_extend sign_extend(
    .in(rd_instr),
    .imm_ext(imm_ext_top)
);

alu alu(
    .a(rd1_top),
    .b(imm_ext_top),
    .result(alu_result),
    .alu_control(alu_control_top),
    .overflow_flag(),
    .carry_flag(),
    .zero_flag(),
    .negative_flag()
);

control_unit_top control_unit(
    .op(rd_instr[6:0]),
    .reg_write(reg_write),
    .imm_src(),
    .alu_src(),
    .mem_write(),
    .result_src(),
    .branch(),
    .funct3(rd_instr[14:1]),
    .funct7(),
    .alu_control(alu_control_top)
);

data_memory data_memory(
    .clk(clk),
    .rst(rst),
    .we(),
    .wd(),
    .a(alu_result),
    .rd(read_data)
);

adder pc_adder(
    .a(pc),
    .b(32'd4),
    .c(pc_new)
);

endmodule