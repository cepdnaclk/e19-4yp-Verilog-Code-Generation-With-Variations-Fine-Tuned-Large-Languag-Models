```
module func2(x1, x2, x3, f);
input signed logic x1, x2, x3;
output logic f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
```

##### [2_test_vector.vhd](https://github.com/enthusiasticallyabstract/VHDL_Course/blob/main/01_Basics/