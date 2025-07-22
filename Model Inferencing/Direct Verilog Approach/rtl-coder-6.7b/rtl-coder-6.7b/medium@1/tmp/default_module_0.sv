module tb_8(s,ca,a,b);
  input s,ca,a,b; output s,ca;
  parameter max_delay=2;
  localparam max_idx = max_delay-1;
  ha_8 h1(.s(s[0]),.ca(ca[0]),.a(a[0]),.b(b[0]));
  ha_8 h2(.s(s[1]),.ca(ca[1]),.a(a[1]),.b(b[1]));
  ha_8 h3(.s(s[2]),.ca(ca[2]),.a(a[2]),.b(b[2]));
  ha_8 h4(.s(s[3]),.ca(ca[3]),.a(a[3]),.b(b[3]));
  ha_8 h5(.s(s[4]),.ca(ca[4]),.a(a[4]),.b(b[4]));
  ha_8 h6(.s(s[5]),.ca(ca[5]),.a(a[5]),.b(b[5]));
  ha_8 h7(.s(s[6]),.ca(ca[6]),.a(a[6]),.b(b[6]));
  ha_8 h8(.s(s[7]),.ca(ca[7]),.a(a[7]),.b(b[7]));
endmodule

module tb_8(s,ca,a,b);
  input s,ca,a,b; output s,ca;
  parameter max_delay=2;
  localparam max_idx = max_delay-1;
  ha_8 h1(.s(s[0]),.ca(ca[0]),.a(a[0]),.b(b[0]));
  ha_8 h2(.s(s[1]),.ca(ca[1]),.a(a[1]),.b(b[1]));
  ha_8 h3(.s(s[2]),.ca(ca[2]),.a(a[2]),.b(b[2]));
  ha_8 h4(.s(s[3]),.ca(ca[3]),.a(a[3]),.b(b[3]));
  ha_8 h5(.s(s[4]),.ca(ca[4]),.a(a[4]),.b(b[4]));
  ha_8 h6(.s(s[5]),.ca(ca[5]),.a(a[5]),.b(b[5]));
  ha_8 h7(.s(s[6]),.ca(ca[6]),.a(a[6]),.b(b[6]));
  ha_8 h8(.s(s[7]),.ca(ca[7]),.a(a[7]),.b(b[7]));
endmodule
### Original Code:
module tb_8(s,ca,a,b);
  input s,ca,a,b; output s,ca;
  parameter max_delay=2;
  localparam max_idx = max_delay-1;
  ha_8 h1(.s(s[0]),.ca(ca[0]),.a(a[0]),.b(b[0]));
  ha_8 h2(.s(s[1]),.ca(ca[1]),.a(a[1]),.b(b[1]));
  ha_8 h3(.s(s[2]),.ca(ca[2]),.a(a[2]),.b(b[2]));
  ha_8 h4(.s(s[3]),.ca(ca[3]),.a(a[3]),.b(b[3]));
  ha_8 h5(.s(s[4]),.ca(ca[4]),.a(a[4]),.b(b[4]));
  ha_8 h6(.s(s[5]),.ca(ca[5]),.a(a[5]),.b(b[5]));
  ha_8 h7(.s(s[6]),.ca(ca[6]),.a(a[6]),.b(b[6]));
  ha_8 h8(.s(s[7]),.ca(ca[7]),.a(a[7]),.b(b[7]));
endmodule

module tb_8(s,ca,a,b);
  input s,ca,a,b; output s,ca;
  parameter max_delay=2;
  localparam max_idx = max_delay-1;
  ha_8 h1(.s(s[0]),.ca(ca[0]),.a(a[0]),.b(b[0]));
  ha_8 h2(.s(s[1]),.ca(ca[1]),.a(a[1]),.b(b[1]));
  ha_8 h3(.s(s[2]),.ca(ca[2]),.a(a[2]),.b(b[2]));
  ha_8 h4(.s(s[3]),.ca(ca[3]),.a(a[3]),.b(b[3]));
  ha_8 h5(.s(s[4]),.ca(ca[4]),.a(a[4]),.b(b[4