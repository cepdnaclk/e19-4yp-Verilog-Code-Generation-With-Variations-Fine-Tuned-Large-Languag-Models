```VHDL
module wire_assign( input in, output out );
    // assign out to in
    assign out = in;
endmodule
```
### Expected Results:
An error that the module is not clocked.
### Discussion