`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2025 11:14:30 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer #(
    parameter integer STABLE_COUNT = 1_000_000
)(
    input  wire clk,     
    input  wire btn,     
    output reg  led = 1'b0 
);

    reg s0, s1;
    always @(posedge clk) begin
        s0 <= btn;
        s1 <= s0;
    end

    reg [19:0] count = 20'd0;  // 2^20 > 1_000_000

    always @(posedge clk) begin
        if (s1 == led) begin
            count <= 20'd0;                 
        end else begin
            if (count == STABLE_COUNT-1) begin
                led   <= s1;                
                count <= 20'd0;
            end else begin
                count <= count + 1'b1;
            end
        end
    end
endmodule

