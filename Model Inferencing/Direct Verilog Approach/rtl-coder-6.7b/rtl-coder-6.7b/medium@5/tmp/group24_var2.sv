```
module tst_dff_p_c();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  typedef int do_arr_t[1:0];
function do_arr_t do_arr(di);
	if (di==1) {
		do_arr_t = 1'b1;
	} else {
		do_arr_t = 1'b0;
	}
endfunction
...
initial begin // Initialize & stop
	do = {d1.$fcall("do_arr",di)}; // Generate clock
	#35 $stop;
	do = {d1.$fcall("do_arr",di)}; // Toggle data
	#5 do = {d1.$fcall("do_arr",di)};
end
always #3 clk=~clk; // Generate clock
always #5 di=~di; // Toggle data
initial $display ("%m: Top-level testbench module"); // Display testbench name
initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
```

### Running the Simulation:

![](https://github.com/Muthukumar683/Verilog_HDL_code/blob/master/images/03_06_01_a.png)

### Verification on Array Assignment in Initial Block:

![](https://github.com/Muthukumar683/Verilog_HDL_code/blob/master/images/03_06_01_b.png)

---

## 3.07 Combinational Testing of Sequential Flip-Flops

### Description:

In this section, we will be using a testbench to verify the combinationality of sequential flip-flops from the previous section.