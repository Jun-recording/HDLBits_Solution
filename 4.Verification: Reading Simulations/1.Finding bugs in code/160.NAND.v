module top_module (input a, input b, input c, output out);
    wire w_and;
    andgate inst1 ( w_and, a, b, c, 1, 1 );
    assign out = ~w_and;

endmodule
