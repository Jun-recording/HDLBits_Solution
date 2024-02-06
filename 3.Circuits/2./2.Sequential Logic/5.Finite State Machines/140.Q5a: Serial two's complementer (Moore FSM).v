module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0, B=1, C=2;
    reg [1:0] ps, ns;
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            ps <= 0;
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
            A: ns = x ? B : A;
            B: ns = x ? C : B;
            C: ns = x ? C : B;
            default: ns = A;
        endcase
    end
                
    assign z = ps==B;

endmodule
