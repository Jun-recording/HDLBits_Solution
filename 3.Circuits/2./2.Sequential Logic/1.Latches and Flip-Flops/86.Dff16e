module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        if (!resetn)
            q <= 0;
        else
            case(byteena)
            	0: q <= q;
                1: {q[15:8], q[7:0]} <= {q[15:8], d[7:0]};
                2: {q[15:8], q[7:0]} <= {d[15:8], q[7:0]};
                3: {q[15:8], q[7:0]} <= {d[15:8], d[7:0]};
            endcase
    end

endmodule
