`ifndef __Pro_AOI2_V__
`define __Pro_AOI2_V__


//================== Opzimied ==============================================

module Pro_AOI2(i,o);
    input [8:0] i;
    output o;
    wire w1,w2,w3,w4,w5;
    
    AOI22 AOI1(w1,i[0],i[1],i[2],i[3]);
    AOI22 AOI2(w2,i[1],i[2],i[3],i[4]);
    AOI22 AOI3(w3,i[4],i[5],i[6],i[7]);
    AOI22 AOI4(w4,i[5],i[6],i[7],i[8]);
    AOI22 AOI5(w5,w1,w2,w3,w4);
    
    wire n11,n22;
    nor nor11(n11,w1,w2);
    nor nor22(n22,w3,w4);
    
    or or11(o,n11,n22,w5);

endmodule

`endif
