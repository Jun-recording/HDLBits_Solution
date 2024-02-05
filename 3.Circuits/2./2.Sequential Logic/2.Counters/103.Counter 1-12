module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
    wire [3:0] c_q;
    
    always @(*) begin
        if (reset) begin
            c_enable <= 0;
            c_load <= 1;
            c_d <= 1;
        end
        else begin
            if (enable) begin
            	c_enable <= 1;
        		c_load <= c_q ==12 ? 1: 0;
                c_d <= 1;
            end
        	else begin
                c_enable <= 0;
                c_load <= 0;
            end
        end
    end
    
    assign Q = c_q;

    count4 the_counter (clk, c_enable, c_load, c_d, c_q);

endmodule
