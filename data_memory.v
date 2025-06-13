module data_mem(
    input  [31:0] a,     // Address
    input  [31:0] wd,    // Write Data
    input         clk,   // Clock
    input         we,    // Write Enable
    output [31:0] rd     // Read Data
);

reg [31:0] data_memory [1023:0];

assign rd = (!we) ? data_memory[a] : 32'h00000000;

always @(posedge clk) begin
    if (we) begin
        data_memory[a] <= wd;
    end
end

endmodule
