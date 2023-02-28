`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2023 15:24:38
// Design Name: 
// Module Name: UART
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


module UART(input ld_tx, clk,rst,tx_enable,forward_rx_data,output[7:0] rx_data,output rx_empty);

wire tx_empty;

transmiter   Transmit_dut(clk, tx_enable, rst, ld_tx,tx_empty, tx_out);
receiver   Receiver_dut(clk,rst,tx_out,forward_rx_data,rx_data,rx_empty);


endmodule
