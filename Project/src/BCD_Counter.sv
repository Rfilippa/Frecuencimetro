`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2026 15:34:28
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


module BCD_counter(
    input  logic       clk,
    input  logic       rst,
    input  logic       enb,
    input  logic       signal,
    output logic [3:0] Digit,
    output logic       carry_out
);

    always_ff @(posedge clk) begin 
        if (rst) begin 
            Digit <= 4'd0; 
        end 
        else if (signal && enb) begin 
            if (Digit == 4'd9) begin 
                Digit <= 4'd0;
            end 
            else begin
                Digit <= Digit + 1'b1;
            end
        end else begin
          Digit <= Digit;
        end 
    end
    // debería funcionar
    assign carry_out = enb && signal &&  (Digit == 4'd9);

endmodule
