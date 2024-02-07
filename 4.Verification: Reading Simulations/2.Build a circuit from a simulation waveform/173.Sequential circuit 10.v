module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    reg ps, ns;
    
    always @(posedge clk) begin
    	ps <= ns;
    end
    
    always @(*) begin
        case(ps)
            0: ns = a&b;
            1: ns = a|b;
        endcase
    end
    
    assign state = ps;
    assign q = ps ? a~^b : a^b; 

endmodule
