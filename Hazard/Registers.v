`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:34 01/11/2019 
// Design Name: 
// Module Name:    Registers 
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
module Registers(writereg, clk, readreg1, readreg2, writeda, regwrite, readda1, readda2);

input regwrite;
input [4:0] readreg1, readreg2, writereg;
input [31:0] writeda;
input clk;
reg [31:0] reg_mem [31:0];
output [31:0]readda1, readda2;

initial
begin
	reg_mem[1] = 32'd9;
	reg_mem[3] = 32'd5;
	reg_mem[5] = 32'd12;
	reg_mem[6] = 32'd2;
	reg_mem[15] = 32'd1;
end

assign readda1 = (reg_mem[readreg1]==0)?32'd0:reg_mem[readreg1];
assign readda2 = (reg_mem[readreg2]==0)?32'd0:reg_mem[readreg2];

always@(negedge clk)
begin
	if (regwrite==1) reg_mem[writereg] <= writeda;
	else reg_mem[writereg] <= reg_mem[writereg];
end

reg [5:0] i;
always@(posedge clk)
begin
	for(i=0; i<32; i=i+1)
	begin
		$display("Reg_Mem[%d]: %b \n", i, reg_mem[i]);
	end
end

endmodule
