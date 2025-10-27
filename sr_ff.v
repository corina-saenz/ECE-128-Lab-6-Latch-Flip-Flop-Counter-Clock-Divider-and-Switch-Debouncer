`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 07:47:13 PM
// Design Name: 
// Module Name: sr_ff
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

module sr_ff (
    input  wire clk,
    input  wire S,   // set
    input  wire R,   // reset
    output reg  Q,
    output wire Qbar
);
    assign Qbar = ~Q;

    initial Q = 1'b0;

    always @(posedge clk) begin
        case ({S,R})
            2'b10: Q <= 1'b1;   // set
            2'b01: Q <= 1'b0;   // reset
            2'b00: Q <= Q;      // hold
            2'b11: Q <= 1'bx;   // forbidden input
            default: Q <= 1'bx;
        endcase
    end
endmodule
