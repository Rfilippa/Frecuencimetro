`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2026 16:35:23
// Design Name: 
// Module Name: LatchR
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

module LatchR(
    input clk,
    input rst,
    input enb,
    input Digits_in_bStream,
    output Digits_out_bStream
    );
  
    flopre #(4) fDigit1 (.clk    (clk),
                         .reset  (rst),
                         .enable (enb),
                         .d      (Digits_in_bStream),
                         .q      (Digits_out_bStream)
                         );
endmodule
