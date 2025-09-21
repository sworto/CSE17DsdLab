module COUNTERMOD6(
output Qa,
output Qb,
output Qc,
input CLK,
input RST
);
wire J1,J2,J3,BLANK1,BLANK2;
JKFF F1(Qa,BLANK1,1'b1,1'b1,RST,CLK);
JKFF F2(Qb,BLANK2,J1,Qa,RST,CLK);
JKFF F3(Qc,J3,J2,Qa,RST,CLK);
and A0(J1,Qa,J3);
and A1(J2,Qb,Qa);
endmodule