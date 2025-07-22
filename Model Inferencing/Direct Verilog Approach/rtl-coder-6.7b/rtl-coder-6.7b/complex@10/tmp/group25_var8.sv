``` systemVerilog
package my_pkg;
typedef bit [3:0] nibble;
endpackage

module comparator (A, B, Z);
nibble A, B;
wire Z;

wire [1:0] HiCount;
assign HiCount = A > B? 2'b11 : A == B? 2'b01 : 2'b00;

generate
nibble Adjr, Adjb;
always @(A, B)
begin
  {Adjr, Adjb} = A;
end

assign Z = (HiCount == 2'b00) ^ (HiCount[1] | (HiCount[0] & (Adjr > Adjb)));
endgenerate
endmodule

```

### Code Coverage Analysis:
We will observe that the code coverage is only 10%. This is because the adder is not included in the testbench.
![image](https://user-images.githubusercontent.com/110320913/224355701-25101861-f256-486e-b922-e4f9b67c012b.png)

### Code Coverage Report
![image](https://user-images.githubusercontent.com/110320913/224355733-22a58452-a19b-4f24-9178-a31c49247288.png)