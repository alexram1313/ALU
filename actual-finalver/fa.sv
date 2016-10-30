`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2016 02:20:33 PM
// Design Name: 
// Module Name: fa
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


module fa(
    input a,
    input b,
    input cin,
    input [2:0] opsel,
    output s,
    output cout
    );
    
    wire b_op = (opsel == 3'b000)?b:
                (opsel == 3'b110)?b:
                (opsel == 3'b101)?1'b1:
                (opsel == 3'b001)?~b:
                (opsel == 3'b011)?~b:
                (opsel == 3'b111)?1'bz:0;
                
                
        
    
    assign s = a ^ b_op ^ cin;
    assign cout = (a&b_op)|(b_op&cin)|(a&cin);
endmodule
