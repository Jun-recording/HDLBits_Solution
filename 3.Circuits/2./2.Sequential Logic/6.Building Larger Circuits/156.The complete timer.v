module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    //FSM
    reg [2:0] ps, ns;
    reg [2:0] r;
    wire shift_ena;
    
    parameter Detect=0, S1=1, S2=2, S3=3, S4=4, Cnt=5, Done=6;
    
    always@(posedge clk) begin
            if(reset)
                ps <= Detect;
            else
                ps <= ns;
         end
    
    always@(posedge clk) begin
        	if(reset || ps!=Detect)
                r <= 0;
            else
                r <= {r[1:0], data};
         end
    
    always@(*) begin
            case(ps)
                Detect: ns = (r==3'b110 && data) ? S1 : Detect;
                S1: ns = S2;
                S2: ns = S3;
                S3: ns = S4;
                S4: ns = Cnt;
                Cnt: ns = done_counting ? Done : Cnt;
                Done: ns = ack ? Detect : Done;
                default: ns=Detect;
            endcase
        end
    
    assign shift_ena = ps==S1 || ps==S2 || ps==S3 || ps==S4;
    assign counting = ps==Cnt;
    assign done = ps==Done;
    
    //Datapath
    reg [2:0] delay;
    reg [9:0] r_count;
    reg done_counting;
    
    always @(posedge clk) begin
        if(reset)
            delay <= 0;
        else
            delay <= shift_ena ? {delay[1:0], data} : delay;
    end
    
    
    always @(posedge clk) begin
        if(reset) begin
            count <= 0;
        	r_count <= 0;
        	done_counting <= 0;
        end
        else if(ps==S4)
            count <= {delay[2:0], data};
        else if(counting) begin
            r_count <= r_count==10'd999 ? 0 : r_count+1;
            count <= r_count==10'd999 ? count-1 : count;
        	done_counting <= count==0&&r_count==10'd998 ? 1 : 0;
        end
        else
            done_counting <= 0;
    end

endmodule
