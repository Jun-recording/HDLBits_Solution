module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);

    // Modify FSM and datapath from Fsm_serialdata
    parameter idle=0, start=1,
    			data0 = 2,data1 = 3, data2 = 4, data3 = 5, data4 = 6, data5 = 7, data6 = 8, data7 = 9, check = 10,
    			suc = 11, fail = 12;
    reg [3:0] ps, ns;
    
    always @(posedge clk) begin
        if(reset)
            ps <= idle;
        else
            ps <= ns;
    end
    
    always @(*) begin
        case(ps)
        	idle: ns = in ? idle : start;
            start: ns = data0;
            data0: ns = data1;
            data1: ns = data2;
            data2: ns = data3;
            data3: ns = data4;
            data4: ns = data5;
            data5: ns = data6;
            data6: ns = data7;
            data7: ns = check;
            check: ns = odd&in ? suc : (in ? idle : fail);
            suc: ns = in ? idle : start;
            fail: ns = in ? idle : fail;
            default: ns = idle;
        endcase
   	end
    
    assign done = ps==suc;

    //New : parity checking
    reg [9:0] out;
    wire odd_reset, odd;
    
    assign odd_reset = ps==suc|ps==idle;
    parity inst (clk, odd_reset, in, odd);
    
    always @(posedge clk) begin 
        if(reset)
            out <= 0;
        else
            out <= {in, out[9:1]};
    end
    
    assign out_byte = out[7:0];

endmodule
