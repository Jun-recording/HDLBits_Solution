module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    always @(*) begin
        if(w)
            Y2 = y==3'b001 || y==3'b010 || y==3'b100 || y==3'b101;
        else
            Y2 = y==3'b001 || y==3'b101;
    end

endmodule
