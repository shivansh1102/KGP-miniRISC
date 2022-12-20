`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:20 10/21/2022 
// Design Name: 
// Module Name:    Shifter 
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
module Shifter(
	input signed [31:0] a, 
	input [31:0] shiftamt,
	input op1, 
	input op2,
	output reg [31:0] res
   );
	 
	// if op1 == 0 && op2 == 0, then it corresponds to shll
	// if op1 == 1 && op2 == 0, then it corresponds to shrl
	// if op1 == 0 && op2 == 1, then it corresponds to shra
	
	always @(*)
		begin
			if(!op1 && !op2) 
			begin
				res = a << shiftamt;
			end
			else if(op1 && !op2)
			begin
				res = a >> shiftamt;
			end
			else if(!op1 && op2)
			begin
				res = a >>> shiftamt;
			end
			else
			begin
				res = 1'b0;
			end
		end
endmodule
