// Designing in N-bit sign and Unsign FUll adder
/* A,B are N bit,cin-1 bit
  sum[N-2:0]=A[N-2:0]+B[N-2:0]      \this term  gives an carry for N-1 
  sum[N-1]=binary sum with (A[N-1],B[N-1],carry[N-1])
  carry[N]=binary carry -with carry[N-1]=sign^carry[N-1]
// --- Written by Venkata Tarun ---
*/
module Adder_N_bit  #(parameter N=3)   (A,B,cin,sign,Sum,Cout);

input [N-1:0]A,B;
input cin,sign;
output [N-1:0]Sum;
output Cout;

wire [N-1:0]carry;
assign  carry[0]=cin;
reg  intermediate_sum;

wire An,Cn1,carrN;
//full_adder   f0(A[0],B[0],cin,Sum[0],carry[1]);
genvar i;
generate
	for (i=0;i<N-1;i=i+1)
		begin:FA
		Full_Adder FA_(A[i],B[i],carry[i],Sum[i],carry[i+1]);
		end
endgenerate




/*
//N-1 th bit sum,carry  generation
    /*half_adder  half_adder_Nbitadder(An,Cn1,A[N-1],B[N-1]);
    XOR xor_nbit_sign_addition(An,carry[N-1],Sum[N-1]);
    assign Sum[N-1]=An^carry[N-1];
   /* XOR xor_nbit_sign_carry1(sign,carry[N-1],carryN);
    AND not_nbit_sign_carry2(An,carryN,Cout);
    assign Cout=()&(sign^carry[N-1]);
    */ 
   Full_Adder  full_adder_Nbitadder(A[N-1],B[N-1],carry[N-1],Sum[N-1],Cn1);
   
     Full_Adder  full_adder_Nbitadder2(A[N-1],B[N-1],(sign^carry[N-1]),An,Cout);
endmodule
