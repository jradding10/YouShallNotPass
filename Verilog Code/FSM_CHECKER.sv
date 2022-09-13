`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly CPE 133
// Engineer: Jacqueline Radding
// 
// Create Date: 08/19/2021 01:09:49 PM
// Design Name: 
// Module Name: FSM_CHECKER
// Project Name: You Shall Not Pass Digital Lock Box
// Target Devices: 
// Tool Versions: 
// Description: FSM indicates the state of the password entered, 0-3. This triggers numbered registers to store the entered or created password(s).
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: works with a seq divider. 
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_CHECKER(
   input EN, // enter button
    input CLK, // clock from clock divider
    output logic [2:0]LEDS, // LED password state indication
    output logic moore  // password recording state
    );
 parameter [1:0] a = 2'd0;
     logic [1:0] b = 2'd1;
     logic [1:0] c = 2'd2;
     logic [1:0] d = 2'd3;
     logic [2:0] e = 3'd4;
    logic [2:0] f = 3'd5;
    logic [1:0] NS;
    logic [1:0] PS = a;
        //sequential logic to change states
    always_ff @ (posedge CLK) // reset add
    begin
         PS = NS;
    end
    
always_comb 
    begin
    moore = 0;
    LEDS = 3'b001; //LEDs inicate password entering sequence one
    case (PS)//This is going to be the case where the button is pressed
    
        a: // first password entering state
        begin
        LEDS = 3'b001;
        moore = 0; //moore outputs depend only on state. Indicates the number of passwsords recorded to the code to trigger registers
          if (EN ==1) // if enable is presssed
          begin
                NS = b;
                 end
           else // if no enable pressed, stay in the same state
          begin
                NS = a;
                 end
         end
                  
         b: // second password entering state
         begin
           LEDS = 3'b011; // LED indication of second password entering state 
            moore = 1; // moore indicates the password recording state
            if (EN ==1)
            begin
                NS = c;
            end
             else 
          begin
               NS = b;
                 end
         end

         c: // third entering state
         begin
            moore = 2; // moore indicates the second password recorded state
            LEDS = 3'b111; // indicates third password entering sequence
            if (EN ==1)
            begin
                NS = d;
            end
            else 
          begin
               NS = c;
                 end       
         end
         
          d: // finished entering state
         begin
            moore = 3; // moore indicates the third password recorded state
            LEDS = 3'b111; // LED indication of finished entering
            if (EN ==1) // entering to move to a state again
            begin
                NS = a;
            end
          else 
          begin
               NS = d; 
                 end
         end
         default:
            NS = a;
      endcase    
      end
      


endmodule
