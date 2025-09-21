module COUNTER_TEST();
wire Qa,Qb,Qc;
reg CLK,RST;
COUNTERMOD6 C1(Qa,Qb,Qc,CLK,RST);
always #10 CLK=~CLK;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, COUNTER_TEST);
RST=1;CLK=0;#20;
RST=0;#20;
#600
$finish;
end
endmodule