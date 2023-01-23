module top(input A, input B, output OUT);
   wire a, b;

   (* LOC = "FB1_1" *) IBUF ibuf_a(.I(A), .O(a));
   (* LOC = "FB1_2" *) IBUF ibuf_b(.I(B), .O(b));

   wire out = a | b;

   (* LOC = "FB1_3" *) OBUF obuf(.I(out), .O(OUT));
endmodule // top
