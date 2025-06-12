module program_counter(
    input [31:0] pc_next,
    input clk,
    input rst,
    output reg [31:0] pc
);
always @(posedge clk) begin
  if (rst == 1'b0) begin
    pc <= 32'h00000000;
  end 
  else begin
    pc <= pc_next;
end
