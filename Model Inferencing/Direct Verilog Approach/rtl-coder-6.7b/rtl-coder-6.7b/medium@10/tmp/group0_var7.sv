module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  parameter p = 8;
  logic [p-1:0] a_pck, b_pck;
  bit [p-1:0] a_bit,b_bit;
  logic [p-1:0] s_pck, ca_pck;
  bit [p-1:0] s_bit, ca_bit;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
    // Assign path delays using specparams
    (pck4d0.a,pck4d0.b) = dl1;
    (pck4d0.a,pck4d0.b) = dl2;
    // Assign path delays using specparams
    (bit0.a,bit0.b) = dl1;
    (bit0.a,bit0.b) = dl2;
  endspecify
  if (a_bit inside {[0:11],[13:31]}) begin
    array [p-1:0] of xor #(dl1) x (s_bit,a_bit,b_bit);
  end else begin
    array #(dl1) of xor x (s_bit,a_bit,b_bit);
  end
  if (a_pck inside {[0:11],[13:31]}) begin
    array [p-1:0] of xor #(dl1) x (s_pck,a_pck,b_pck);
  end else begin
    array #(dl1) of xor x (s_pck,a_pck,b_pck);
  end
  xor (s,a,b);
  and (