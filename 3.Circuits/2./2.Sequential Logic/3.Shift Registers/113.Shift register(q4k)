module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] r;
    
    always @(posedge clk) begin
        if(!resetn)
            r <= 0;
        else
            r <= {in, r[3], r[2], r[1]};
    end

    assign out = r[0];
endmodule
