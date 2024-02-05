module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1,w2,sel;
    wire [15:0] w3,w4;
    add16 inst0 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(sel));
    add16 inst1 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(w3), .cout(w1));
    add16 inst2 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(w4), .cout(w2));
    
    always @ (sel)
        begin  
    		case(sel)
        		1'b0:
            		sum[31:16] <= w3;
        		1'b1:
            		sum[31:16] <= w4;
    		endcase
        end

endmodule
