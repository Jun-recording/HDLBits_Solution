module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    reg [2:0] ps, ns;
    reg [2:0] r;
    
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

endmodule
