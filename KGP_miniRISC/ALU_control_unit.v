`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:30 10/26/2022 
// Design Name: 
// Module Name:    ALU_control_unit 
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
module ALU_control_unit(input[5:0] funct, input[2:0] aluOp, output reg aluSrc, output reg[3:0] aluSel);

always @(*)
begin
	case(aluOp)
		3'b000: begin
			case(funct)
				6'b000000:begin
					aluSrc = 1'b0;
					aluSel = 4'b0000;
				end
				6'b000001:begin
					aluSrc = 1'b0;
					aluSel = 4'b0001;
				end
				6'b000010:begin
					aluSrc = 1'b0;
					aluSel = 4'b0010;
				end
				6'b000011:begin
					aluSrc = 1'b0;
					aluSel = 4'b0011;
				end
				6'b000100:begin
					aluSrc = 1'b1;
					aluSel = 4'b0100;
				end
				6'b000101:begin
					aluSrc = 1'b1;
					aluSel = 4'b0101;
				end
				6'b000110:begin
					aluSrc = 1'b0;
					aluSel = 4'b0100;
				end
				6'b000111:begin
					aluSrc = 1'b0;
					aluSel = 4'b0101;
				end
				6'b001000:begin
					aluSrc = 1'b1;
					aluSel = 4'b0110;
				end
				6'b001001:begin
					aluSrc = 1'b0;
					aluSel = 4'b0110;
				end
				6'b001010:begin
					aluSrc = 1'b0;
					aluSel = 4'b1001;
				end
				default:begin
					aluSrc = 1'b1;
					aluSel = 4'b1111;
				end
			endcase
		end
		3'b011:begin
			aluSrc = 1'b1;
			aluSel = 4'b0000;
		end
		3'b010:begin
			aluSrc = 1'b1;
			aluSel = 4'b0001;
		end
		3'b100:begin
			aluSrc = 1'b1;
			aluSel = 4'b000;
		end
		default:begin
			aluSrc = 1'b1;
			aluSel = 4'b1000;
		end
	endcase
end

endmodule
