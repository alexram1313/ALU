`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2016 09:14:17 PM
// Design Name: 
// Module Name: LOGICCout
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


module LOGICCout(
    input [2:0] opsel,
    output cout,
    input OP1
    );
    
        
      assign cout = (opsel == 3'b000)? 1'b0:
                        (opsel == 3'b001)? 1'b0:
                        (opsel == 3'b010)? 1'b0:
                        (opsel == 3'b011)? 1'b0:
                        (opsel == 3'b101)? OP1:
                        1'bz;
   
    
endmodule
