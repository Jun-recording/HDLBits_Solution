module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] ps, ns;

    // State transition logic (combinational)
    always @(*) begin
        case(ps)
            A : ns = in[3] ? B : A;
            B : ns = C;
            C : ns = D;
            D : ns = in[3] ? B : A;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset)
            ps <= 0;
        else
            ps <= ns;
    end
 
    // Output logic
    assign done = ps[0]&ps[1];

    // New: Datapath to store incoming bytes.
    reg [7:0] r1,r2,r3;
    
    always @(posedge clk) begin
        if (reset)
        	{r1,r2,r3} <= 0;
        else
        	{r1,r2,r3} <= {in,r1,r2};
    end
    
    assign out_bytes = done ? {r3,r2,r1} : 0;

endmodule
