```SystemVerilog
module comparator(input logic [7:0] x, 
                  output logic [3:0] y);
  import PKG1::*;
  always_comb begin
    y = 0;
    for (int i = 0; i < 32; i++) begin 
      if (x inside {ARRAY[i]}) begin
        y |= (1 << i);
      end
    end
  end
endmodule
```
### Output:
```
+--------------------------------------------------------------------------------------+
|  R  C  K  E  Y                 I  N  S  I  D  E  _  I  N  S  I  D  E              |
|                                                                                      |
|             @      00000011   @      @   @       @     @     @       @              |
|                                                                                      |
+--------------------------------------------------------------------------------------+
```