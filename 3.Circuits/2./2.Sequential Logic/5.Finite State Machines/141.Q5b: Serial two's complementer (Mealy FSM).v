module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0, B=1;
    reg ps, ns;
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            ps <= 0;
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
            A: ns = x ? B : A;
            B: ns = B;
        endcase
    end
                
    always @(*) begin
        case(ps)
            A: z = x;
            B: z= ~x;
        endcase
    end

endmodule
