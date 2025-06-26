module register_file(
    input  [4:0] a1,   // Read address 1
    input  [4:0] a2,   // Read address 2
    input  [4:0] a3,   // Write address
    input        clk,  // Clock
    input        rst,  // Reset (active high)
    input        we3,  // Write enable
    input  [31:0] wd3, // Write data
    output [31:0] rd1, // Read data 1
    output [31:0] rd2  // Read data 2
);

reg [31:0] registers [0:31];  // 32 registers, 32-bit wide

// Combinational reads
assign rd1 = (rst) ? registers[a1] : 32'h00000000;
assign rd2 = (rst) ? registers[a2] : 32'h00000000;

// Synchronous write
always @(posedge clk) begin
    if (rst && we3 && (a3 != 5'd0)) begin
        registers[a3] <= wd3;
    end
end

endmodule
