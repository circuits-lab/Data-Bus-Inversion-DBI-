`ifndef __F0_V__
`define __F0_V__

module F0(i,o);
    input [8:0] i;
    output o;
    wire a1,a2,a3,a4,a5,a6, n1,n2,n3,n4, aa1,aa2;
    
    nand nand1(a1,i[8],i[7]);         nand nand2(a2,i[5],i[6]);          nand nand3(a3,i[6],i[7]);      nand nand4(a4,i[5],i[4]);
    nand nand5(a5,i[4],i[3]);         nand nand6(a6,i[1],i[2]);          nand nand7(a7,i[2],i[3]);      nand nand8(a8,i[1],i[0]);
    
    nand nand9(n1,a1,a2);             nand nand10(n2,a3,a4);             nand nand11(n3,a5,a6);        nand nand12(n4,a7,a8);
    
    nand nand13(aa1,n1,n2);           nand nand14(aa2,n3,n4);
    
    nand nand15(o,aa1,aa2);
endmodule
`endif
