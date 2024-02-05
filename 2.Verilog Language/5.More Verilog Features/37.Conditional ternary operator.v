module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7 : 0] w1,w2;
    assign w1 = (a<b) ? a : b;
    assign w2 = (c<d) ? c : d;
    assign min = (w1<w2) ? w1 : w2;

endmodule
