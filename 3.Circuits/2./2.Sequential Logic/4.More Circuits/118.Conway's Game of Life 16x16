module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );
    
    integer i, sum; 
    
    always @(posedge clk) begin
    	if (load) q <= data;
    	else begin
            for (i = 0; i<256; i++) begin
                if (i==0||i==15||i==240||i==255) begin
                    case (i)
                        0: sum = q[255]+q[240]+q[241] +q[15]+q[1] +q[31]+q[16]+q[17];
                        15: sum = q[254]+q[255]+q[240] +q[14]+q[0] +q[30]+q[31]+q[16];
                        240: sum = q[239]+q[224]+q[225] +q[255]+q[241] +q[15]+q[0]+q[1];
                        255: sum = q[238]+q[239]+q[224] +q[254]+q[240] +q[14]+q[15]+q[0];
                    endcase
                end
                else if (i>0 && i<15)
                    sum = q[i+239]+q[i+240]+q[i+241] +q[i-1]+q[i+1] +q[i+15]+q[i+16]+q[i+17];
                else if (i>240 && i<255)
                    sum = q[i-17]+q[i-16]+q[i-15] +q[i-1]+q[i+1] +q[i-241]+q[i-240]+q[i-239];
                else if (i==16||i==32||i==48||i==64||i==80||i==96||i==112||i==128||i==144||i==160||i==176||i==192||i==208||i==224)
                    sum = q[i-1]+q[i-16]+q[i-15] +q[i+15]+q[i+1] +q[i+31]+q[i+16]+q[i+17];
                else if (i==31||i==47||i==63||i==79||i==95||i==111||i==127||i==143||i==159||i==175||i==191||i==207||i==223||i==239)
                    sum = q[i-17]+q[i-16]+q[i-31] +q[i-1]+q[i-15] +q[i+15]+q[i+16]+q[i+1];
                else
                	sum =   q[i-17] +q[i-16] +q[i-15]
                			+q[i-1]            +q[i+1]
                			+q[i+15] +q[i+16] +q[i+17];
            	
                case(sum)
                	0 : q[i] <= 0;
                	1 : q[i] <= 0;
                	2 : q[i] <= q[i];
                	3 : q[i] <= 1;
                	default : q[i] <= 0;
                endcase
            end
        end
    end

endmodule
