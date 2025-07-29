`timescale 1ns/100ps
module maj3_p1(a, b, c, y);
  wire t1, t2, t3;
  parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
  and #(tplh1, tphl1)
    (t1, a, b),
    (t2, b, c),
    (t3, c, a);
  or #(tplh2, tphl2) (y, t1, t2, t3);
  localparam
    tplh3=(tplh1>tplh2)?tplh1:tplh2,
    tphl3=(tphl1<tphl2)?tphl1:tphl2;
  wire z [tplh3:0:tphl3];
  function array_a;
    input [0:63] a, b;
    output [0:63] z;
    begin
      z[0] = a[3];
      z[1] = a[1];
      z[2] = a[0];
      z[3] = b[0];
      z[4] = a[5];
      z[5] = a[2];
      z[6] = a[4];
      z[7] = b[1];
      z[8] = a[7];
      z[9] = a[6];
      z[10] = b[2];
      z[11] = a[9];
      z[12] = a[8];
      z[13] = b[3];
      z[14] = a[11];
      z[15] = a[10];
      z[16] = b[4];
      z[17] = a[13];
      z[18] = a[12];
      z[19] = b[5];
      z[20] = a[15];
      z[21] = a[14];
      z[22] = b[6];
      z[23] = a[17];
      z[24] = a[16];
      z[25] = b[7];
      z[26] = a[19];
      z[27] = a[18];
      z[28] = b[8];
      z[29] = a[21];
      z[30] = a[20];
      z[31] = b[9];
      z[32] = a[23];
      z[33] = a[22];
      z[34] = b[10];
      z[35] = a[25];
      z[36] = a[24];
      z[37] = b[11];
      z[38] = a[27];
      z[39] = a[26];
      z[40] = b[12];
      z[41] = a[29];
      z[42] = a[28];
      z[43] = b[13];
      z[44] = a[31];
      z[45] = a[30];
      z[46] = b[14];
      z[47] = a[33];
      z[48] = a[32];
      z[49] = b[15];
      z[50] = a[35];
      z[51] = a[34];
      z[52] = b[16];
      z[53] = a[37];
      z[54] = a[36];
      z[55] = b[17];
      z[56] = a[39];
      z[57] = a[38];
      z[58] = b[18];
      z[59] = a[41];
      z[60] = a[40];
      z[61]