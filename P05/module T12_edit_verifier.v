module T12_edit_verifier(
    input wire clk, rst , verify_request,
    input wire[63:0] genome_original, genome_edited,
    input wire [4:0] edit_position,
    input wire [7:0] replacement,
    output reg verify_pass, done,
    output reg [5:0] mismatch_count
);
    always @(posedge clk ) begin 
        if(rst) begin
            verify_pass <= 0;
            done <= 0;
            mismatch_count <= 0;
        end 
        else if(verify_request) begin
            mismatch_count <= 0;
            for(integer i = 0; i < 64; i = i + 1) begin
                if(i == edit_position) begin
                    if(genome_edited[i*8 +: 8] != replacement) begin
                        mismatch_count <= mismatch_count + 1;
                    end
                end 
                else begin
                    if(genome_original[i*8 +: 8] != genome_edited[i*8 +: 8]) begin
                        mismatch_count <= mismatch_count + 1;
                    end
                end
            end
        verify_pass <= (mismatch_count == 0);
        done <= 1;
        end 
        else begin
            done <= 0;
        end
    end 
endmodule