`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 09:21:58 PM
// Design Name: 
// Module Name: tb_dff_sync
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


module tb_dff_sync;
    reg clk, rst, D;
    wire Q;

    dff_sync dut(.clk(clk), .rst(rst), .D(D), .Q(Q));

    initial begin clk=0; forever #5 clk=~clk; end

    initial begin
        rst = 1; D = 0;        @(posedge clk);     // reset -> Q=0
        rst = 0; D = 1;        @(posedge clk);     // Q=1
                 D = 0;        @(posedge clk);     // Q=0
        rst = 1;               @(posedge clk);     // sync reset -> Q=0
        rst = 0; D = 1;        @(posedge clk);     // Q=1
        #10 $finish;
    end
endmodule
