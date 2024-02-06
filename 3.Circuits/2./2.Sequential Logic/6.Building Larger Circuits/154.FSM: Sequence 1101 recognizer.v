module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
   
    reg ps, ns;
    reg [2:0] r;
    
    parameter detect=0, start=1;
    
    always@(posedge clk) begin
            if(reset)
                ps <= detect;
            else
                ps <= ns;
         end
    
    always@(posedge clk) begin
            if(reset || ps==start)
                r <= 0;
            else
                r <= {r[1:0], data};
         end
    
    always@(*) begin
            case(ps)
                detect: ns = (r==3'b110 && data) ? start : detect;
                start: ns = start;
            endcase
        end
    
    assign start_shifting = ps;
    
endmodule
