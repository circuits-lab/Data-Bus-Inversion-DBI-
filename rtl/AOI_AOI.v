`ifndef __AOI_AOI_V__
`define __AOI_AOI_V__

module AOI_AOI(i,o);
    input [8:0] i;
    output o;
    wire a1, a2, a3, a4, a5, a6, a7, a8;
    wire n1, n2, n3, n4, aa1, aa2;
    
    and and1(a1,i[8],i[7]);         and and2(a2,i[5],i[6]);          and and3(a3,i[6],i[7]);      and and4(a4,i[5],i[4]);
    and and5(a5,i[4],i[3]);         and and6(a6,i[1],i[2]);          and and7(a7,i[2],i[3]);      and and8(a8,i[1],i[0]);    
    nor nor1(n1,a1,a2);             nor nor2(n2,a3,a4);              nor nor3(n3,a5,a6);          nor nor4(n4,a7,a8);   
    and and9(aa1,n1,n2);            and and10(aa2,n3,n4);    
    nor nor5(o,aa1,aa2);
endmodule

`endif
