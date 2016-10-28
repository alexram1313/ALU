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
    output logic [DWIDTH-1: 0] result,
    output logic c_flag,
    output logic z_flag,
    output logic o_flag,
    output logic s_flag
    );
    parameter DWIDTH = 128;
    logic cin;
    logic [DWIDTH -1 :0] cout;
    

    assign cin = ((opsel == 3'b100) & (~mode))? 1'b1:
                ((opsel == 3'b110) & (~mode))? 1'b1:
                ((opsel == 3'b011) & (~mode))? 1'b1:
                ((opsel == 3'b000) & (~mode))? 1'b0:
                ((opsel == 3'b001) & (~mode))? 1'b0:
                ((opsel == 3'b010) & (~mode))? 1'b0:
                ((opsel == 3'b101) & (~mode))? 1'b0:
                ((opsel == 3'b000) & (mode))? 1'b0:
                ((opsel == 3'b001) & (mode))? 1'b0:
                ((opsel == 3'b010) & (mode))? 1'b0:
                ((opsel == 3'b011) & (mode))? 1'b0:
                ((opsel == 3'b101) & (mode))? 1'b0:
                1'bz;
                
                
                 CarryOut_Result1bitALU L5(
                               .OP1(op1[0]), 
                               .OP2(op2[0]),
                               .cin(cin),
                               .opsel(opsel),
                               .mode(mode), 
                               .result(result[0]),
                               .cout(cout[0])
                               );

        
        genvar i;
        generate
            
            for (i = 1; i < DWIDTH; ++i) begin: gen
             
                CarryOut_Result1bitALU L1( 
                .OP1(op1[i]), 
                .OP2(op2[i]),
                .cin(cout[i-1]),
                .opsel(opsel),
                .mode(mode), 
                .result(result[i]),
                .cout(cout[i])
                );

        end
        endgenerate
        
        assign o_flag = cout[DWIDTH-1];
        assign c_flag = (~mode & ((op1[DWIDTH-1] & op2[DWIDTH-1] & ~result[DWIDTH-1])|(~op1[DWIDTH-1] & ~op2[DWIDTH-1] & result[DWIDTH-1])));
        assign z_flag = result == 0;
        assign s_flag = result[DWIDTH-1];
        
endmodule
