module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter idle=0, cnt1=1, D=2, F=3, E=4;
    reg [2:0] ps, ns;
    reg [2:0] count;
    
    always @(posedge clk) begin
        if(reset)
            ps <= idle;
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
        	idle: ns = in ? cnt1 : idle;
            cnt1: begin
                if((count<5)&~in)
                    ns = idle;
                else if(count==5&~in)
                    ns = D;
                else if(count==6)
                    ns = in ? E : F;
                else
                    ns = cnt1;
            end
            D: ns = in ? cnt1 : idle;
            F: ns = in ? cnt1 : idle;
            E: ns = in ? E : idle;
        endcase
    end
    
    assign {disc, flag, err} = {ps==D, ps==F, ps==E};
    
    always @(posedge clk) begin
        case(ps)
        	idle: count <= 1;
            cnt1: count <= count+1;
            default: count <= 1;
        endcase
    end

endmodule
