`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:43:53 PM
// Design Name: 
// Module Name: clk_div25
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


module clk_div25 (
    input  wire clk_in,   // 100 MHz
    input  wire rst,      // active-high sync reset
    output reg  clk_out   // 25 MHz
);
    reg [0:0] cnt; 

    always @(posedge clk_in) begin
        if (rst) begin
            cnt     <= 1'b0;
            clk_out <= 1'b0;
        end else begin
            if (cnt == 1'b1) begin
                cnt     <= 1'b0;
                clk_out <= ~clk_out; // toggle every 2 cycles -> 25 MHz
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end
endmodule
