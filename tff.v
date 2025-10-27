`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 09:57:23 PM
// Design Name: 
// Module Name: tff
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


module tff (
    input  wire clk,
    input  wire rst,   
    input  wire en,    
    input  wire T,
    output reg  Q
);
    always @(posedge clk) begin
        if (rst)      Q <= 1'b0;
        else if (en)  Q <= (T ? ~Q : Q);
        else          Q <= Q;
    end
endmodule
