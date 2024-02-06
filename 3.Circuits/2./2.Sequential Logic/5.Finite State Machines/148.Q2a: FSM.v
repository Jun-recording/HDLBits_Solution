module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    reg [5:0] ps, ns;
    
    always @(posedge clk) begin
        if(reset)
            ps <= 1;
        else
            ps <= ns;
    end
    
    always @(*) begin
        ns[A] = ps[A]&~w | ps[D]&~w;
        ns[B] = ps[A]&w;
        ns[C] = ps[B]&w | ps[F]&w;
        ns[D] = (ps[B]|ps[C]|ps[E]|ps[F])&~w;
        ns[E] = ps[C]&w | ps[E]&w;
        ns[F] = ps[D]&w;
    end
    
    assign z = ps[E] | ps[F];

endmodule
