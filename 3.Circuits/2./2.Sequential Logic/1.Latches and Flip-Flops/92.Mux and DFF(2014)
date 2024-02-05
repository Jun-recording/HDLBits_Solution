module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire m1;
    
    assign m1 = E ? w : Q;
    
    always @(posedge clk) begin
        Q <= L ? R : m1;
    end

endmodule
