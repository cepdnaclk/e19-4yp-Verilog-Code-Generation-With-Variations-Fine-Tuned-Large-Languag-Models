* Add a top level file:

module tst_nm_in_top();
  tst_nm_in tst_nm_in_q1 = new(0);
  tst_nm_in tst_nm_in_q2 = new(1);
  tst_nm_in tst_nm_in_q3 = new(2);
  initial $monitor($time, "tst_nm_in_q1.in = %b, tst_nm_in_q1.out = %b, tst_nm_in_q2.in = %b, tst_nm_in_q2.out = %b, tst_nm_in_q3.in = %b, tst_nm_in_q3.out = %b",tst_nm_in_q1.in,tst_nm_in_q1.out,tst_nm_in_q2.in,tst_nm_