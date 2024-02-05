module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
);  
    parameter A=0,Bdu=1,Bud=2,Cdu=3,Cud=4,D=5;
    reg [2:0] ps, ns;
    
    always @(posedge clk) begin
        if (reset) begin
            ps <= A;
        end
        else
            ps <= ns;
    end
    
    always @(*) begin 
        case (ps)
            A: ns = s[1] ? Bdu : A;
            Bdu : ns = s[2] ? Cdu : (s[1] ? Bdu : A);
            Bud : ns = s[2] ? Cdu : (s[1] ? Bud : A);
            Cdu : ns = s[3] ? D : (s[2] ? Cdu : Bud);
            Cud : ns = s[3] ? D : (s[2] ? Cud : Bud);
            D : ns = s[3] ? D : Cud;
            default : ns = A;
        endcase
    end
    
    always @(*) begin
        case (ps)
    		A: {fr3, fr2, fr1, dfr} = 4'b1111;
    		Bdu: {fr3, fr2, fr1, dfr} = 4'b0110;
    		Bud: {fr3, fr2, fr1, dfr} = 4'b0111;
    		Cdu: {fr3, fr2, fr1, dfr} = 4'b0010;
    		Cud: {fr3, fr2, fr1, dfr} = 4'b0011;
    		D: {fr3, fr2, fr1, dfr} = 4'b0000;
            default : {fr3, fr2, fr1, dfr} = 4'b1111;
        endcase
    end
endmodule
