`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:26 10/23/2015 
// Design Name: 
// Module Name:    FourBitSubtractor 
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
module FourBitSubtractor(
    input [3:0] A,
    input [3:0] B,
    output [4:0] Difference
    );

	assign Difference = {1'b0,A} - {1'b0,B};//Subtract A from B.
endmodule
