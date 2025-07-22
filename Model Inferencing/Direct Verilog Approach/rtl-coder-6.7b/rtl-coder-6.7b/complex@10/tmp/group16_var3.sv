```verilog
module comparator #(parameter P = 8) (input signed [P-1:0] x, output logic [1:0] y);

  logic [P-1:0] x_val;

  always_comb begin
    if (x_val inside {-1, 1})
      y = 2'b00;
    else if (x_val inside {-2, -3, 2, 3})
      y = 2'b01;
    else if (x_val inside {-12, -13, -14, -15, -6, 6, 12, 13, 14, 15})
      y = 2'b10;
    else
      y = 2'b11;
  end
endmodule
```
### Code after Vivado Synthesis:
```verilog
module comparator #(parameter P = 8) (input signed [P-1:0] x, output logic [1:0] y);

  logic [P-1:0] x_val;

  always_comb begin
    if (x_val in {-1, 1})
      y = 2'b00;
    else
      if (x_val in {-2, -3, 2, 3})
        y = 2'b01;
      else
        if (x_val in {-12, -13, -14, -15, -6, 6, 12, 13, 14, 15})
          y = 2'b10;
        else
          y = 2'b11;
  end
endmodule
```
### Explanation:
Inside operator is synthesized in Vivado to `in` operator and also `in` can be replace with `==` operator