`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:43 10/26/2022 
// Design Name: 
// Module Name:    sign_extend_branch 
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
module sign_extend_branch(
	input [25:0] label0,
	input [20:0] label1,
	input lblSel,
	output reg[31:0] resultBits
    );

	always @(*)
	begin
		if (lblSel == 0) // psuedo-direct addressing, extend I[25:0]
		begin
			resultBits = {{6{label0[25]}}, label0[25:0]};
		end
		else // 	PC-rel addressing, extend I[20:0]
		begin
			resultBits = {{11{label1[20]}}, label1[20:0]};
		end
	end

endmodule
