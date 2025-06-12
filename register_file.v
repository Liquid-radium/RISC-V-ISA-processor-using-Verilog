module reg_file(
    input [4:0] a1,
    input [4:0] a2,
    input clk,
    input rst,
    input [31:0] we3,
    input [31:0] wd3,
    output [31:0] rd1,
    output [31:0] rd2
);

reg [31:0] registers [31:0];

assign rd1 = (!rst) ? 32'h00000000 : registers[a1];
assign rd2 = (!rst) ? 32'h00000000 : registers[a2];

always @ (posedge clk) begin
    if (we3) begin
    registers[a3] <= wd3;
    end
end
endmodule