`ifndef __FM_V__
`define __FM_V__

`ifndef __F0_V__
`include "F0.v"
`endif

module FM(i,o);
    input [8:0] i;
    output o;

    wire w1,w2,w3;
    wire [8:0] pi1,pi2;
    assign pi1 = {i[4],i[3],i[5],i[8],i[0],i[6],i[2],i[1],i[7]};
    assign pi2 = {i[1],i[5],i[8],i[2],i[4],i[7],i[6],i[3],i[0]};
    F0 f01(i,w1);
    F0 f02(pi1,w2);
    F0 f03(pi2,w3);
    
    wire na1,na2,na3;
    nand nand1(na1,w1,w2);    nand nand2(na2,w2,w3);    nand nand3(na3,w1,w3);
    nand nand4(o,na1,na2,na3);
endmodule

`endif
