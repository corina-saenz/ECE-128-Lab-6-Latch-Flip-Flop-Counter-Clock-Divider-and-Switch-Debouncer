`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 09:31:35 PM
// Design Name: 
// Module Name: tb_dff_async
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

module tb_dff_async;
    reg clk, rst_n, D;
    wire Q;

    dff_async dut(.clk(clk), .rst_n(rst_n), .D(D), .Q(Q));

    initial begin clk=0; forever #5 clk=~clk; end

    initial begin
        rst_n = 0; D = 0;   #3;           // Q=0 immediately
        rst_n = 1;          @(posedge clk);
        D = 1;              @(posedge clk);   // Q=1
        D = 0;              @(posedge clk);   // Q=0

        #2 rst_n = 0;       #4;           // Q snaps to 0 now
           rst_n = 1;       @(posedge clk);
        D = 1;              @(posedge clk);   // Q=1
        #10 $finish;
    end
endmodule
