// -*- mode: verilog -*-

/*
 * 74x11: Tripple 3-input AND gate
 */
module top(A1, B1, C1, Y1,
           A2, B2, C2, Y2,
           A3, B3, C3, Y3);

   (* LOC = "FB1_1" *) input A1;
   (* LOC = "FB1_2" *) input B1;
   (* LOC = "FB1_3" *) input C1;
   (* LOC = "FB1_4" *) output Y1;

   (* LOC = "FB1_5" *) input A2;
   (* LOC = "FB1_6" *) input B2;
   (* LOC = "FB1_7" *) input C2;
   (* LOC = "FB1_8" *) output Y2;

   (* LOC = "FB1_9" *) input A3;
   (* LOC = "FB1_10" *) input B3;
   (* LOC = "FB1_11" *) input C3;
   (* LOC = "FB1_12" *) output Y3;

   assign Y1 = (A1 & B1 & C1);
   assign Y2 = (A2 & B2 & C2);
   assign Y3 = (A3 & B3 & C3);

endmodule
