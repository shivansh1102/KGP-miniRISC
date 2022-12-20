`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:39 10/26/2022 
// Design Name: 
// Module Name:    sign_extend_16_to_31 
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
module sign_extend_16_to_31(
	input [5:0] opcode,
	input [15:0] priorBits,
	output reg [31:0]  resultBits
    );

	always @(*)
	begin
		if (opcode == 6'b010000) // for R-type instructions where we need to extend bits of shamt only.
		begin
			resultBits = {{27{1'b0}}, priorBits[10:6]};
		end
		else // for Immediate type & base addressing type instructions where we need to perform sign extension of 16 bits. 
		begin
			resultBits = {{16{priorBits[15]}}, priorBits[15:0]};
		end
	end

endmodule
