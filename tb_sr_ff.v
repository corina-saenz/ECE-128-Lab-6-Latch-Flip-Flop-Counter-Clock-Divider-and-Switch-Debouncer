`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 07:51:58 PM
// Design Name: 
// Module Name: tb_sr_ff
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

module tb_sr_ff;
    reg clk;
    reg S, R;
    wire Q, Qbar;

    sr_ff dut (.clk(clk), .S(S), .R(R), .Q(Q), .Qbar(Qbar));

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        S = 0; R = 0; @(negedge clk);

        S = 1; R = 0; @(posedge clk);
        S = 0; R = 0; @(posedge clk);
        S = 0; R = 1; @(posedge clk);
        S = 0; R = 0; @(posedge clk);
        S = 1; R = 1; @(posedge clk);
        S = 0; R = 0; @(posedge clk);

        #10 $finish;
    end
endmodule
