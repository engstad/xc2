// -*- mode: verilog -*-

/*
 * 74x10: Dual 4-input NAND gate
 */
module top(A1, B1, C1, D1, Y1,
           A2, B2, C2, D2, Y2);

   (* LOC = "FB1_1" *) input A1;
   (* LOC = "FB1_2" *) input B1;
   (* LOC = "FB1_3" *) input C1;
   (* LOC = "FB1_4" *) input D1;
   (* LOC = "FB1_5" *) output Y1;

   (* LOC = "FB1_6" *) input A2;
   (* LOC = "FB1_7" *) input B2;
   (* LOC = "FB1_8" *) input C2;
   (* LOC = "FB1_9" *) input D2;
   (* LOC = "FB1_10" *) output Y2;

   assign Y1 = !(A1 & B1 & C1 & D1);
   assign Y2 = !(A2 & B2 & C2 & D2);

endmodule
