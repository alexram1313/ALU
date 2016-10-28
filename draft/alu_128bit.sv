`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2016 07:40:47 PM
// Design Name: 
// Module Name: alu_128bit
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


module alu_128bit(
    
    input logic [DWIDTH-1: 0] op1,
    input logic [DWIDTH-1: 0] op2,
    input logic [2:0] opsel,
    input logic mode,
    input logic [DWIDTH-1: 0] result,
    input logic c_flag,
    input logic z_flag,
    input logic o_flag,
    input logic s_flag
    );
    parameter DWIDTH = 128;
    logic [DWIDTH -1 :0] cin;
    logic [DWIDTH -1 :0] cout;
    logic [DWIDTH- 1 :0] s;
    
    wire result128;
    wire carryout;
    
    assign cin[0]=((opsel == 3'b100) & (~mode))? 1'b1:
                ((opsel == 3'b110) & (~mode))? 1:1'b0;
                
                
                 CarryOut_Result1bitALU L5(
                               .OP1(op1[0]), 
                               .OP2(op2[0]),
                               .cin(cin[0]),
                               .opsel(opsel),
                               .mode(mode), 
                               .result(result128),
                               .cout(carryout)
                               );
                 assign result[0] = result128;
                 assign cout[0] = carryout;  
            
        
        genvar i;
        generate
            
            for (i = 1; i < DWIDTH; ++i) begin: gen
                assign cin[i] = cout[i-1];
                
                CarryOut_Result1bitALU L1( 
                .OP1(op1[i]), 
                .OP2(op2[i]),
                .cin(cin[i]),
                .opsel(opsel),
                .mode(mode), 
                .result(result),
                .cout(carryout)
                );
                assign result[i] = result128;
                assign cout[i] = carryout;
        end
        endgenerate
        
        assign o_flag = cout[DWIDTH-1];
        assign c_flag = cout[DWIDTH-1];
        assign z_flag = result == 0;
        assign s_flag = result[DWIDTH-1];
        
endmodule
