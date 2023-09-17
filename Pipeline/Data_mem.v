`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:56 01/11/2019 
// Design Name: 
// Module Name:    Data_mem 
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
module Data_mem(add, wd, mw, mre, rd, clk);

input [31:0] add, wd;
input mw, mre, clk;
output reg [31:0] rd;
reg [31:0] data_mem [127:0];
wire [31:0] wordaddr;

assign wordaddr = {2'd0, add[31:2]};

always@(*)
begin
	if (mre) rd = data_mem[wordaddr];
	else rd = 32'd0;
end

always@(negedge clk)
begin
	if (mw) data_mem[wordaddr] <= wd;
	else data_mem[wordaddr] <= data_mem[wordaddr];
end

reg [5:0] i;
always@(posedge clk)
begin
	for(i=0; i<32; i=i+1)
	begin
		$display("Data_Mem[%d]: %b \n", i, data_mem[i]);
	end
end

endmodule
