`ifndef __F1_V__
`define __F1_V__

module F1(i,o);
    input [8:0] i;
    output o;
    wire a1,a2,a3,a4,a5,a6, n1,n2,n3,n4, aa1,aa2;
    
  nor nor1(a1,i[8],i[7]);         nor nor2(a2,i[5],i[6]);          nor nor3(a3,i[6],i[7]);      nor nor4(a4,i[5],i[4]);
  nor nor5(a5,i[4],i[3]);         nor nor6(a6,i[1],i[2]);          nor nor7(a7,i[2],i[3]);      nor nor8(a8,i[1],i[0]);
  nor nor9(n1,a1,a2);            nor nor10(n2,a3,a4);               nor nor11(n3,a5,a6);          nor nor12(n4,a7,a8);
  nor nor13(aa1,n1,n2);            nor nor14(aa2,n3,n4);
  nor nor15(o,aa1,aa2);
endmodule

`endif
