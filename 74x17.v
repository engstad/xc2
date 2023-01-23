// -*- mode: verilog -*-

/*
 * 74x04: Hex (6) buffer gates (open-drain).
 */
module top(A1, Y1,
           A2, Y2,
           A3, Y3,
           A4, Y4,
           A5, Y5,
           A6, Y6);

   (* LOC = "FB1_1" *) input A1;
   (* LOC = "FB1_2" *) inout Y1;

   (* LOC = "FB1_3" *) input A2;
   (* LOC = "FB1_4" *) inout Y2;

   (* LOC = "FB1_5" *) input A3;
   (* LOC = "FB1_6" *) inout Y3;

   (* LOC = "FB1_7" *) input A4;
   (* LOC = "FB1_8" *) inout Y4;

   (* LOC = "FB1_9" *) input A5;
   (* LOC = "FB1_10" *) inout Y5;

   (* LOC = "FB1_11" *) input A6;
   (* LOC = "FB1_12" *) inout Y6;

   //(* LOC = "FB1_13" *) input E;

   // wire T1, T2, T3, T4, T5, T6;

   // IOBUFE buf1(.I(A1), .IO(Y1), .O(T1));
   // IOBUFE buf2(.I(A2), .IO(Y2), .O(T2));
   // IOBUFE buf3(.I(A3), .IO(Y3), .O(T3));
   // IOBUFE buf4(.I(A4), .IO(Y4), .O(T4));
   // IOBUFE buf5(.I(A5), .IO(Y5), .O(T5));
   // IOBUFE buf6(.I(A6), .IO(Y6), .O(T6));

   IOBUFE buf1(.I(A1), .IO(Y1));
   IOBUFE buf2(.I(A2), .IO(Y2));
   IOBUFE buf3(.I(A3), .IO(Y3));
   IOBUFE buf4(.I(A4), .IO(Y4));
   IOBUFE buf5(.I(A5), .IO(Y5));
   IOBUFE buf6(.I(A6), .IO(Y6));

endmodule
