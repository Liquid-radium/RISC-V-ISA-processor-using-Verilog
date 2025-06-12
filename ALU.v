module alu(
    input [31:0] a,
    input [31:0] b,
    input [2:0] alu_control,
    output zero_flag,
    output negative_flag,
    output carry_flag,
    output overflow_flag,
    output [31:0] result
);

wire [31:0] a_and_b;
wire [31:0] a_or_b;
wire [31:0] not_a;
wire [31:0] mux_1;
wire [31:0] sum;
wire [31:0] mux_2;
wire cout;
wire [31:0] slt;

assign a_and_b = a&b;
assign a_or_b = a|b;
assign not_b = ~b;
assign mux_1 = (alu_control[0] == 1'b0) ? b : not_b;
assign (cout, sum) = a + mux_1 + alu_control[0];
assign mux_2 = (alu_control[2:0] == 3'b000) ? sum : 
               (alu_control[2:0] == 3'b001) ? sum :
               (alu_control[2:0] == 3'b010) ? a_and_b : 
               (alu_control[2:0] == 3'b011) ? a_or_b:
               (alu_control[2:0] == 3'b100) ? 32'h00000000;
assign zero_flag = &(~result);
assign negative_flag = result[31];
assign carry_flag = cout&(~alu_control[1]);
assign overflow_flag = (~alu_control[1]) & ~(a[31]^b[31]^alu_control[0]);
assign slt = {31'b0000000000000000000000000000000,sum[31]};

endmodule