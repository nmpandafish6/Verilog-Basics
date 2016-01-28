  `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    09:28:16 10/14/2015 
// Module Name:    uint14to4bcd 
// Description: 	 Converter for decimal numbers to binary coded decimal numbers (bcd)
//////////////////////////////////////////////////////////////////////////////////

		/*
		 * Note : Algorithm for decimal to bcd was borrowed from
		 *			http://www.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html
		 *			Algorithm was modified to account for digits up to 16834 but should be
		 *			further modified in external code for board specific needs such as the max
		 *			decimal number able to be accounted for is 9999. 
		 *			Further testing will be done with other algorithms for educational purposes,
		 *			however this algorithm will likely be more efficient than one that I can think
		 *			of myself.
		 */
		 
module uint16to4bcd(
    output reg [3:0] BCD,
	 input [1:0] index,
    input [15:0] uint16	//Number
    );
	 

	integer i;
	reg [3:0] BCD_array [0:3];
	always @(uint16) begin
		if(uint16 > 9999) begin
			BCD_array[2'b00] = 4'hF;
			BCD_array[2'b01] = 4'hF;
			BCD_array[2'b10] = 4'hF;
			BCD_array[2'b11] = 4'hF;
		end else begin 
			BCD_array[2'b00] = 4'd0;
			BCD_array[2'b01] = 4'd0;
			BCD_array[2'b10] = 4'd0;
			BCD_array[2'b11] = 4'd0;
			
			for(i = 15; i >=0; i = i - 1) begin
				//Add 3 if bcd is >= 5
				if(BCD_array[2'b11] >= 5)
					BCD_array[2'b11] = BCD_array[2'b11] + 3;
				if(BCD_array[2'b10] >= 5)
					BCD_array[2'b10] = BCD_array[2'b10] + 3;
				if(BCD_array[2'b01] >= 5)
					BCD_array[2'b01] =BCD_array[2'b01] + 3;
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
				BCD_array[2'b00][0] = uint16[i];
			end
		end
		BCD = BCD_array[index];//Return desired BCD Digit.
	end
	
endmodule
