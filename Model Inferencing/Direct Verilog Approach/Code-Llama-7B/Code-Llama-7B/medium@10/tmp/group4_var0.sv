```
module nand8(a[7:0],b[7:0],out[7:0]); // 8-bit NAND
  input a[7:0],b[7:0];
  output out[7:0];
  supply0 gnd;
  for (i=0; i<8; i=i+1)
    begin
      nand2(a[i],b[i],out_array[i]);
    end
  // Connect out to an array of wires called out_array
  // NB: use the index result of inside(1) when creating the element of the array
  for (i=0; i<8;