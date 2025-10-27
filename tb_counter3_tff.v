`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:13:22 PM
// Design Name: 
// Module Name: tb_counter3_tff
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


module tb_counter3_tff;
    reg clk, rst, en;
    wire [2:0] Q;

    counter3_tff dut(.clk(clk), .rst(rst), .en(en), .Q(Q));

    initial begin clk=0; forever #5 clk=~clk; end

    initial begin
        // Reset then enable
        rst=1; en=0; @(posedge clk);                   
        rst=0; en=1;

        // Count for 10 cycles
        repeat (10) @(posedge clk);

        // Q holds
        en=0; repeat (3) @(posedge clk);

        // Resume for a few more counts
        en=1; repeat (5) @(posedge clk);

        // Reset during run
        rst=1; @(posedge clk); rst=0;
        repeat (3) @(posedge clk);

        #10 $finish;
    end
endmodule
