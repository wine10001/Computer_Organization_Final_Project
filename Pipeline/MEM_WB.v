`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:44:36 01/12/2019 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB(clk, WB_memtoreg, WB_regwrite, WB_rd, WB_aluresult, WB_writereg,
				MEM_memtoreg, MEM_regwrite, MEM_rd, MEM_aluresult, MEM_writereg);
				
input clk;
input MEM_memtoreg, MEM_regwrite;
input [31:0] MEM_rd, MEM_aluresult;
input [4:0] MEM_writereg;

output reg WB_memtoreg, WB_regwrite;
output reg [31:0] WB_rd, WB_aluresult;
output reg [4:0] WB_writereg;

always@(posedge clk)
begin
	{WB_memtoreg, WB_regwrite} <= {MEM_memtoreg, MEM_regwrite};
	{WB_rd, WB_aluresult} <= {MEM_rd, MEM_aluresult};
	WB_writereg <= MEM_writereg;
end

endmodule
