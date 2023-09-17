`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:31:20 01/11/2019
// Design Name:   Control
// Module Name:   D:/Xilinx/CPU/Control_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_tb;

	// Inputs
	reg [5:0] op;

	// Outputs
	wire regdst;
	wire alusrc;
	wire memtoreg;
	wire regwrite;
	wire memread;
	wire memwrite;
	wire branch;
	wire [1:0] aluop;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.op(op), 
		.regdst(regdst), 
		.alusrc(alusrc), 
		.memtoreg(memtoreg), 
		.regwrite(regwrite), 
		.memread(memread), 
		.memwrite(memwrite), 
		.branch(branch), 
		.aluop(aluop)
	);

	initial begin
		// Initialize Inputs
		op = 6'd0;

		// Wait 100 ns for global reset to finish
		#100;op=6'd35;
		#100;op=6'd43;
		#100;op=6'd4;
		// Add stimulus here
	end
      
endmodule

