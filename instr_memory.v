module instr_mem(
    input [31:0] a,
    input rst,
    output [31:0] rd
);
reg [31:0] mem [1023:0];
assign rd = (rst == 1'b0) ? 32'h00000000 : mem[a[11:2]];
endmodule