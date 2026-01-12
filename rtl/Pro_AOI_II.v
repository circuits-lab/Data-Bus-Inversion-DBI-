`ifndef __Pro_AOI2_V__
`define __Pro_AOI2_V__


//================== Opzimied ==============================================

module Pro_AOI2(i,o);
    input [8:0] i;
    output o;
    wire w1,w2,w3,w4,w5;
    
    AOI AOI1(w1,i[0],i[1],i[2],i[3]);
    AOI AOI2(w2,i[1],i[2],i[3],i[4]);
    AOI AOI3(w3,i[4],i[5],i[6],i[7]);
    AOI AOI4(w4,i[5],i[6],i[7],i[8]);
    AOI AOI5(w5,w1,w2,w3,w4);
    
    wire n11,n22;
    nor nor11(n11,w1,w2);
    nor nor22(n22,w3,w4);
    
    or or11(o,n11,n22,w5);

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
