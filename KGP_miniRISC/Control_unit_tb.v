`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:50:23 10/26/2022
// Design Name:   Control_unit
// Module Name:   /home/likhith26090/Documents/projects/COA/KGP_miniRISC/Control_unit_tb.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_unit_tb;

	// Inputs
	reg [31:26] opcode;

	// Outputs
	wire [1:0] regDst;
	wire regWrite;
	wire memRead;
	wire memWrite;
	wire [1:0] memToReg;
	wire jumpAddr;
	wire lblSel;
	wire [3:0] brhSel;
	wire [2:0] aluOp;

	// Instantiate the Unit Under Test (UUT)
	Control_unit uut (
		.opcode(opcode), 
		.regDst(regDst), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.memToReg(memToReg), 
		.jumpAddr(jumpAddr), 
		.lblSel(lblSel), 
		.brhSel(brhSel), 
		.aluOp(aluOp)
	);

	initial begin
		// Initialize Inputs
				
		opcode = 6'b010000;
		#50;
		
		opcode = 6'b000000;
		#50;
		
		opcode = 6'b000001;
		#50;
		
		opcode = 6'b110010;
		#50;
		
		opcode = 6'b110001;
		#50;
		
		opcode = 6'b100000;
		#50;
		
		opcode = 6'b100001;
		#50;
		
		opcode = 6'b100010;
		#50;
		
		opcode = 6'b100011;
		#50;
		
		opcode = 6'b100100;
		#50;
		
		opcode = 6'b100101;
		#50;
		
		opcode = 6'b100110;
		#50;

		opcode = 6'b100111;
		#50;
		
        
		// Add stimulus here

	end
      
endmodule

