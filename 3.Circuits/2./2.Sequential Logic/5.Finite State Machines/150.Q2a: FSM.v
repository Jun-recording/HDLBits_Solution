module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter A=0,B=1,C=2,D=3;
    reg [3:0] ps, ns;
    
    always @(posedge clk) begin
        if(!resetn)
            ps <= 1;
        else
            ps <= ns;
    end
    
    always @(*) begin
        ns[A] = ps[A]&(r==0) | ps[B]&~r[1] | ps[C]&~r[2] | ps[D]&~r[3];
        ns[B] = ps[A]&r[1] | ps[B]&r[1];
        ns[C] = ps[A]&~r[1]&r[2] | ps[C]&r[2];
        ns[D] = ps[A]&~r[1]&~r[2]&r[3] | ps[D]&r[3];
    end
    
    assign g = ps[3:1];

endmodule
