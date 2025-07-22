module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Output:
```
$ iverilog -o func1.out func1.v
$./func1.out
$ vvp func1.out
```
![image](https://user-images.githubusercontent.com/91344253/190363991-3e0944bd-b57a-4608-a230-a21db4c9a5c8.png)

### Results:
As the output type was changed to logic signed, the output type was also changed to signed logic vector.