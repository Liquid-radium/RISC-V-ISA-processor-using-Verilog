module alu_decoder(
    input op5,
    input [1:0] alu_op,
    input [2:0] funct3,
    input funct7,
    output [2:0] alu_control
);
wire [1:0] concat;

assign concat = {op5, funct7};
assign alu_control = (alu_op == 2'b00) ? 3'b000 :
                     (alu_op == 2'b01) ? 3'b001 :
                     ((alu_op == 2'b10) & (funct3 == 3'b010)) ? 3'b101 :
                     ((alu_op == 2'b10) & (funct3 == 3'b110)) ? 3'b011 :
                     ((alu_op == 2'b10) & (funct3 == 3'b111)) ? 3'b010 :
                     ((alu_op == 2'b10) & (funct3 == 3'b000)) & (concat == 2'b11) ? 3'b001 : 
                     ((alu_op == 2'b10) & (funct3 == 3'b000)) & (concat != 2'b11) ? 3'b000 : 3'b000;
endmodule 