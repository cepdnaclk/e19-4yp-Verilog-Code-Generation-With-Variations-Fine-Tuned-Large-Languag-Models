module jk_ff(d,clk,rst,q,q_bar);
  input d,clk,rst;
  output q,q_bar;
  
  wire not_rst;
  not(not_rst,rst);
  buffer(not_rst,q_bar);
  
  wire nor_out;
  nor3NMOS