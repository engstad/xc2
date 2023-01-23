// -*- mode: verilog -*-

/*
 * 74x42: BCD to decimal decoder
 */
module top(A, B, C, D,
           Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9);

   (* LOC = "FB1_1" *) input A;
   (* LOC = "FB1_2" *) input B;
   (* LOC = "FB1_3" *) input C;
   (* LOC = "FB1_4" *) input D;
   (* LOC = "FB1_5" *) output Y0;
   (* LOC = "FB1_6" *) output Y1;
   (* LOC = "FB1_7" *) output Y2;
   (* LOC = "FB1_8" *) output Y3;
   (* LOC = "FB1_9" *) output Y4;
   (* LOC = "FB1_10" *) output Y5;
   (* LOC = "FB1_11" *) output Y6;
   (* LOC = "FB1_12" *) output Y7;
   (* LOC = "FB1_13" *) output Y8;
   (* LOC = "FB1_14" *) output Y9;

   wire[3:0] bcd = { D, C, B, A };

   assign Y0 = (bcd == 4'd0) ? 1'b1 : 1'b0;
   assign Y1 = (bcd == 4'd1) ? 1'b1 : 1'b0;
   assign Y2 = (bcd == 4'd2) ? 1'b1 : 1'b0;
   assign Y3 = (bcd == 4'd3) ? 1'b1 : 1'b0;
   assign Y4 = (bcd == 4'd4) ? 1'b1 : 1'b0;
   assign Y5 = (bcd == 4'd5) ? 1'b1 : 1'b0;
   assign Y6 = (bcd == 4'd6) ? 1'b1 : 1'b0;
   assign Y7 = (bcd == 4'd7) ? 1'b1 : 1'b0;
   assign Y8 = (bcd == 4'd8) ? 1'b1 : 1'b0;
   assign Y9 = (bcd == 4'd9) ? 1'b1 : 1'b0;

endmodule
