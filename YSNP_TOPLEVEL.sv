timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly CPE 133
// Engineer: Jacqueline Radding and Carter O'Neill
// 
// Create Date: 08/18/2021 07:57:02 PM
// Design Name: 
// Module Name: YSNP_TOPLEVEL
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module YSNP_TOPLEVEL(
input CLK, //clock
    input [2:0]D, // switches
    input EN, // enable button
    input create, // if 1, create password mode, if 0, enter pass mode
    output [7:0]seg, // seven segment out on display
    output [3:0]an, // an out on display 
    output [2:0]LEDS // LED output to indicate what state of password entering sequence
    
    );
    logic t1, t2, s_clk, out;
    logic [2:0] p1, p2, p3;//password created register memory outputs
    logic [2:0]s1,s2,s3; //password entered register memory outputs
    
    clk_div2 clock_divider(.CLK(CLK), .sclk(s_clk)); // clock dividing module
    FSM_CHECKER FSM_states (.CLK(s_clk), .EN(EN), .LEDS(LEDS), .moore(t1)); // FSM indicates password recorded and entered state
    
    reg_set reg1_c(.CLK(s_clk), .D(D), .EN(EN), .state(1), .moore(t1),.create(create), .Q(p1)); // triggered if create is 1 and FSM is in same password state
    reg_set reg2_c(.CLK(s_clk), .D(D), .EN(EN), .state(2), .moore(t1),.create(create), .Q(p2)); // outputs a three bit password to be compared to matching en state pass
    reg_set reg3_c(.CLK(s_clk), .D(D), .EN(EN), .state(3), .moore(t1),.create(create),.Q(p3)); 

    reg_en reg1_s(.CLK(s_clk), .D(D), .EN(EN), .state(1), .moore(t1),.create(create),.Q(s1)); // triggered if create is 0 and FSM is in same password state
    reg_en reg2_s(.CLK(s_clk), .D(D), .EN(EN), .state(2), .moore(t1),.create(create),.Q(s2)); 
    reg_en reg3_s(.CLK(s_clk), .D(D), .EN(EN), .state(3), .moore(t1),.create(create),.Q(s3));

    comparison_checker pass_comparison(.en_pass1(p1),.set_pass1(s1), .en_pass2(p2),.set_pass2(s2),.en_pass3(p3),.set_pass3(s3), .out(t2)); // compares all equal state created and entered pass
    
    DEC display2 (.CLK(CLK), .Z(t2), .SEGMENTS(seg), .DISP_EN(an)); // Displays OPEN if all passwords sequences match and NOPE when they do not
endmodule


