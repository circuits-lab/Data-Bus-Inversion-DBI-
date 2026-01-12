`ifndef __ENCODER_V__
`define __ENCODER_V__

module Encoder_top(
    input wire          clk, rst,
    input wire[7:0]     u,
    output wire[8:0]    v
);
    wire[8:0] v_prev;
    Encoder u_enc(.u(u), .v_prev(v_prev), .v(v));
    DFF #(.N(9)) reg_v(.clk(clk), .rst(rst), .d(v), .q(v_prev));
endmodule

module Encoder(
    input wire[7:0]     u,
    input wire[8:0]	    v_prev,
    output wire[8:0]    v
);
    wire toggle;
    assign v[0] = toggle;

    wire[8:0] difference;
    xorArray #(.N(9)) u_diff (.a({u[7:0],1'b0}), .b(v_prev), .out(difference));
    xorArray #(.N(8)) u_inv (.a(u[7:0]), .b({8{toggle}}), .out(v[8:1]));

//  ----------------approximate voter --------------------- 
    `ifdef __AOI_AOI_V__
        AOI_AOI u_voter(difference,toggle);
    `elsif __AOI_NAND_V__
        AOI_NAND u_voter(difference,toggle);
    `elsif __FM_V__
        FM u_voter(difference,toggle);
    `elsif __F0_V__
        F0 u_voter(difference,toggle);
    `elsif __F1_V__
        F0 u_voter(difference,toggle);


// --------------proposed app voter -------------------------
    `elsif __Pro_AOI_I_V__
        Pro_AOI u_voter(difference,toggle);
    `elsif __Pro_AOI_II_V__
        Pro_AOI2 u_voter(difference,toggle);
     

// --------------- majority voter -------------------
    `elsif __MAJ_HIE_V__
        MAJ_HIE u_voter(difference,toggle);
    `elsif __MAJ_MUX_V__
        MAJ_MUX u_voter(difference,toggle);
    `else __MAJ_SYN_V__
        MAJ_SYN u_voter(difference,toggle);
    `endif

endmodule

module xorArray #(parameter N=9) (
    input wire[N-1:0]   a, b,
    output wire[N-1:0]  out
);
    genvar i;
    generate
        for(i=0;i<N;i=i+1) begin: XOR_ARRAY
            xor(out[i],a[i],b[i]);
        end
    endgenerate
endmodule

`endif
