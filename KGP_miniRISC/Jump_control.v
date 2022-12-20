`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:31 10/26/2022 
// Design Name: 
// Module Name:    Jump_control 
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
module Jump_control(
	input signBit,
	input zeroBit,
	input carryBit,
	input [3:0] brhSel,
	output reg resJump
    );

	always @(*)
	begin
		case (brhSel)
			4'b1000:
			begin
				resJump = 1;
			end
			4'b1001 :
			begin
				resJump = 1;
			end
			4'b1010:
			begin
				if(signBit)
					resJump = 1;
				else
					resJump = 0;
			end
			4'b1011 :
			begin
				if(zeroBit)
					resJump = 1;
				else
					resJump = 0;
			end
			4'b1100 :
			begin
				if(zeroBit)
					resJump = 0;
				else
					resJump = 1;
			end
			4'b1101 :
			begin
				resJump = 1;
			end
			4'b1110 :
			begin
				if(carryBit)
					resJump = 1;
				else
					resJump = 0;
			end
			4'b1111 :
			begin
				if(carryBit)
					resJump = 0;
				else
					resJump = 1;
			end
			default : resJump = 0;
		endcase
	end

endmodule
