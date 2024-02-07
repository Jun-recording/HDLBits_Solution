module top_module();
    reg [1:0] in;
    wire out;
    
    andgate dut(.in(in), .out(out));
    
    initial begin
    	in = 0;
        #10 in = in+1;
        #10 in = in+1;
        #10 in = in+1;
    end

endmodule
