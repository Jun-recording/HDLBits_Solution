module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);	
    assign Y0 = ((y[2]|y[0])&~x) | (~y[2]&~y[0]&x);
    assign z = y==3'b100 || y==3'b011;

endmodule
