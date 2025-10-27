`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2025 11:38:47 PM
// Design Name: 
// Module Name: tb_debouncer
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


module tb_debouncer;
    reg clk = 1'b0;
    reg btn = 1'b0;
    wire led;

    debouncer #(.STABLE_COUNT(50)) dut (.clk(clk), .btn(btn), .led(led));

    always #5 clk = ~clk;

    initial begin
        btn = 0; #200;

        btn=1; #30; btn=0; #20; btn=1; #10; btn=0; #15; btn=1; #10;
        #2000;

        btn=0; #25; btn=1; #10; btn=0; #10;
        #2000;

        #1000 $finish;
    end
endmodule


