`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/11/2025 17:03:45 PM
// Design Name:
// Module Name: flopre
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


module flopre #(parameter N=64)(
  input  logic              clk,
  input  logic              reset,
  input  logic              enable,
  input  logic [N-1:0]  d,
  output logic [N-1:0]  q
);
  always_ff @(posedge clk, posedge reset) begin
    if (reset)  q <= '0;
    else if (enable) q <= d;
    else q <= q;
  end
endmodule
