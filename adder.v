module top(a0,a1,a2,a3,
           b0,b1,b2,b3,
           cin,
           s0,s1,s2,s3,
           cout);

   output s0;   // 2_
   output s1;   // 2_
   output s2;   // 1_
   output s3;   // 2_
   output cout; // 2_

   (* LOC = "FB1_4" *) input a0;
   (* LOC = "FB1_5" *) input a1;
   (* LOC = "FB1_6" *) input a2;
   (* LOC = "FB1_7" *) input a3;

   (* LOC = "FB1_8" *) input b0;
   (* LOC = "FB1_9" *) input b1;
   (* LOC = "FB1_10" *) input b2;
   (* LOC = "FB1_11" *) input b3;
   (* LOC = "FB1_12" *) input cin;

   reg r0, r1, r2, r3, rc;

   // assign {cout, s3, s2, s1, s0} ={a3,a2,a1,a0} - {b3,b2,b1,b0} - cin;
   assign {rc, r3, r2, r1, r0} ={a3,a2,a1,a0} + {b3,b2,b1,b0} + cin;

   //assign {cout, s3, s2, s1, s0} = {rc, r3, r2, r1, r0};

   (* LOC = "FB1_1"  *) OBUF o0(.I(r0), .O(s0));
   (* LOC = "FB1_2"  *) OBUF o1(.I(r1), .O(s1));
   (* LOC = "FB1_3"  *) OBUF o2(.I(r2), .O(s2));
   (* LOC = "FB1_13" *) OBUF o3(.I(r3), .O(s3));
   (* LOC = "FB2_1" *) OBUF  oc(.I(rc), .O(cout));

endmodule
