`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Carter O'niell
// 
// Create Date: 08/18/2021 03:37:25 PM
// Design Name: 
// Module Name: comparison_checker
// Project Name: You Shall Not Pass Digital Lock Box
// Target Devices: Basys 3
// Tool Versions: 
// Description: compares six three bit created and entered passwords. Compares entered and set paswords 
// of matching FSM states. Outputs a one when they match to the display module, zero if they dont
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparison_checker(
     //input CLK, 
     input logic [2:0] set_pass1, // saved set password for first state from register
     input logic [2:0] set_pass2,// saved set password for second state
     input logic [2:0] set_pass3,
     input logic [2:0] en_pass1,// saved entered password for first state
     input logic [2:0] en_pass2,
     input logic [2:0] en_pass3,
     output logic out // outputs a 1 if all passwords match, zero if they dont
    );
    always_comb
   begin
    if ((set_pass1 == en_pass1) && (set_pass2 == en_pass2) && (set_pass3 == en_pass3)) // compares all state matching passwords
    begin
     out = 1; // if matching
    end
    else
    begin
    out = 0; // if not matching 
    end
    end
endmodule
