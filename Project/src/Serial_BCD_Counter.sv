`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2026 16:35:23
// Design Name: 
// Module Name: Serial_BCD_Counter
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

module Serial_BCD_Counter(
    input clk,
    input enb,
    input rst,
    input Signal,
    output [3:0] Dig1,
    output [3:0] Dig2,
    output [3:0] Dig3,
    output [3:0] Dig4
    );
    
    logic carry1, carry2, carry3;

    BCD_counter Counter1 (.clk       (clk),
                          .rst       (rst),
                          .enb       (enb),
                          .signal    (Signal),
                          .Digit     (Dig1),
                          .carry_out (carry1));
  
    BCD_counter Counter2 (.clk       (clk),
                          .rst       (rst),
                          .enb       (enb),
                          .signal    (carry1),
                          .Digit     (Dig2),
                          .carry_out (carry2));

    BCD_counter Counter3 (.clk       (clk),
                          .rst       (rst),
                          .enb       (enb),
                          .signal    (carry2),
                          .Digit     (Dig3),
                          .carry_out (carry3));

    BCD_counter Counter4 (.clk       (clk),
                          .rst       (rst),
                          .enb       (enb),
                          .signal    (carry3),
                          .Digit     (Dig4),
                          .carry_out ());

endmodule
