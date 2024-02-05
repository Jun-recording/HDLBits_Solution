module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] b_in;
    always @(posedge clk) begin
        b_in <= in;
    	pedge <= in & ~b_in;
    end

endmodule
