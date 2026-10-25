module T12_guide_matcher(
    input [15:0] guide,
    input [15:0] window,
    input [1:0] threshold,
    output reg [3:0] mismatch_count, 
    output reg match 
);
    integer i;
    always @(*) begin 
        match = 0;
        mismatch_count = 4'd0; 
        
        for (i = 1; i < 8; i = i + 1) begin 
   
            if (guide[((2*i)-1) -: 1] != window[((2*i)-1) -: 1]) begin 
                mismatch_count = mismatch_count + 1;
            end
        end 
    
        if (mismatch_count <= threshold) begin 
            match = 1;
        end 
    end

endmodule