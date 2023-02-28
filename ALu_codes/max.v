`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2023 17:08:24
// Design Name: 
// Module Name: max
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


module max	#(parameter N=5) (A,B,Max);

input [N-1:0]A,B;
output [N-1:0]Max;
wire [N:0]sub;

Add_Sub_Nbit #(N)   max1(A,B,1,sub);
assign Max=sub[N]?B:A;

endmodule
