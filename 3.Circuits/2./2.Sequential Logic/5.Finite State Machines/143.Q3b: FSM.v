module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter [2:0] A=0, B=1, C=2, D=3, E=4;
    reg [2:0] ps, ns;
    
    always @(posedge clk) begin
        if(reset)
            ps <= A;
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
        	A: ns = x ? B : A;
            B: ns = x ? E : B;
            C: ns = x ? B : C;
            D: ns = x ? C : B;
            E: ns = x ? E : D;
        endcase
    end
    
    assign z = ps==D | ps==E;

endmodule
