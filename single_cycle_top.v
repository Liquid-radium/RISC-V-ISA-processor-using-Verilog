//`include "program_counter.v"
//`include "instr_mem.v"
//`include "register_file.v"
//`include "extend.v"
//`include "alu.v"
//`include "control_unit.v"
//`include "data_memory.v"
//`include "adder.v"
//`include "alu_decoder.v"
//`include "main_decoder.v"

module single_cycle_top(
    input clk,
    input rst
);

wire [31:0] pc_top;
wire [31:0] rd_instr;
wire [31:0] rd1_top;
wire [31:0] rd2_top;
wire [31:0] imm_ext_top;
wire [2:0] alu_control_top;
wire [31:0] alu_result;
wire reg_write;
wire [31:0] read_data;
wire [31:0] pc_new;
wire [1:0] imm_src;
wire alu_src;
wire mem_write;
wire result_src;
wire branch;
wire [31:0] alu_b;

assign alu_b = (alu_src) ? imm_ext_top : rd2_top;

program_counter pc(
    .clk(clk),
    .rst(rst),
    .pc_next(pc_new),
    .pc(pc_top)
);

instr_memory im(
    .a(pc_top),
    .rst(rst),
    .rd(rd_instr)
);

register_file rf(
    .clk(clk),
    .rst(rst),
    .we3(reg_write),
    .wd3(read_data),
    .a1(rd_instr[15:9]),
    .a2(rd_instr[20:16]),
    .a3(rd_instr[11:7]),
    .rd1(rd1_top),
    .rd2(rd2_top)
);

extend sign_extend(
    .in(rd_instr[31:20]),
    .imm_ext(imm_ext_top)
);

alu alu(
    .a(rd1_top),
    .b(alu_b),
    .result(alu_result),
    .alu_control(alu_control_top),
    .overflow_flag(),
    .carry_flag(),
    .zero_flag(),
    .negative_flag()
);

control_unit control_unit(
    .op(rd_instr[6:0]),
    .reg_write(reg_write),
    .imm_src(imm_src),
    .alu_src(alu_src),
    .mem_write(mem_write),
    .result_src(result_src),
    .branch(branch),
    .funct3(rd_instr[14:12]),
    .funct7(rd_instr[31:25]),
    .alu_control(alu_control_top)
);

data_memory data_memory(
    .clk(clk),
    .we(mem_write),
    .wd(rd2_top),
    .a(alu_result),
    .rd(read_data)
);

adder pc_adder(
    .a(pc_top),
    .b(32'd4),
    .y(pc_new)
);

endmodule