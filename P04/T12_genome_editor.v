`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2026 12:05:03
// Design Name: 
// Module Name: T12_genome_editor
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



module T12_genome_editor(
    input wire clk,rst,edit_request,
    input wire [63:0] genome_in,
    input wire [4:0] edit_position,
    input wire [7:0] replacement,
    output reg [63:0] genome_out,
    output reg edit_success, done 

);
        always @(posedge clk ) begin 
            if(rst) begin
                genome_out <= 64'b0;
                edit_success <= 1'b0;
                done <= 1'b0;
            end
            else if(edit_request) begin
                genome_out[edit_position*8 +: 8] <= replacement;
                edit_success <= 1'b1;
                done <= 1'b1;
            end
            else begin
                edit_success <= 1'b0;
                done <= 1'b0;
            end
        end
endmodule

