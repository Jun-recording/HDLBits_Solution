module top_module (input x, input y, output z);
    
    //assign z = (x^y) & x;
    assign z = x&(~y);

endmodule
