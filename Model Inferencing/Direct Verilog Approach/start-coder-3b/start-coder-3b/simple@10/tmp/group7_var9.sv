```
module Test (output tri X, in1);
always @* begin
X = in1;
end
endmodule

module Test_1 (output tri X, in1);
always @* begin
X = in1;
end
endmodule
```

### Result:
This code compiles successfully, the circuit is simulated successfully and the output is tri-state.

## Question 2
### Base Verilog