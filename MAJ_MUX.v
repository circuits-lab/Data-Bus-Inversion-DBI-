`ifndef __MAJ_MUX_V__
`define __MAJ_MUX_V__

//-----------------------Majority voter _ MUX ---------------------

module MAJ_MUX(DQ,out);
input [8:0] DQ;
output out;

wire a[13:1], o[14:1];
wire a1,a2,o1;

	and and21(a1,DQ[0],DQ[1]);	and and22(a2,DQ[3],DQ[4]);	and and23(o1,a1,a2);

	and and31(a[1], DQ[0],DQ[1],DQ[2]);		and and32(a[2], DQ[2],DQ[3],DQ[4]);
	and and24(a[3], a[1],o[1]);			and and25(a[4], a[2],o[2]);

	and and33(a[5],o[3],DQ[0],DQ[1]);		and and34(a[6],o[4],DQ[3],DQ[4]);
	and and35(a[7], DQ[2],o[5],o[6]);


	and and26(a[8], o[10],o[7]);	and and27(a[9], DQ[1],DQ[2]);	and and28(a[10], DQ[2],DQ[3]);
	and and29(a[11], DQ[1],DQ[3]);

	and and36(a[12], DQ[3],DQ[4],a[1]);

	or or30(o[13], a[8],o[12],a[13]);	or or22(o[1],DQ[3],DQ[4]); 		or or23(o[2],DQ[0],DQ[1]);
	or or31(o[3],DQ[2],DQ[3],DQ[4]);	or or32(o[4],DQ[0],DQ[1],DQ[2]);
	or or24(o[5],DQ[0],DQ[1]);		or or25(o[6],DQ[3],DQ[4]);
	or or33(o[7],DQ[1],DQ[2],DQ[3]);

	or or34(o[8],a[3],a[4],o1);			or or35(o[9],a[5],a[6],a[7]);
	or or26(o[10],DQ[0],DQ[4]);
	or or36(o[11],a[9],a[10],a[11]);

	or or27(o[12],o[11],o[11]);
	and and210(a[13],DQ[0],DQ[4]);
	or or37(o[14],o[7],DQ[0],DQ[4]);



	wire M0,M1,M2;
	MUX_4_1 mux1(a[12],o[8],o[8],o[9],   DQ[5],DQ[6],M0);
	MUX_4_1 mux2(o[8],o[9],o[9],o[13],   DQ[5],DQ[6],M1);
	MUX_4_1 mux3(o[9],o[13],o[13],o[14],DQ[5],DQ[6],M2);

	MUX_4_1 mux_out(M0,M1,M1,M2,DQ[7],DQ[8],out);
endmodule


module MUX_4_1(in0,in1,in2,in3,s0,s1,out);
input in0,in1,in2,in3;
input s0,s1;
output out;

wire s0_not,s1_not;
wire a0,a1,a2,a3;

not not1(s0_not,s0);
not not2(s1_not,s1);

and and31(a0, s0_not ,s1_not,in0);
and and32(a1, s0_not, s1    ,in1);
and and33(a2, s0    , s1_not,in2);
and and34(a3, s0    , s1    ,in3);

or or41(out,a0,a1,a2,a3);

endmodule
`endif

