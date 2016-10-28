`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2016 08:56:02 AM
// Design Name: 
// Module Name: LOGIC1BIT
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


module LOGIC1BIT(
    input [2:0] opsel,
    input OP1,
    input OP2,
    input cin,
    output result
    );
    
    assign result =   (opsel == 3'b000)? OP1&OP2:
                      (opsel == 3'b001)? OP1|OP2:
                      (opsel == 3'b010)? OP1^OP2:
                      (opsel == 3'b011)? ~OP1:
                      (opsel == 3'b101)? cin:
                       1'bz;
endmodule
