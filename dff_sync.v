`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 09:20:50 PM
// Design Name: 
// Module Name: dff_sync
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


module dff_sync (
    input  wire clk,
    input  wire rst,    
    input  wire D,
    output reg  Q
);
    always @(posedge clk) begin
        if (rst)  Q <= 1'b0;   
        else      Q <= D;
    end
endmodule