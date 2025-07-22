![image](https://user-images.githubusercontent.com/35247784/110959543-1e246f80-8315-11eb-9705-939a224d8160.png)
#### Verilog Code for modified code:
```verilog
module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B & A;
assign #10 C = X | Y | C;
endmodule
```
## 3.7 Test Result (SystemVerilog)
### Base SystemVerilog Code:
![image](https://user-images.githubusercontent.com/35247784/110960594-06112f00-8316-11eb-88a8-c1108d558208.png)
### Modified SystemVerilog Code:
![image](https://user-images.githubusercontent.com