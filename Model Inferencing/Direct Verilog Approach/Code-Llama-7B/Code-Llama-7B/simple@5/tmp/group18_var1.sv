module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
  parameter enum a {a_a=2, a_b=1, a_c=0, a_d=3} = a_b;
  parameter a a_default_value;
  parameter enum b {b_a=2, b_b=1, b_c=0, b_d=3} = b_b;
  parameter b b_default_value;
  wire [1:0] c = a_b + b_b;
  assign ao = c < 2'd2? a_a : a_c;
  assign ai = c < 2'd2? b_c : b_b;
### Test Cases
#### Base Case
```
[WARNING] This test-case is based on base source-code of verification-benchmark.
    Source-code may not match with the test-case.
```

#### Variation - 1
```
Inputs: {}
Outputs: {}
0: 0x5
```

#### Variation - 2
```
Inputs: {}
Outputs: {}
0: 0x0
```

#### Variation - 3
```
Inputs: {b_b=1'h1, a_c=0}
Outputs: {}
0: 0x2
```

#### Variation - 4
```
Inputs: {b_b=1'h1, a_c=0}
Outputs: {}
0: 0x2
```

#### Variation - 5
```
Inputs: {b_b=1'h1, a_d=2'h3}
Outputs: {}
0: 0x1
```

#### Variation - 6
```
Inputs: {b_d=3'h3, a_b=1'h1}
Outputs: {}
0: 0x4
```

#### Variation - 7
```
Inputs: {b_b=1'h1, a_b=1