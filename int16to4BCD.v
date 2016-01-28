`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:15 10/23/2015 
// Design Name: 
// Module Name:    int16to4BCD 
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
module int16to4BCD(
    output reg [3:0] BCD,
	 input [1:0] index,
    input [4:0] int16	/*
								 *	NOTE : input should be [15:0] but was only tested with
								 *	[4:0] for the required range -15:15. Inputs outside of this 
								 * range will not work.
								 */
    );
	
	 integer i;
	 reg [3:0] BCD_array [0:3];
	reg isNegative;
	reg isNegativeRange;
	reg isPositiveRange;
	reg [4:0] number;
	always @(int16) begin
		isNegative = int16[4];
		//ERROR Check Codes.
		//isNegativeRange = (isNegative ? (~(int16-1)) : int16) <= 999;
		//isPositiveRange = !isNegative && int16 <= 9999;
		//if(isPositiveRange || isNegativeRange) begin 
			if(isNegative) begin
				number = ~(int16-1);
			end else begin
				number = int16;
			end
			BCD_array[2'b00] = 4'd0;
			BCD_array[2'b01] = 4'd0;
			BCD_array[2'b10] = 4'd0;
			BCD_array[2'b11] = 4'd0;
			
			for(i = 4; i >=0; i = i - 1) begin
				//Add 3 if bcd is >= 5
				if(BCD_array[2'b11] >= 5)
					BCD_array[2'b11] = BCD_array[2'b11] + 3;
				if(BCD_array[2'b10] >= 5)
					BCD_array[2'b10] = BCD_array[2'b10] + 3;
				if(BCD_array[2'b01] >= 5)
					BCD_array[2'b01] = BCD_array[2'b01] + 3;
				if(BCD_array[2'b00] >= 5)
					BCD_array[2'b00] = BCD_array[2'b00] + 3;
				
				//Shift left 1
				BCD_array[2'b11] = BCD_array[2'b11] << 1;
				BCD_array[2'b11][0] = BCD_array[2'b10][3];
				BCD_array[2'b10] = BCD_array[2'b10] << 1;
				BCD_array[2'b10][0] = BCD_array[2'b01][3];
				BCD_array[2'b01] = BCD_array[2'b01] << 1;
				BCD_array[2'b01][0] = BCD_array[2'b00][3];
				BCD_array[2'b00] = BCD_array[2'b00] << 1;
				BCD_array[2'b00][0] = number[i];
			end
		//Overflow Error Check Code.
		//end else begin
		//	BCD_array[2'b00] = 4'hF;
		//	BCD_array[2'b01] = 4'hF;
		//	BCD_array[2'b10] = 4'hF;
		//	BCD_array[2'b11] = 4'hF;
		//end
		
		if(isNegative) begin
			//if(isNegativeRange) begin
				BCD_array[2'b11] = 4'hE;
			//end else begin
			//	BCD_array[2'b11] = 4'hF;
			//end
		end
		BCD = BCD_array[index];//Return desired BCD digit.
	end
	
endmodule 