module single_cycle_top_tb;

reg clk, rst;

// Instantiate DUT (Device Under Test)
single_cycle_top uut (
    .clk(clk),
    .rst(rst)
);

// Dump waveform
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, uut);
end

// Clock generation
initial clk = 0;
always #50 clk = ~clk;  // 100ns period (10MHz)

// Reset sequence
initial begin
    rst = 1'b1;      // Assert reset
    #100;
    rst = 1'b0;      // Deassert reset
    #1000;           // Run for a while
    $finish;
end

endmodule
