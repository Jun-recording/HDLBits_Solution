module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] bw; 
    wire w1, w2;
    assign bw = b^{32{sub}};
    add16 inst0 (.a(a[15:0]), .b(bw[15:0]), .cin(sub), .sum(sum[15:0]), .cout(w1));
    add16 inst1 (.a(a[31:16]), .b(bw[31:16]), .cin(w1), .sum(sum[31:16]));

endmodule
