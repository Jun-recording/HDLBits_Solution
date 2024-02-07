module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] count;
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            count <= 2'b01;
        else begin
            if(train_valid&train_taken)
                count <= count==2'b11 ? 2'b11 : count+1;
            else if(train_valid&~train_taken)
                count <= count==2'b00 ? 2'b00 : count-1;
            else
                count <= count;
        end
    end
    
    assign state = count;

endmodule
