module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] q0, q1, q2;
    assign c_enable[0] = 1;
    assign c_enable[1] = q0 == 9 ? 1 : 0;
    assign c_enable[2] = (q1 == 9)&(q0 == 9) ? 1 : 0;
    bcdcount counter0 (clk, reset, c_enable[0], q0);
    bcdcount counter1 (clk, reset, c_enable[1], q1);
    bcdcount counter2 (clk, reset, c_enable[2], q2);
    
    assign OneHertz = (q2 == 9)&(q1 == 9)&(q0 == 9);

endmodule
