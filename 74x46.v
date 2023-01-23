// -*- mode: verilog -*-

/*
 * 74x46: BCD to seven-segment decoder
 */
module top(D, C, B, A,
           Oa, Ob, Oc, Od, Oe, Of, Og);

   (* LOC = "FB1_1" *) input D;
   (* LOC = "FB1_2" *) input C;
   (* LOC = "FB1_3" *) input B;
   (* LOC = "FB1_4" *) input A;
   (* LOC = "FB1_5" *) output Oa;
   (* LOC = "FB1_6" *) output Ob;
   (* LOC = "FB1_7" *) output Oc;
   (* LOC = "FB1_8" *) output Od;
   (* LOC = "FB1_9" *) output Oe;
   (* LOC = "FB1_10" *) output Of;
   (* LOC = "FB1_11" *) output Og;

   wire[3:0] x = { D, C, B, A };

   localparam H = 1'b1;
   localparam _ = 1'b0;

   //    +-a-+
   //    f   b
   //    +-g-+
   //    e   c
   //    +-d-+
   //                                                 a. b. c. d. e. f. g.



   assign {Oa, Ob, Oc, Od, Oe, Of, Og} = (x ==  0) ? { H, H, H, H, H, H, _ } :
                                         (x ==  1) ? { _, H, H, _, _, _, _ } :
                                         (x ==  2) ? { H, H, _, H, H, _, H } :
                                         (x ==  3) ? { H, H, H, H, _, _, H } :
                                         (x ==  4) ? { _, H, H, _, _, H, H } :
                                         (x ==  5) ? { H, _, H, H, _, H, H } :
                                         (x ==  6) ? { _, _, H, H, H, H, H } : // Note: a not on
                                         (x ==  7) ? { H, H, H, _, _, _, H } :
                                         (x ==  8) ? { H, H, H, H, H, H, H } :
                                         (x ==  9) ? { H, H, H, _, _, H, H } : // Note: d not on
                                         (x == 10) ? { _, _, _, H, H, _, H } :
                                         (x == 11) ? { _, _, H, H, _, _, H } :
                                         (x == 12) ? { _, H, _, _, _, H, H } :
                                         (x == 13) ? { H, _, _, H, _, H, H } :
                                         (x == 14) ? { _, _, _, H, H, H, H } :
                                         (x == 15) ? { _, _, _, _, _, _, _ } : 0;


endmodule
