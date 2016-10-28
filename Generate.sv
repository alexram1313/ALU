`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2016 07:40:09 PM
// Design Name: 
// Module Name: Generate
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


module Generate(
    input op1,
    input op2,
    output s,
    output cout,
    input mode
    );
    logic [127:0] op1;
    logic [127:0] op2;
    logic [127:0] cin;
    logic [127:0] s;
    logic [127:0] cout; 
    
    cin[0]=((opsel == 3'b100) & (~mode))?1:
            ((opsel == 3'b110) & (~mode))?1:0;
    
    genvar i;
    generate
        
        for (i=0;i<127;++i) begin: gen
            cout[i]= cin[i+1];
    end
    endgenerate
endmodule
