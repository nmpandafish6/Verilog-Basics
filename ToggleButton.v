`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:41:27 10/22/2015 
// Design Name: 
// Module Name:    ToggleButton 
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
module ToggleButton(
    input toggle,
	 input Clock,
	 input reset,
    output reg enable
    );

reg lastToggleState = 0;//Default to zero.

always @(posedge Clock) begin
	//If the current state doesn't equal the last state and
	//the button is pressed down, return the inverse of the 
	//toggle state.
	//If the button is reset, set the state to default.
	if((toggle != lastToggleState && toggle) || reset) begin
		enable <= !reset ? !enable : 0;
	end
		lastToggleState <= !reset ? toggle : 0;//Store the previous state.
end

endmodule
