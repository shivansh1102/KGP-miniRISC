`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:44 10/26/2022 
// Design Name: 
// Module Name:    Control_unit 
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
module Control_unit( input[31:26] opcode, 
							output reg[1:0] regDst,
							output reg regWrite,
							output reg memRead,
							output reg memWrite,
							output reg[1:0] memToReg,
							output reg jumpAddr,
							output reg lblSel,
							output reg[3:0] brhSel,
							output reg[2:0] aluOp
							);
							
always @(*)
begin
	case(opcode)
		6'b010000: begin
			regDst = 2'b00;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b10;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b0000;
			aluOp = 3'b000;
		end
		
		6'b000000: begin
			regDst = 2'b01;
			regWrite = 1'b1;
			memRead = 1'b1;
			memWrite = 1'b0;
			memToReg = 2'b01;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b0000;
			aluOp = 3'b011;
		end
		
		6'b000001: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b1;
			memToReg = 2'b01;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b0000;
			aluOp = 3'b011;
		end
		6'b110010: begin
			regDst = 2'b00;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b10;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b0000;
			aluOp = 3'b100;
		end

		6'b110001: begin
			regDst = 2'b00;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b10;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b0000;
			aluOp = 3'b010;
		end
		
		6'b100000: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b1000;
			aluOp = 3'b001;
		end
		
		6'b100001: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b1;
			lblSel = 1'b0;
			brhSel = 4'b1001;
			aluOp = 3'b001;
		end
		
		6'b100010: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b0;
			lblSel = 1'b1;
			brhSel = 4'b1010;
			aluOp = 3'b001;
		end
		
		6'b100011: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b0;
			lblSel = 1'b1;
			brhSel = 4'b1011;
			aluOp = 3'b001;
		end
		
		6'b100100: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b0;
			lblSel = 1'b1;
			brhSel = 4'b1100;
			aluOp = 3'b001;
		end
		
		6'b100101: begin
			regDst = 2'b10;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b1101;
			aluOp = 3'b001;
		end
		
		6'b100110: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b1110;
			aluOp = 3'b001;
		end
		
		6'b100111: begin
			regDst = 2'b00;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b00;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b1111;
			aluOp = 3'b001;
		end
		default:begin
			regDst = 2'b00;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			memToReg = 2'b10;
			jumpAddr = 1'b0;
			lblSel = 1'b0;
			brhSel = 4'b0000;
			aluOp = 3'b001;
		end
	endcase
end

endmodule
