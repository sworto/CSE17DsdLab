module JKFF(
	output reg Q,
	output reg Qbar,
	input J,
	input K,
	input RST,
	input CLK
);
initial Q=0;
always@(posedge CLK)
if(RST==1)
	begin
	Q<=0;
	Qbar<=1;
	end
else
	begin
	case({J,K})
	2'b00: begin Q<=Q; Qbar<=Qbar; end
	2'b01: begin Q<=0; Qbar<=1; end
	2'b10: begin Q<=1; Qbar<=0; end
	2'b11: begin Q<=~Q; Qbar<=~Qbar; end
	endcase
	end
endmodule