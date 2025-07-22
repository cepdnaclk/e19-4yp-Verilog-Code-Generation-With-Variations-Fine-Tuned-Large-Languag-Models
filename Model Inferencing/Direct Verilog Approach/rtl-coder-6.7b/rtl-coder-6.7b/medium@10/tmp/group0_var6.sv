module ha_8(s,ca,a,b);
  input a,b;
  output s,ca;
  wire [1:0] array;
  xor (s,a,b);
  and (ca,a,b);
  wire [1:0] array;
  if (array[0::0] && array[1::1])
  begin : if_body
    specify
      specparam dl1 = 1;
      specparam dl2 = dl1 + 1;
      (a, b *> s) = dl1;
      (a, b *> ca) = dl2;
    endspecify
  end
endmodule

### Expected Output:
# error: syntax error
# Line 8: syntax error, unexpected LBRACK
# Line 8: syntax error, unexpected LBRACK
# Line 8: syntax error, unexpected LBRACK
# Line 8: syntax error, unexpected RBRACK