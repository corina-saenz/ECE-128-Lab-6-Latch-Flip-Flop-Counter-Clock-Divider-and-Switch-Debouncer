`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 06:50:58 PM
// Design Name: 
// Module Name: tb_sr_latch
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

module tb_sr_latch;
    reg S, R;
    wire Q, Qbar;

    sr_latch dut (.S(S), .R(R), .Q(Q), .Qbar(Qbar));

    initial begin
        S = 0; R = 0; #10;   // Initial state (hold)
        S = 1; R = 0; #10;   // Set (Q = 1)
        S = 0; R = 0; #10;   // Hold
        S = 0; R = 1; #10;   // Reset (Q = 0)
        S = 0; R = 0; #10;   // Hold
        S = 1; R = 1; #10;   // Invalid input (both high)
        S = 0; R = 0; #20;   // Back to hold

        $finish;
    end
endmodule
