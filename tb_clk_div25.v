`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:42:32 PM
// Design Name: 
// Module Name: tb_clk_div25
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


module tb_clk_div25;
    reg clk_in = 1'b0;
    always #5 clk_in = ~clk_in;

    reg  rst = 1'b1;
    wire clk_out;

    clk_div25 dut (.clk_in(clk_in), .rst(rst), .clk_out(clk_out));

    initial begin
        // hold reset for a few input clocks
        repeat (3) @(posedge clk_in);
        rst = 1'b0;

        // run long enough to see multiple output cycles
        #200 $finish;
    end
endmodule
