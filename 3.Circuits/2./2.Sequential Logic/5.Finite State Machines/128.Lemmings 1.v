module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter L=0, R=1;
    reg ps, ns;

    always @(*) begin
        // State transition logic
        case(ps)
            L: ns = bump_left ? R : L;
            R: ns = bump_right ? L : R;
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
    assign walk_left = ~ps;
    assign walk_right = ps;

endmodule
