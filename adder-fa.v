// `define DO_COMB

module xc2_fa(input wire A, input wire B, input wire Cin,
              output wire S, output wire Cout);

`ifdef DO_COMB
   assign S = A ^ B ^ Cin;
   assign Cout = ((A ^ B) & Cin) | (A & B);
`else
   wire                   pt0, pt1, pt2, pt3, pt4;
   wire                   or_cout;
   wire                   or_add;

   // Cout = (A*B'*Cin + A'*B*Cin + A*B
   ANDTERM #(.COMP_INP(1), .TRUE_INP(2)) pt_c0(.IN({A, Cin}), .IN_B({B}), .OUT(pt0));
   ANDTERM #(.COMP_INP(1), .TRUE_INP(2)) pt_c1(.IN({B, Cin}), .IN_B({A}), .OUT(pt1));
   ANDTERM #(.COMP_INP(0), .TRUE_INP(2)) pt_c2(.IN({A, B}), .IN_B(), .OUT(pt2));

   ORTERM #(.WIDTH(3)) ot_cry(.IN({pt0, pt1, pt2}), .OUT(or_cout));
   MACROCELL_XOR #(.INVERT_OUT(0)) mc_cry(.IN_ORTERM(or_cout), .OUT(Cout));
   // R = A'*B*Cin + A*B'*Cin + A*B*Cin' + A'*B'*Cin'
   ANDTERM #(.COMP_INP(1), .TRUE_INP(2)) pt_x0(.IN({A, B}), .IN_B({Cin}), .OUT(pt3));
   ANDTERM #(.COMP_INP(3), .TRUE_INP(0)) pt_x1(.IN(), .IN_B({A,B,Cin}), .OUT(pt4));
   ORTERM #(.WIDTH(4)) ot_add(.IN({pt0, pt1, pt3, pt4}), .OUT(or_add));
   MACROCELL_XOR #(.INVERT_OUT(0)) mc_add(.IN_ORTERM(or_add), .OUT(S));
`endif
endmodule

module top(a0, a1, a2, a3, a4, a5, a6, a7,
           b0, b1, b2, b3, b4, b5, b6, b7, c0,
           s0, s1, s2, s3, s4, s5, s6, s7, s8);

   output s0, s1, s2, s3, s4, s5, s6, s7, s8;

   (* LOC = "FB1_1" *) input a0;
   (* LOC = "FB1_2" *) input a1;
   (* LOC = "FB1_3" *) input a2;
   (* LOC = "FB1_4" *) input a3;
   (* LOC = "FB1_5" *) input a4;
   (* LOC = "FB1_6" *) input a5;
   (* LOC = "FB1_7" *) input a6;
   (* LOC = "FB1_8" *) input a7;

   (* LOC = "FB1_9" *) input b0;
   (* LOC = "FB1_10" *) input b1;
   (* LOC = "FB1_11" *) input b2;
   (* LOC = "FB1_12" *) input b3;
   (* LOC = "FB1_13" *) input b4;
   (* LOC = "FB1_14" *) input b5;
   (* LOC = "FB1_15" *) input b6;
   (* LOC = "FB1_16" *) input b7;

   (* LOC = "FB3_1" *) input c0;

   wire r0, r1, r2, r3, r4, r5, r6, r7;
   wire c1, c2, c3, c4, c5, c6, c7, c8;

   xc2_fa fa0(.A(a0), .B(b0), .Cin(c0), .S(r0), .Cout(c1));
   xc2_fa fa1(.A(a1), .B(b1), .Cin(c1), .S(r1), .Cout(c2));
   xc2_fa fa2(.A(a2), .B(b2), .Cin(c2), .S(r2), .Cout(c3));
   xc2_fa fa3(.A(a3), .B(b3), .Cin(c3), .S(r3), .Cout(c4));

   xc2_fa fa4(.A(a4), .B(b4), .Cin(c4), .S(r4), .Cout(c5));
   xc2_fa fa5(.A(a5), .B(b5), .Cin(c5), .S(r5), .Cout(c6));
   xc2_fa fa6(.A(a6), .B(b6), .Cin(c6), .S(r6), .Cout(c7));
   xc2_fa fa7(.A(a7), .B(b7), .Cin(c7), .S(r7), .Cout(c8));

   (* LOC = "FB2_1" *) OBUF o0(.I(r0), .O(s0));
   (* LOC = "FB2_2" *) OBUF o1(.I(r1), .O(s1));
   (* LOC = "FB2_3" *) OBUF o2(.I(r2), .O(s2));
   (* LOC = "FB2_4" *) OBUF o3(.I(r3), .O(s3));
   (* LOC = "FB2_5" *) OBUF o4(.I(r4), .O(s4));
   (* LOC = "FB2_6" *) OBUF o5(.I(r5), .O(s5));
   (* LOC = "FB2_7" *) OBUF o6(.I(r6), .O(s6));
   (* LOC = "FB2_8" *) OBUF o7(.I(r7), .O(s7));
   (* LOC = "FB2_9" *) OBUF oc(.I(c8), .O(s8));

   // 10,11,12,13,14,15,16
endmodule
