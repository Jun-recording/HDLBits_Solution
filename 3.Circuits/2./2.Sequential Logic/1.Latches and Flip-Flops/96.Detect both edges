module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] b_in;
    
    always @(posedge clk) begin
    	b_in <= in;
        anyedge <= ~in&b_in | in&~b_in;
    end

endmodule
