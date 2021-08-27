`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly CPE 133
// Engineer: Jacquleine Radding
// 
// Create Date: 08/23/2021 02:48:38 PM
// Design Name: 
// Module Name: reg_set
// Project Name: You Shall Not Pass Digital Lock Box
// Target Devices: Basys3
// Tool Versions: 
// Description: Memory Register with sync load behavior that saves the three bit password when create mode is on and when state matches FSM pass state
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: OPERATES WHEN CREATE IS ON AND INPUTED STATE MATCHES FSM MOORE STATE 
// 
//////////////////////////////////////////////////////////////////////////////////



 module reg_set(
input [2:0] D, //switches
 input CLK, 
 input state, // state trigger, 1-3
 input moore, // moore state indication from FSM
 input create, // if create mode is on
 output logic [2:0]Q, // this is output 3 bit password
 input EN // enter button
 ); 

always_ff @ (posedge CLK) //Register_with_synch_load_behavior
begin
if ((create == 1)&&(EN == 1) && (moore == state)) // if password is in the matching sequence state, record
 Q = D; 
 end
endmodule