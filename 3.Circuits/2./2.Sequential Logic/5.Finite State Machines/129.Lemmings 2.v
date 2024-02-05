module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter L=0, R=1, LF=2, RF=3;
    reg [1:0] ps, ns;

    always @(*) begin
        // State transition logic
        case(ps)
            L: ns = ground ? (bump_left ? R : L) : LF;
            R: ns = ground ? (bump_right ? L : R) : RF;
            LF: ns = ground ? L : LF;
            RF: ns = ground ? R : RF;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset)
        	ps = L;
        else
            ps <= ns;
    end

    // Output logic
    assign walk_left = ps==L;
    assign walk_right = ps==R;
    assign aaah = ps[1];

endmodule
