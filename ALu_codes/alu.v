
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2023 16:59:59
// Design Name: 
// Module Name: alu
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


module  alu       #(parameter N=5)(A,B,select,Y
 );
input [N-1:0]A,B;
input [1:0] select;
output [2*N-1:0]Y;

wire [N:0]y1,y2;
wire [2*N-1:0]y3;
wire [N-1:0]y4;

Add_Sub_Nbit    #(N) alu1(A,B,0,y1);
Add_Sub_Nbit    #(N)alu2(A,B,1,y2);
Array_MUL_Sign  #(N,N) alu3(A,B,1,y3);
max	            #(N) alu4(A,B,y4);
assign Y=       select[1]
                ?(select[0]? {{(N){y4[N-1]}},y4}:    //select=11   Y=sign extended y4
                                   y3 /*select=10    Y=y3 */):(select[0]?{{(N-1){y2[N]}},y2}://select=01   Y=sign extended y2
                                                                         {{(N-1){y1[N]}},y1});//select=00   Y=sign extended y1
                                         
                                   

endmodule
