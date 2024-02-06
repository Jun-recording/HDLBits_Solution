module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6;
    reg [2:0] ps, ns;
    reg [1:0] reg_x;
    
    always @(posedge clk) begin
        if(!resetn)
            ps <= A;
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
            A: ns = B;
            B: ns = C;
            C: ns = reg_x==2'b01 ? (x ? D : C) : C;
            D: ns = y ? F : E;
            E: ns = y ? F : G;
            F: ns = F;
            G: ns = G;
            default: ns = A;
        endcase
    end
    
    always @(posedge clk) begin
        if(!resetn)
            reg_x <= 0;
        else if(ps==C)
            reg_x <= {x, reg_x[1]};
        else
            reg_x <= 0;
    end
    
    assign f = ps==B;
    assign g = ps==D | ps==E | ps==F;

endmodule
