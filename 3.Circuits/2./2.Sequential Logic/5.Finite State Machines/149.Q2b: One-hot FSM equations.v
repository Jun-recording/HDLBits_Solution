module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    
    always @(*) begin
        Y1 = y[A]&w;
        Y3 = (y[B]|y[C]|y[E]|y[F])&~w;
    end

endmodule
