```VHalf_Adder.v
module Half_Adder(
    input A, B,
    output logic[7:0] Sum, logic[7:0] Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```

### Output Results:
```Console
$ verilator Half_Adder_tb.v Half_Adder.v
$ make -f VHalf_Adder_tb.mk
$./VHalf_Adder_tb
```

## Screenshot 1

![Screenshot 1](screenshot/screenshot1.png)

## Screenshot 2

![Screenshot 2](screenshot/screenshot2.png)

## Screenshot 3

![Screenshot 3](screenshot/screenshot3.png)

## Screenshot 4

![Screenshot 4](screenshot/screenshot4.png)

## Screenshot 5

![Screenshot 5](screenshot/screenshot5.png)

## Screenshot 6

![Screenshot 6](screenshot/screenshot6.png)
/Computer Architecture/hw3/README.md
# Computer Architecture - Homework 3

## 

## I pledge my honor that I have abided by the Stevens Honor System.

## Verilog Code
```Verilog
module full_adder(
  input A, B, C,
  output [1:0] S,
  output [3