`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:26:30 10/22/2015 
// Design Name: 
// Module Name:    FourBitAdder 
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
module FourBitAdder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output Cout
    );

	assign {Cout, Sum} = {1'b0,A} + {1'b0,B};//Add numbers A and B.
endmodule
