module sign_extend(
    input [31:20] in,
    output [31:0] imm_ext
);
assign imm_ext = { {20{in[31]}}, in[31:20] };
endmodule