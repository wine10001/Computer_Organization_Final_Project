`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:53:47 01/11/2019 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(ALUresult, readdata1, readdata2, ALUctrl, zeroflag);

input [31:0] readdata1, readdata2;
input [3:0] ALUctrl;
output reg zeroflag;
output reg [31:0] ALUresult;

wire [31:0] A, B;

assign A = readdata1;
assign B = readdata2;

always@(*)
begin
	case(ALUctrl)
		4'd0: ALUresult = A & B;
		4'd1: ALUresult = A | B;
		4'd2: ALUresult = A + B;
		4'd6: ALUresult = A - B;
		4'd7: ALUresult = (A<B)? 32'b1111_1111_1111_1111_1111_1111_1111_1111:32'd0;
		default: ALUresult = 32'd0;
	endcase
end

initial
begin
	zeroflag = 0;
end

always@(*)
begin
	zeroflag = (ALUresult == 0)? 1'b1:1'b0;
end

endmodule
