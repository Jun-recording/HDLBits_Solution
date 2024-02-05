module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);	
    reg [31:0] b_in;
    integer i;
    
    always @(posedge clk) begin
        b_in <= in;
        if (reset)
            out <= 0;
        else
            for (i = 0; i<32; i = i+1)
                out[i] <= out[i] ? out[i] : b_in[i]&~in[i];         
    end

endmodule
