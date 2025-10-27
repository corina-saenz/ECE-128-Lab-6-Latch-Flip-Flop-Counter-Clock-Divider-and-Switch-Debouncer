`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 09:58:28 PM
// Design Name: 
// Module Name: tb_tff
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


module tb_tff;
    reg clk, rst, en, T;
    wire Q;

    tff dut(.clk(clk), .rst(rst), .en(en), .T(T), .Q(Q));

    initial begin clk=0; forever #5 clk=~clk; end

    initial begin
        rst=1; en=1; T=0; @(posedge clk);      // Q -> 0 (sync reset)
        rst=0;

        // Hold (T=0): Q stays 0
        T=0; @(posedge clk);

        // Toggle (T=1): Q toggles on each edge
        T=1; repeat (3) @(posedge clk);        // Q: 0->1->0->1

        // Disable toggling (en=0): Q holds even if T=1
        en=0;        @(posedge clk);           // Q holds
        en=1; T=1;   @(posedge clk);           // Q toggles again

        // Reset again
        rst=1; @(posedge clk); rst=0;

        #10 $finish;
    end
endmodule
