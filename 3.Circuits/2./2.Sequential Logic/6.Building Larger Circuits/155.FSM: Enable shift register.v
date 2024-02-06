module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter S1=0,S2=1,S3=2,S4=3,End=4;
    reg [2:0] ps, ns;
    
    always @(posedge clk) begin
        if(reset)
            ps <= S1;
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
            S1: ns = S2;
            S2: ns = S3;
            S3: ns = S4;
            S4: ns = End;
        endcase
    end
    
    assign shift_ena = ~ps[2];

endmodule
