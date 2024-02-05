module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q );
    
    integer i;
    always @(posedge clk) begin
        if(load) q <= data;
        else begin
            q <= (q<<1)^(q>>1);
    	end
    end

endmodule
