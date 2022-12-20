`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:44 10/21/2022 
// Design Name: 
// Module Name:    CLA_16bit 
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
module CLA_16bit(input [15:0] a, input [15:0] b, input c_in, output [15:0] sum, output c_out);
   
    parameter k = 1'b1;
    wire [3:0] p, g, c;

    CLA_4bit cla1(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(), .P(p[0]), .G(g[0]));
    CLA_4bit cla2(.a(a[7:4]), .b(b[7:4]), .c_in(c[1]), .sum(sum[7:4]), .c_out(), .P(p[1]), .G(g[1]));
    CLA_4bit cla3(.a(a[11:8]), .b(b[11:8]), .c_in(c[2]), .sum(sum[11:8]), .c_out(), .P(p[2]), .G(g[2]));
    CLA_4bit cla4(.a(a[15:12]), .b(b[15:12]), .c_in(c[3]), .sum(sum[15:12]), .c_out(), .P(p[3]), .G(g[3]));

    lookahead_carry_unit lcu(.p(p), .g(g), .c_in(c_in), .c(c), .c_out(c_out));
endmodule
