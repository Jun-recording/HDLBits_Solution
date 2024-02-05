module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    cnt cnt1(clk, reset, 1, q[3:0]);
    cnt cnt2(clk, reset, ena[1], q[7:4]);
    cnt cnt3(clk, reset, ena[2], q[11:8]);
    cnt cnt4(clk, reset, ena[3], q[15:12]);
    assign ena = {q[3:0]==9&q[7:4]==9&q[11:8]==9, q[3:0]==9&q[7:4]==9, q[3:0]==9};

endmodule

module cnt (
    input clk,
    input reset,        // Synchronous active-high reset
    input en,
    output [3:0] q);
    
     always @(posedge clk) begin
        if(reset)
            q <= 0;
        else begin
            if (en) begin
            	if (q == 9)
                	q <= 0;
         		else
            		q <= q+1;
            end
            else 
                q <= q;
        end 
     end

endmodule
