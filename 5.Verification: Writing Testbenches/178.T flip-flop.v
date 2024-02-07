module top_module ();
    reg clk, reset;
    reg t;
    wire q;
    
    tff dut(.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial begin
    	clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
    	reset = 1;
        #20 reset = 0;
        #100 reset = 1;
    end
    
    initial begin
    	t = 0;
        #20 t = 1;
    end
endmodule
