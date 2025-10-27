`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:10:51 PM
// Design Name: 
// Module Name: counter3_tff
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


module counter3_tff (
    input  wire clk,
    input  wire rst,   
    input  wire en,    
    output wire [2:0] Q  
);
    wire q0, q1, q2;

    wire t0 = 1'b1;          
    wire t1 = q0;            
    wire t2 = q1 & q0;       

    tff u0 (.clk(clk), .rst(rst), .en(en), .T(t0), .Q(q0));
    tff u1 (.clk(clk), .rst(rst), .en(en), .T(t1), .Q(q1));
    tff u2 (.clk(clk), .rst(rst), .en(en), .T(t2), .Q(q2));

    assign Q = {q2, q1, q0};
endmodule
