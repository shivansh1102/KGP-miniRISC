`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:45 11/04/2022 
// Design Name: 
// Module Name:    branch_unit 
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
module branch_unit(input[31:0] nextAddress, input[31:0] readData1, input[25:0] label0, input[20:0] label1, input LblSel, input JumpAddr, input branch, output[31:0] nextAddr);

wire[31:0] branch_21_26, outBranch;

sign_extend_branch signExtd(.label0(label0), .label1(label1), .lblSel(LblSel), .resultBits(branch_21_26));

mux_2_1 mux2b(.a(branch_21_26), .b(readData1), .selectPin(JumpAddr), .res(outBranch));

mux_2_1 mux2c(.a(nextAddress), .b(outBranch), .selectPin(branch), .res(nextAddr));

endmodule
