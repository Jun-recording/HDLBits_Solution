module top_module (input x, input y, output z);
    wire w1, w2, w3, w4, w5, w6;
    
    A inst0(.x(x), .y(y), .z(w1));
    B inst1(.x(x), .y(y), .z(w2));
    A inst2(.x(x), .y(y), .z(w3));
    B inst3(.x(x), .y(y), .z(w4));
    
    or (w5, w1, w2);
    and (w6, w3, w4);
    xor (z, w5, w6);

endmodule

module B( input x, input y, output z );
    assign z= ~(x^y);
endmodule

module A(input x, input y, output z);
    assign z = (x^y) & x;
endmodule
