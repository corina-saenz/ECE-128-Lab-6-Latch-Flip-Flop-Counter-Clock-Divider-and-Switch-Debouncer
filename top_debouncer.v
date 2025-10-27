`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2025 11:45:47 PM
// Design Name: 
// Module Name: top_debouncer
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


module top_debouncer (
    input  wire clk,   
    input  wire btnC,   
    output wire [0:0]Q    
);
    wire clean;
    debouncer u_db (.clk(clk), .btn(btnC), .led(clean));
    assign Q[0] = clean;
endmodule

