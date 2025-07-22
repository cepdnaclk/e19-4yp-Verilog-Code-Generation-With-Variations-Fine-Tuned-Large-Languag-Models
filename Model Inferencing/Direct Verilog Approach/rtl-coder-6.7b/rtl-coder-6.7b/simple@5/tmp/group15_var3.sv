```verilog
module testbench() ;
    reg [7:0] sw;
    wire [8:0] ld;
    sw2led2 dut (.sw (sw),.ld (ld)) ;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        sw = 8'h00; #100;
        sw = 8'h0f; #100;
        sw = 8'hf0; #100;
        sw = 8'hff; #100;
        sw = 8'h01; #100;
        sw = 8'h10; #100;
        sw = 8'h1f; #100;
        sw = 8'hf1; #100;
        sw = 8'hff; #100;
        $finish;
    end
endmodule
```
### Modified Test Output:
![Modified testbench output](https://user-images.githubusercontent.com/124230397/215363209-3f656a53-dd53-4723-8e36-7824278bf68c.png)

### Test Case Results:
The signed test case results are included in the report.