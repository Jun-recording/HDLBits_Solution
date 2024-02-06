module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);	
    parameter A=0, B=1;
    reg ps, ns;
    reg [2:0] reg_w;
    reg [1:0] cnt_clk;
    
    always @(posedge clk) begin
        if(reset)
        	ps <= A;    
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
        	A: ns = s ? B : A;
            B: ns = B;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            reg_w <= 0;
        else
            reg_w <= ps==B ? {w,reg_w[2:1]} : reg_w;
    end
    
    always @(posedge clk) begin
        if(reset)
            cnt_clk <= 0;
        else
            if(ps==B)
                cnt_clk <= cnt_clk==2 ? 0 : cnt_clk+1;
        	else
                cnt_clk <= cnt_clk;
    end
    
    assign z = cnt_clk==0 & (reg_w==3'b110 | reg_w==3'b101 | reg_w==3'b011);
endmodule
