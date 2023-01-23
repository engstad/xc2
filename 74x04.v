// -*- mode: verilog -*-

/*
 * 74x04: Hex (6) inverter gates
 */
module top(A1, Y1,
           A2, Y2,
           A3, Y3,
           A4, Y4,
           A5, Y5,
           A6, Y6);

   (* LOC = "FB1_1" *) input A1;
   (* LOC = "FB1_2" *) output Y1;

   (* LOC = "FB1_3" *) input A2;
   (* LOC = "FB1_4" *) output Y2;

   (* LOC = "FB1_5" *) input A3;
   (* LOC = "FB1_6" *) output Y3;

   (* LOC = "FB1_7" *) input A4;
   (* LOC = "FB1_8" *) output Y4;

   (* LOC = "FB1_9" *) input A5;
   (* LOC = "FB1_10" *) output Y5;

   (* LOC = "FB1_11" *) input A6;
   (* LOC = "FB1_12" *) output Y6;

   assign Y1 = !A1;
   assign Y2 = !A2;
   assign Y3 = !A3;
   assign Y4 = !A4;
   assign Y5 = !A5;
   assign Y6 = !A6;

endmodule
