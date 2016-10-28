`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2016 07:27:42 PM
// Design Name: 
// Module Name: CarryOut_Result1bitALU
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


module CarryOut_Result1bitALU(
input OP1,
    input OP2,
    input cin,
    input [2:0] opsel,
    input mode,
    output result,
    output cout
    );
    
      wire resultL;
      wire resultA;
      wire carryoutA;
      wire carryoutL;
     
      fa L1(
              .a(OP1),
              .b(OP2),
              .cin(cin),
              .opsel(opsel),
              .s(resultA),
              .cout(carryoutA)
              );
            
           LOGIC1BIT L2(
              .opsel(opsel),
              .OP1(OP1),
              .OP2(OP2),
              .cin(cin),
              .result(resultL)  
           );
           
          LOGICCout L3(
              .opsel(opsel),
              .cout(carryoutL),
              .OP1(OP1)
               );
        
          assign cout = (mode == 1'b0)? carryoutA:
                             (mode == 1'b1)? carryoutL:
                             1'bz;
                             
          assign result =  (mode == 1'b0)? resultA:
                           (mode == 1'b1)? resultL:
                            1'bz;
            
endmodule
