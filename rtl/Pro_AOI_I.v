`ifndef __Pro_AOI_I_V__
`define __Pro_AOI_I_V__

module Pro_AOI_I(i,o);
    input [8:0] i;
    output o;
    wire a1,a2,a3,a4,a5,a6, n1,n2,n3,n4, aa1,aa2;
    wire w1,w2,w3,w4w5;
   
    AOI AOI1(w1,i[0],i[1],i[2],i[3]);
    AOI AOI2(w2,i[1],i[2],i[3],i[4]);
    AOI AOI3(w3,i[4],i[5],i[6],i[7]);
    AOI AOI4(w4,i[5],i[6],i[7],i[8]);
    AOI AOI5(w5,w1,w2,w3,w4);

    //Command case_MSB
    nand and11(n11,i[8],i[7]);        nand and12(n22,i[6],i[5]);
    nor and13(an1,n11,n22);
    
    nor or1(x1, i[4],i[3]);         nor or2(x2, i[2],i[1]);     
    nand or3(o1,x1,x2);
    or or4(no1,o1,i[0]);
    and and14(nan, an1,no1);
    
 //Command case_LSB
    wire nn1,nn2,xx1,xx2,oo1,nno1,nnan,ann1;    
    nand and15(nn1,i[0],i[1]);         nand and16(nn2,i[2],i[3]);
    nor and17(ann1,nn1,nn2);
    nor or5(xx1, i[4],i[5]);         nor or6(xx2, i[6],i[7]);     
    nand or7(oo1,xx1,xx2);
    or or8(nno1,oo1,i[8]);
    and and18(nnan, ann1,nno1);
    
    wire aoiaoi_M;
    or or9(aoiaoi_M,nan,w5);
    or or10(o,nnan,aoiaoi_M);
  
endmodule

module AOI(out,in1,in2,in3,in4);
    input in1,in2,in3,in4;
    output out;
    wire w1,w2,w3;
    and(w1,in1,in2);
    and(w2,in3,in4);
    or(w3,w1,w2);
    not(out,w3);
endmodule

`endif
