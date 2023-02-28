`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:35:50 10/05/2012 
// Design Name: 
// Module Name:    uart_rx 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uart_rx(tx_data,   bd_clk,  rst,  forward_rx_data,  rx_data,  rx_empty);

// Port declarations
input        tx_data;
input        rst; 
input        bd_clk; 
output reg   [7:0] rx_data; 
input        forward_rx_data; 
output reg   rx_empty; 



// Internal Variables 
reg [7:0]    rx_reg;
reg [3:0]    rx_cnt  =0 ; 
reg state=0;


//Defining states
always@(posedge bd_clk )     begin
if (rst) begin
state=0;
rx_cnt=0;end




if(!tx_data)begin
    state<=!rx_cnt[3];          //if rx_count >=8,then then in the next count , stage=0 
    end    
    
if(rx_cnt[3]==1'b1 && tx_data)begin
    state<=0;
    rx_cnt<=0;
    rx_data=forward_rx_data?rx_reg:rx_data; 
    end
    
//state machines             
 case(state)
      0:rx_empty=1;
      1:begin
   //rx_empty=0;
   //rx_reg[7]=tx_data;
   //rx_cnt=rx_cnt+1; 
   //rx_reg=rx_cnt[3]?rx_reg:rx_reg>>1;
        rx_empty=0;
        rx_reg[rx_cnt]=tx_data;
        rx_cnt<=rx_cnt+1; 
      end
//default:rx_empty=1;

endcase

             
                                              
 /*                                   OR
                                case(state)
                                     0:rx_empty=1;
                                     1:begin
                                     rx_empty=0;
                                     rx_data[rx_cnt]=tx_data;
                                     rx_cnt=rx_cnt+1; 
                                        end
                                endcase
*/      
                                             
                                              
                                              
                                               end
endmodule
