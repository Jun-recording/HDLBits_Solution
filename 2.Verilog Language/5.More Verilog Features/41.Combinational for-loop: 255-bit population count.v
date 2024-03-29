module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    reg [7:0] count;
    integer i;
    always @ (*)
        begin
            count = 0; 
            for(i=0; i<255; i=i+1)
            begin
                if(in[i] == 1)
                count = count+1;
    			else count = count;
            end
            out = count;
        end
    
endmodule
