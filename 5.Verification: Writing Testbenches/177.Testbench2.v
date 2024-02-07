module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    q7 dut(.clk(clk), .in(in), .s(s), .out(out));
    
    initial begin
    	clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
    	s=2; in=0;
        #10 s=6;
        #10 s=2; in=1;
        #10 s=7; in=0;
        #10 s=0; in=1;
        #30 in=0;
    end

endmodule
