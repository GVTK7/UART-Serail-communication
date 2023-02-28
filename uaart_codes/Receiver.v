module  receiver(clk,rst,tx_data,forward_rx_data,rx_data,rx_empty);
input clk,rst,tx_data,forward_rx_data;
output [7:0]rx_data;
output rx_empty;

//Receiver clk
wire   baud_clk  ; // set Baud rate as rxbd_clk clock frequency   
uart_tx_clk    baud_clk_dut1434(clk, baud_clk);//uart baud_clock

uart_rx  uart_7seg_dsply(tx_data,   baud_clk,  rst,  forward_rx_data, rx_data,  rx_empty);//uart module




endmodule