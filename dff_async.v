`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 09:29:27 PM
// Design Name: 
// Module Name: dff_async
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


module dff_async (
    input  wire clk,
    input  wire rst_n,  
    input  wire D,
    output reg  Q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) Q <= 1'b0; 
        else        Q <= D;
    end
endmodule
