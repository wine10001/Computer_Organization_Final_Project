`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:37:19 01/11/2019
// Design Name:   main
// Module Name:   D:/Xilinx/CPU/CPU_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_tb;

	// Inputs
	reg clk;
	wire [31:0] PC;
	wire zero;
	wire [4:0] writereg, Rs, Rt;
	wire [1:0] aluop;
	wire [31:0] writeda, readda1, readda2, aludata2, ins, aluresult;
	wire jump, regdst, alusrc, memtoreg, regwrite, memread, memwrite, branch;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.Rs(Rs),
		.Rt(Rt),
		.aluop(aluop),
		.aluresult(aluresult),
		.zero(zero),
		.ins(ins),
		.aludata2(aludata2),
		.clk(clk),
		.PC(PC),
		.writereg(writereg),
		.writeda(writeda),
		.readda1(readda1),
		.readda2(readda2),
		.jump(jump),
		.regdst(regdst),
		.alusrc(alusrc),
		.memtoreg(memtoreg),
		.regwrite(regwrite),
		.memread(memread),
		.memwrite(memwrite),
		.branch(branch)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		//PC = 0;
		//#150 PC = 4;
		//#100 PC = 8;
		//#100 PC = 12;
		//#100 PC = 16;
		
		#1700 $finish;
	end
	
	always #100 clk = ~clk;
      
endmodule

