module extend(
    input [11:0] in,
    output wire [31:0] imm_ext
);
assign imm_ext = { {20{in[11]}}, in};
endmodule