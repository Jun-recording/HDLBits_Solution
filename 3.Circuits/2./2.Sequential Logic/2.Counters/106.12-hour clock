module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss);
    
    reg en_m, en_h;
    
    cnt60 ss0 (clk, reset, ena, ss);
    cnt60 mm0 (clk, reset, en_m, mm);
    cnt12 hh0 (clk, reset, en_h, hh);
    
    always @(posedge clk) begin
        if (reset) begin
        	pm <= 0;
            en_m <= 0;
            en_h <= 0;
        end
        else begin
            if (ena) begin
            	en_m <= ss==8'h58 ? 1 : 0;
                en_h <= (mm==8'h59)&(ss==8'h58) ? 1 : 0;
                pm <= (mm==8'h59)&(ss==8'h59)&(hh==8'h11) ? ~pm : pm; 
            end
            else begin
            	en_m <= 0;
                en_h <= 0;
                pm <= pm;
            end
        end
    end

endmodule

module cnt60 (
	input clk, reset,
    input enable,
    output reg [7:0] q
	);
    reg [3:0] q1,q0;
    always @(posedge clk) begin
        if (reset | enable&(q1==5)&(q0==9))
        {q1, q0} <= 0;
        else
            if (enable) begin
                q0 <= q0==9 ? 0 : q0+1;
                q1 <= q0==9 ? q1+1 : q1;
            end
        	else begin
                q1 <= q1;
                q0 <= q0;
            end
    end
    
    assign q = {q1, q0};
endmodule

module cnt12 (
	input clk, reset,
    input enable,
    output reg [7:0] q
	);
    always @(posedge clk) begin
        if (reset)
            q <= 8'h12;
        else
            if(enable) begin
                if(q==8'h12)
                    q <= 8'h01;
                else begin
                    q[3:0] <= q[3:0]==9 ? 0 : q[3:0]+1;
                	q[7:4] <= q[3:0]==9 ? q[7:4]+1 : q[7:4];
                end
            end
        	else
                q <= q;
    end
endmodule
