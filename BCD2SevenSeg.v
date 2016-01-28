`timescale 1ns / 1ps
// Module Name:    BCD2SevenSeg 
// Description: Converts a hex digit to a seven segment display code.
//					 Uses negative logic for the seven segment display code.
//					 File should be more properly named hex2SevenSeg because
//					 digits expand 0-F.
module BCD2SevenSeg(
    input [3:0] BCD,
    output reg [7:0] SevenSeg
    );
always @*
	case(BCD)
		4'b0000 ://0
			SevenSeg = 8'b00000011;
		4'b0001 ://1
			SevenSeg = 8'b10011111;
		4'b0010 ://2
			SevenSeg = 8'b00100101;
		4'b0011 ://3
			SevenSeg = 8'b00001101;			
		4'b0100 ://4
			SevenSeg = 8'b10011001;
		4'b0101 ://5
			SevenSeg = 8'b01001001;
		4'b0110 ://6
			SevenSeg = 8'b01000001;
		4'b0111 ://7
			SevenSeg = 8'b00011111;
		4'b1000 ://8
			SevenSeg = 8'b00000001;
		4'b1001 ://9
			SevenSeg = 8'b00001001;
		4'b1010 ://A
			SevenSeg = 8'b00010001;
		4'b1011 ://b
			SevenSeg = 8'b11000001;			
		4'b1100 ://C
			SevenSeg = 8'b01100011;
		4'b1101 ://d
			SevenSeg = 8'b10000011;
		4'b1110 ://-
			SevenSeg = 8'b11111101;
		4'b1111 ://F
			SevenSeg = 8'b01110001;			
	endcase

endmodule
