module full_adder (
  output sum,
  output cout,
  input i1,
  input i2,
  input cin
);
  assign sum = cin ^ (i1 ^ i2);