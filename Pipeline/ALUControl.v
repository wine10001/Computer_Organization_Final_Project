`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:42 01/11/2019 
// Design Name: 
// Module Name:    ALUControl 
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
module ALUControl(ALUctrl, ALUop, funct);

input [1:0] ALUop;
input [5:0] funct;
output reg [3:0] ALUctrl;

always@(*)
begin
	case(ALUop)
		2'd0: ALUctrl = 4'd2;
		2'd1: ALUctrl = 4'd6;
		2'd2: begin
					case(funct)
						6'b100000: ALUctrl = 4'd2;
						6'b100010: ALUctrl = 4'd6;
						6'b100100: ALUctrl = 4'd0;
						6'b100101: ALUctrl = 4'd1;
						6'b101010: ALUctrl = 4'd7;
						default: ALUctrl = 4'd15;
					endcase
				end
		default: ALUctrl = 4'd15;
	endcase
end

endmodule
