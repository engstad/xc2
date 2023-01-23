// -*- mode: verilog -*-

/*
 * 74x00: Quad 2-input NAND gate
 */
module top(A1, B1, Y1,
           A2, B2, Y2,
           A3, B3, Y3,
           A4, B4, Y4);

   (* LOC = "FB1_1" *) input A1;
   (* LOC = "FB1_2" *) input B1;
   (* LOC = "FB1_3" *) output Y1;

   (* LOC = "FB1_4" *) input A2;
   (* LOC = "FB1_5" *) input B2;
   (* LOC = "FB1_6" *) output Y2;

   (* LOC = "FB1_7" *) input A3;
   (* LOC = "FB1_8" *) input B3;
   (* LOC = "FB1_9" *) output Y3;

   (* LOC = "FB1_10" *) input A4;
   (* LOC = "FB1_11" *) input B4;
   (* LOC = "FB1_12" *) output Y4;

   assign Y1 = !(A1 & B1);
   assign Y2 = !(A2 & B2);
   assign Y3 = !(A3 & B3);
   assign Y4 = !(A4 & B4);

endmodule
