// -*- mode: verilog -*-

/*
 * 74x69: Dual 4-bit binary counter.
 */

//`define USE_XC2
`define USE_T_FLIPFLOP
`define USE_BUFG
`define USE_BUFGSR

module xc2_buf(input I, output O);
   wire pta_or;
   wire or_xor;
   wire xor_out;

   ANDTERM #(.COMP_INP(0), .TRUE_INP(1)) pterm(.IN_B(), .IN({I}), .OUT(pta_or));
   ORTERM #(.WIDTH(1))                   mc_or(.IN(pta_or), .OUT(or_xor));
   MACROCELL_XOR #(.INVERT_OUT(0))       mc_xor(.IN_ORTERM(or_xor), .OUT(xor_out));

   assign O = xor_out;
endmodule

module xc2_inv(input I, output O);
   wire pta_or;
   wire or_xor;
   wire xor_out;

   ANDTERM #(.COMP_INP(0), .TRUE_INP(1)) pterm(.IN_B(), .IN({I}), .OUT(pta_or));
   ORTERM #(.WIDTH(1))                   mc_or(.IN(pta_or), .OUT(or_xor));
   MACROCELL_XOR #(.INVERT_OUT(1))       mc_xor(.IN_ORTERM(or_xor), .OUT(xor_out));

   assign O = xor_out;
endmodule

module xc2_and(input A, input B, output O);
   wire pta_or;
   wire or_xor;
   wire xor_out;

   ANDTERM #(.COMP_INP(0), .TRUE_INP(2)) pterm(.IN_B(), .IN({A, B}), .OUT(pta_or));
   ORTERM #(.WIDTH(1))                   mc_or(.IN(pta_or), .OUT(or_xor));
   MACROCELL_XOR #(.INVERT_OUT(0))       mc_xor(.IN_ORTERM(or_xor), .OUT(xor_out));

   assign O = xor_out;
endmodule

module xc2_or(input A, input B, output O);
   wire pta_or;
   wire ptb_or;
   wire or_xor;
   wire xor_out;

   ANDTERM #(.COMP_INP(0), .TRUE_INP(1)) pterm1(.IN_B(), .IN({A}), .OUT(pta_or));
   ANDTERM #(.COMP_INP(0), .TRUE_INP(1)) pterm1(.IN_B(), .IN({B}), .OUT(ptb_or));
   ORTERM #(.WIDTH(2))                   mc_or(.IN({pta_or, ptb_or}), .OUT(or_xor));
   MACROCELL_XOR #(.INVERT_OUT(0))       mc_xor(.IN_ORTERM(or_xor), .OUT(xor_out));

   assign O = xor_out;
endmodule

module xc2_xor(input A, input B, output O);
   wire pto_or;
   wire or_xor;
   wire ptc_xor;
   wire xor_ff;

   ANDTERM #(.COMP_INP(0), .TRUE_INP(1)) pto(.IN_B(), .IN({A}), .OUT(pto_or));
   ORTERM #(.WIDTH(1))                   mc_or(.IN(pto_or), .OUT(or_xor));
   ANDTERM #(.COMP_INP(0), .TRUE_INP(1)) ptc(.IN_B(), .IN({B}), .OUT(ptc_xor));
   MACROCELL_XOR #(.INVERT_OUT(0))       mc_xor(.IN_ORTERM(or_xor), .IN_PTC(ptc_xor), .OUT(O));
endmodule

module counter_bit_0(input CLK, input CLR, output OUT);
   wire toggle;

`ifdef USE_XC2
   xc2_buf x2_buf(.I(OUT), .O(toggle));
`else
   assign toggle = OUT;
`endif

   FTCP #(.INIT(0)) mc(.C(CLK), .PRE(0), .CLR(CLR), .T(toggle), .Q(OUT));
endmodule

module counter_bit_n(input T, input CLK, input CLR, output OUT);
   wire ff_d;
   wire ff_q;

`ifdef USE_T_FLIPFLOP
`ifdef USE_XC2
   xc2_buf xc2buf(.I(T), .O(ff_d));
`else
   assign ff_d = T;
`endif
   FTCP #(.INIT(0)) mc(.C(CLK), .PRE(0), .CLR(CLR), .T(ff_d), .Q(ff_q));
`else
`ifdef USE_XC2
   xc2_xor xc2xor(.A(T), .B(ff_q), .O(ff_d));
`else
   assign ff_d = T ^ ff_q;
`endif

   FDCP #(.INIT(0)) mc(.C(CLK), .PRE(0), .CLR(CLR), .D(ff_d), .Q(ff_q));
`endif // !`ifdef USE_T_FLIPFLOP

   assign PTERM = pto_or;
   assign OUT = ff_q;
endmodule

module top(CLKA1, OA1, OB1, OC1, OD1, nCLR1, CLKB1,
           //CLKA2, OA2, OB2, OC2, OD2, NCLR2, CLKB2,
           );

   // Clocks
   (* LOC = "FB2_5" *) input CLKA1;
   (* LOC = "FB2_7" *) input CLKB1;
   // Clears
   (* LOC = "FB1_8" *) input nCLR1;


   wire  clk_a1;
   wire  clk_b1;
   wire  clr_1;

   `ifdef USE_BUFG
   BUFG bufg0(.I(CLKA1), .O(clk_a1));
   BUFG bufg1(.I(CLKB1), .O(clk_b1));
   `else
   assign clk_a1 = CLKA1;
   assign clk_b1 = CLKB1;
   `endif
   `ifdef USE_BUFGSR
   BUFGSR #(.INVERT(1)) bufgsr(.I(nCLR1), .O(clr_1));
   `else
   assign clr_1 = !nCLR1;
   `endif

   //(* LOC = "FB2_7" *) input CLKA2;
   //(* LOC = "FB2_8" *) input CLKB2;

   (* LOC = "FB1_1" *) output OA1;
   (* LOC = "FB1_2" *) output OB1;
   (* LOC = "FB1_3" *) output OC1;
   (* LOC = "FB1_4" *) output OD1;

   counter_bit_0 cb0(.CLK(clk_a1), .CLR(clr_1), .OUT(OA1));
   counter_bit_n cb1(.CLK(clk_b1), .CLR(clr_1), .OUT(OB1), .T(OA1));
   counter_bit_n cb2(.CLK(clk_b1), .CLR(clr_1), .OUT(OC1), .T(OB1 & OA1));
   counter_bit_n cb3(.CLK(clk_b1), .CLR(clr_1), .OUT(OD1), .T(OC1 & OB1));

endmodule
