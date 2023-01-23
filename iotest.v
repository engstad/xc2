module top(IN, INOUT, OUT);
   (* LOC = "FB1_1" *) inout INOUT;
   (* LOC = "FB1_2", SCHMITT_TRIGGER = "TRUE" *) input IN;
   (* LOC = "FB1_3", SLEW = "FAST" *) output OUT;

   wire out_out;

   IOBUFE iobuf(.I(IN), .O(out_out), .IO(INOUT));
   OBUF obuf(.I(out_out), .O(OUT));
endmodule // top
