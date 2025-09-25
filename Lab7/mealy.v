module mealy(output reg dout, input din, rst, clk);
    reg [1:0] state;
    parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
    initial dout=0;

    always@(posedge clk)
    begin
        if(rst==1)
        begin
            state<=s0;
            dout<=0;
        end
        else
        begin
            case(state)
                s0: begin
                    if(din==1)
                    begin state<=s1; dout<=0; end
                    else
                    begin state<=s0; dout<=0; end
                end

                s1: begin
                    if(din==1)
                    begin state<=s1; dout<=0; end
                    else
                    begin state<=s2; dout<=0; end
                end

                s2: begin
                    if(din==1)
                    begin state<=s3; dout<=0; end
                    else
                    begin state<=s0; dout<=0; end
                end

                s3: begin
                    if(din==1)
                    begin state<=s1; dout<=1; end
                    else
                    begin state<=s2; dout<=0; end
                end

                default: begin
                    dout<=0;
                    state<=s0;
                end
            endcase
        end
    end
endmodule
