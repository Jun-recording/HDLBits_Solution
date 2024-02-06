module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z );
    
    parameter A=0, B=1, C=2;
    reg [1:0] ps, ns;
     
    always @(*) begin
        case(ps)
    		A : ns = x ? B : A;
        	B : ns = x ? B : C;
        	C : ns = x ? B : A;
            default : ns = A;
        endcase
    end
    
    always @(posedge clk, negedge aresetn) begin
        if (!aresetn)
            ps <= 0;
        else
            ps <= ns;
    end
    
    assign z = ps[1]&x;

endmodule
