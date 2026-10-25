`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2026 11:23:07
// Design Name: 
// Module Name: test2
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


module T12_genome_window_generator(
    input wire clk ,
    input wire rst,
    input wire [15:0] fragment , 
    input wire fragment_valid,
    output reg [15:0] window ,
    output reg window_valid
);

    always @(posedge clk ) begin 
    window_valid=0;
        if(fragment_valid) begin 
            window= fragment;
            window_valid=1;
        end 
        if( rst ) begin
            window= 0; 
            window_valid=0;
    end 
endmodule