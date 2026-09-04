`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2026 16:15:27
// Design Name: 
// Module Name: Frequency_meter
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


module Frequency_meter(
    input clk,
    input reset,
    input freq_in,
    output [7:0] D0_SEG,
    output [3:0] D0_AN
    );

    logic [13:0] cnt_display;
    logic [15:0] Digit_bStream; 
    logic tick_1ms, cnt_en, cnt_rst, latch_en;
    logic [3:0] Dig1, Dig2, Dig3, Dig4;
    
    // para detectar solo el edge :) 
    logic freq_sync_0, freq_sync_1, freq_sync_2;
    always_ff @(posedge clk) begin
        freq_sync_0 <= freq_in;
        freq_sync_1 <= freq_sync_0;
        freq_sync_2 <= freq_sync_1;
    end
    logic freq_edge;
    assign freq_edge = freq_sync_1 && !freq_sync_2;

    BaseTime1ms Base1 (.clk_in   (clk),
                       .rst      (reset),
                       .tick_out (tick_1ms)
                       );


    FSM_Control Control_Unit (.clk      (clk),
                              .rst      (reset),
                              .tick_1ms (tick_1ms),
                              .cnt_en   (cnt_en),
                              .cnt_rst  (cnt_rst),
                              .latch_en (latch_en)
                              );


    Serial_BCD_Counter Signal_Counter (.clk    (clk),
                                       .rst    (cnt_rst),
                                       .enb    (cnt_en),
                                       .Signal (freq_edge),
                                       .Dig1   (Dig1),
                                       .Dig2   (Dig2),
                                       .Dig3   (Dig3), 
                                       .Dig4   (Dig4)
                                       );


    LatchR Latch (.clk               (clk),
                  .rst               (reset),
                  .enb               (latch_en),
                  .Digits_in_bStream  ({Dig1, Dig2, Dig3, Dig4}),
                  .Digits_out_bStream (Digit_bStream)
                  );


    disp7seg_controller dispA(  .clk(cnt_display[13]),
                                .bcd_dig({
                                    Digit_bStream[15:12],
                                    Digit_bStream[11:7],
                                    Digit_bStream[7:4],
                                    Digit_bStream[3:0]
                                    }), // Aca se deben conectar los BCD de salida del LATCH
                                .blank_dig(4'b0000),
                                .seg(D0_SEG),
                                .dig_en(D0_AN));
                               
                                

    always @(posedge clk) cnt_display <= cnt_display + 1;


endmodule






