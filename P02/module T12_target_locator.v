module T12_target_locator(
    input wire clk , rst , start , target_found,
    input wire [63:0] genome ,
    input wire [15:0] guide ,
    input wire [1:0] threshold,
    output reg [4:0] target_position,
    output reg [3:0] mismatch_count,  
    output reg done  
);
    integer i;
    always @(posedge clk ) begin 

        if(start) begin 
            for(i=63, i>15, i=i-1) begin 
                if(genome[i:i-15] == guide) begin 
                    target_position <= i;
                    done <= 1;
                end 
                else if(genome[i:i-15] != guide) begin 
                    mismatch_count <= mismatch_count + 1;
                end
            end 
        end
        else if(rst) begin
            target_position <= 0;
            mismatch_count <= 0;
            done <= 0;
        end
    end
endmodule