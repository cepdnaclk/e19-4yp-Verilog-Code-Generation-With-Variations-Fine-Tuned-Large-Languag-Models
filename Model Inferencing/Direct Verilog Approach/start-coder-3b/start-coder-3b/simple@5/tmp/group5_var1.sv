module tst_dff_s_n();
      logic data_in,clock,out;
      dff_s_n d1(out,clock,data_in);
      initial begin data_in=0; clock=0; #6 $stop end
      always #5 data_in=~data_in;
      always #6 clock=~clock;
      initial $monitor($time, "data_in=%b, clock=%b, out=$bits(out)",data_in,clock,out);
endmodule

### Notes:
```
```

## 23. dff_s_posedge
### Code:
module dff_s_posedge(output out,input clock,input data_in);
      reg out_reg;
      always @(posedge clock) out_reg <= data_in;
      out <= out_reg;
endmodule
### Base Verilog Code:
module tst_dff_s_posedge();
      reg data_in,clock,out;
      dff_s_posedge d1(out,clock,data_in);
      initial begin data_in=0; clock=0; #6 $stop end
      always #5 data_in=~data_in;
      always #6 clock=~clock;
      initial $monitor($time, "data_in=%b, clock=%b, out=%b",data_in,clock