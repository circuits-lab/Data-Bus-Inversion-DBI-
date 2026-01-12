`ifndef __MAJ_HIE_V__
`define __MAJ_HIE_V__
//------------------------------------MAJ_HIE----------------------------------
module MAJ_HIE(DQ,out);
input [8:0]DQ;
output out;
wire INT1;
wire MR7_out,MR7_out_NOT;

MR7_voter MR7(DQ[6:0],MR7_out,INT1);
	NOT not1(MR7_out_NOT,MR7_out);

wire x1,a1,a2,o1,x2;
	xor xor21(x1,DQ[0],DQ[5]);
	and and21(a1,DQ[1],DQ[2]);	and and22(a2,DQ[5],INT1); OR2 or21(o1,a1,a2);
	xor xor22(x2,DQ[5],INT1);

wire DQ3_NOT,x3,na1,na2,a3,a4,o2;
	not not2(DQ3_NOT,DQ[3]);

	xor xor23(x3,x2,DQ[6]);	nand nand21(na1,x2,o1,DQ[6]); 	nand nand22(na2,DQ[6],x2);
	and and23(a3,x1,x3);	and and24(a4,DQ[0],DQ[4]);	or or222(o2,a3,a4);

wire x6,x66,x666,x4,x44,x5,x55,na3,na4;
	not not3(x66,x6); not not4(x666,x66); 	not not5(x44,x4); not not6(x55,x5);

	xor xor24(x6,o1,o2,na2);		xor xor25(x4,DQ3_NOT,na1);	xor xor26(x5,x3,x1);
wire na5;
	nand nand23(na3,x55,DQ3_NOT);	nand nand24(na4,x66,na3,na1);	nand nand25(na5,x666,x44,x55);

wire C11,C2,C3,C1,s;
	xor xor222(C2,MR7_out,DQ[7]);
	xor xor27(C11,DQ[7],DQ[8]);	not noy7(C1,C11);
	nand nand26(C3,na5,na4);	and and25(s,C1,C2,C3);

MUX_2_1 M3(MR7_out,MR7_out_NOT,s,out);

endmodule

//------------------------------------7bit majority voter----------------------------------
module MR7_voter(DQ,out,INT1);
input [6:0] DQ;
output out,INT1;

wire MR5_out,MR5_out_NOT,INT1,INT2;
MR5_voter MR5(DQ[4:0], MR5_out,INT1,INT2);
	not not1(MR5_out_NOT,MR5_out);

wire INT2_NOT;
	not not2(INT2_NOT,INT2);
wire a1,a2,a3,a4,o1,o2,o3,x1;
	and and1(a1,DQ[0],DQ[1]);		and and2(a2,DQ[2],INT2_NOT); 	or or1(o1,a1,a2);
	xor xor1(x1,DQ[2],INT2_NOT);	or or2(o2,x1,DQ[3]);
	and and3(a3,DQ[3],x1);		and and4(a4,o2,DQ[4]);	or or3(o3,a3,a4);

wire C11,C1,C2,C3;
	xor xor2(C11,DQ[5],DQ[6]);		not not3(C1,C11);
	xor xor3(C2,MR5_out,DQ[5]);	xor xor4(C3,o1,o3);

wire s;
	and and31(s,C1,C2,C3);

MUX_2_1 MUX2(MR5_out,MR5_out_NOT,s,out);

endmodule

//------------------------------------5bit majority voter----------------------------------
module MR5_voter(DQ,out,INT1,INT2);
input [4:0] DQ;
output out,INT1,INT2;
    
    wire x1,x2,M0;
    MUX_2_1 Mux0(DQ[1],DQ[0],INT1,M0);
    xor xor21(INT1,DQ[1],DQ[2]);
    xor xor22(x1,DQ[1],DQ[0]);
    xor xor23(x2,DQ[0],DQ[2]);
    wire INT2_2_NOT;
    not not11(INT2,x1);  //INT2 
    not not12(INT2_2_NOT,x2);
    
    wire C11,C1,C2,C3,s;
    xor xor24(C2,M0,DQ[3]);
    xor xor25(C11,DQ[3],DQ[4]);
    not not13(C1,C11);
    nand nand1(C3,INT2,INT2_2_NOT);
    and and32(s,C1,C2,C3);
    
    wire M0_NOT;
    not not14(M0_NOT,M0);
    MUX_2_1 Mux1(M0,M0_NOT,s,out);
    
endmodule

module MUX_2_1(in0,in1,s,out);
    input in0,in1; input s;
    output out;
    wire s_NOT;
    wire a0,a1;
    not not111(s_NOT,s);

    and and21(a0, s_NOT    ,in0);
    and and22(a1, s,in1);

    or or21(out,a0,a1);
endmodule


`endif
