module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );
    
    parameter L=0, R=1, LF=2, RF=3, LD=4, RD=5, oops=6;
    reg [2:0] ps, ns;
    reg [9:0] cnt;

    always @(*) begin
        // State transition logic
        case(ps)
            L: ns = ground ? (dig ? LD : (bump_left ? R : L)) : LF;
            R: ns = ground ? (dig ? RD : (bump_right ? L : R)) : RF;
            LF: ns = ground ? (cnt<20 ? L : oops) : LF;
            RF: ns = ground ? (cnt<20 ? R : oops) : RF;
            LD: ns = ground ? LD : LF;
            RD: ns = ground ? RD : RF;
        	oops: ns = oops;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset)
            cnt <= 0;
        else begin
            if (ps==LF|ps==RF)
            	cnt <= cnt+1;
        	else
            	cnt <= 0;
        end
    end
    
    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset)
        	ps <= L;
        else
            ps = ns;
    end

    // Output logic
    assign walk_left = (ps==oops) ? 0 : ps==L;
    assign walk_right = (ps==oops) ? 0 : ps==R;
    assign aaah = (ps==oops) ? 0 : ps==RF|ps==LF;
    assign digging = (ps==oops) ? 0 : ps==RD|ps==LD;

endmodule
