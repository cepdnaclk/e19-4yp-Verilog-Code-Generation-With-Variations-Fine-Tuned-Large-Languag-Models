* Add a package definition
    - This package should be added to the existing file named `pkg.sv`

```
package pkg;
    parameter [2:0] x = 3'b011;
endpackage
```

* Change the comparator logic to use `x` parameter array
```
always @(*) begin
    if (x inside {1'b0, 1'b1}) begin
        out = 1'b1;
    end else begin
        out = 1'b0;
    end
end
```