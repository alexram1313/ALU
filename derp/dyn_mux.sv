`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2016 04:24:34 PM
// Design Name: 
// Module Name: dyn_mux
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


module dyn_mux #(NUM_OPTIONS=6, SIZE_SEL=2)(
    input [NUM_OPTIONS:0] m_in,
    input [SIZE_SEL:0] opsel,
    output m_out
    );
    //m_in should be like {b, ~b, 0, ~b, 0, 0, ~b}
    assign m_out = m_in[opsel];
endmodule
