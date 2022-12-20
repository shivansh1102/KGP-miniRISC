`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:22:13 10/21/2022
// Design Name:   ALU
// Module Name:   /home/likhith26090/Documents/projects/COA/KGP_miniRISC/ALU_tb.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0]ALUSel;

	// Outputs
	wire sign;
	wire zero;
	wire carry;
	wire [31:0] result;


	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.ALUSel(ALUSel), 
		.sign(sign), 
		.zero(zero), 
		.carry(carry), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ALUSel = 4'b0000;

		#50;
		a = 32'b11111111111111111111111111111111;
		b = 32'd1392;
		ALUSel = 4'b0000;

		#50;
		a = 32'd100;
		b = 32'd0;
		ALUSel = 4'b0000;

		#50;
		a = 32'd5050;
		b = 32'd2;
		ALUSel = 4'b0001;

		#50;
		a = 32'd2939;
		b = 32'd100;
		ALUSel = 4'b0001;

		#50;
		a = 32'd994;
		b = 32'd0;
		ALUSel = 4'b0001;

		#50;
		a = 32'd199;
		b = 32'd0;
		ALUSel = 4'b0010;

		#50;
		a = 32'd199;
		b =32'd30;
		ALUSel = 4'b0010;

		#50;
		a = 32'd939;
		b = 32'd000;
		ALUSel = 4'b0011;

		#50;
		a = 32'd939;
		b = 32'd104;
		ALUSel = 4'b0011;

		#50;
		a = 32'd100;
		b = 32'd2;
		ALUSel = 4'b0100;

		#50;
		a = 32'd100;
		b = 32'd2;
		ALUSel = 4'b0101;

		#50;
		a = 32'd100;
		b = 32'd4;
		ALUSel = 4'b0110;

		#50;
		a = 32'd100;
		b = 32'd228;
		ALUSel = 4'b1001;

		#50;
		
        
	end
      
endmodule

