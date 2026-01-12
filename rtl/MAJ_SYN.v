`ifndef __MAJ_SYN_V__
`define __MAJ_SYN_V__

//--------Majority voter_synthesis
module MAJ_SYN(i,o);
    input [8:0] i;
    output o;
    
    wire [3:0] count;
    
    assign count=i[8]+i[7]+i[6]+i[5]+i[4]+i[3]+i[2]+i[1]+i[0];
    assign o=(count>4) ? 1'b1 : 1'b0;
    
endmodule

`endif
