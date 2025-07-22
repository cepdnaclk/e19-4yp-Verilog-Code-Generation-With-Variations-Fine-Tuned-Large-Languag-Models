```veilog
module reg4(D, Clock, Resetn, Q);
    input [3:0] D;
    input Clock, Resetn;
    output [3:0] Q;
    reg [3:0] Q;
    always @(posedge Clock or negedge Resetn)
        if (Resetn == 0)
            Q <= 4'b0000;
        else
            Q <= D;
    endmodule
```

### Observation:
The generated RTL code for this variation is shown in the following figure.

![](http://www.asic-world.com/images/Reg4.png)

Note: The RTL code has been generated from [this](https://github.com/vlsi-course/vlsi_course/blob/master/lab2/lab2/reg4.v) verilog code.