module data_mem(
    input [31:0] a,
    input [31:0] wd,
    input clk,
    input we,
    output [31:0] rd;
);

reg [31:0] data_memory [1023:0];

assign rd (we == 1'b0) ? (we == 1'b0) ? data_mem[a] : 32'h00000000;

always @(posedge clk)begin
    if begin
        data_memory[a] <= wd;
    end
end

endmodule
