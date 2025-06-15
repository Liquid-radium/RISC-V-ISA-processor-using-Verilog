module main_decoder(
    input [7:0] op,
    input zero,
    output reg_write,
    output mem_write,
    output result_src,
    output alu_src,
    output [1:0] imm_src,
    output [1:0] alu_op,
    output pc_src
);
wire branch;

assign reg_write = ((op == 7'b0000011) | (op == 7'b0110011)) ? 1'b1 : 1'b0;
assign mem_write = (op == 7'b0100011);
assign result_src = (op == 7'b0000011);
assign alu_src = ((op == 7'b0000011) | (op == 7'b0100011)) ? 1'b1 : 1'b0;
assign branch = (op == 7'b1100011);
assign imm_src = (op == 7'b0100011) ? 2'b01 : (op == 7'b1100011) ? 2'b10 : 2'b00;
assign alu_op = (op == 7'b0110011) ? 2'b01 : (op == 7'b1100011) ? 2'b10 : 2'b00;
assign pc_src = zero & branch;
endmodule