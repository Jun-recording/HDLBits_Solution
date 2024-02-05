module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] w;
    
    	genvar i;
        bcd_fadd inst0(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(w[0]), .sum(sum[3:0]));
    generate
        //genvar i;
        //bcd_fadd inst0(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(w[0]), .sum(sum[3:0]));
        for(i=1; i<100; i=i+1)
            begin : gend_bcd_fadd
                bcd_fadd inst1(.a(a[4*i+3:4*i]), .b(b[4*i+3:4*i]), .cin(w[i-1]), .cout(w[i]), .sum(sum[4*i+3:4*i]));
            end
    endgenerate
    
    assign cout = w[99];

endmodule
