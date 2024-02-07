module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output predict_taken,
    output reg [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);
    reg [1:0] PHT[127:0];
    
    always @(posedge clk, posedge areset) begin
        if (areset)
            for (integer i=0; i<128; i=i+1) 
                PHT[i] <= 2'b01;
        else begin
            if(train_valid&train_taken)
                PHT[train_pc^train_history] <= PHT[train_pc^train_history]==2'b11 ? 2'b11 : PHT[train_pc^train_history]+1;
        	else if (train_valid&~train_taken)
                PHT[train_pc^train_history] <= PHT[train_pc^train_history]==2'b00 ? 2'b00 : PHT[train_pc^train_history]-1;
            else
                PHT[train_pc^train_history] <= PHT[train_pc^train_history];
        end
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset)
            predict_history <= 0;
        else begin
            if(train_valid&train_mispredicted)
                predict_history <= {train_history[5:0], train_taken};
            else if(predict_valid)
                predict_history <= {predict_history[5:0], predict_taken};
            else 
                predict_history <= predict_history;
        end
    end
    
    assign predict_taken =  PHT[predict_pc^predict_history][1];

endmodule
