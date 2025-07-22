```
	genvar i;
	generate
	for (i = 0; i < 10; i=i+1) begin: inside
	if (rr.ir == i) begin
		shift_reg sr_ins(.d_in(inst[i][3:0]),.clk(clk),.ld(1'b0),.sl(1'b0),.sr(1'b0),.rst(1'b0),.s_cnt(2'b00));
	end
	else begin
		shift_reg sr_ins(.d_in(inst[i][3:0]),.clk(clk),.ld(1'b1),.sl(1'b0),.sr(1'b0),.rst(1'b0),.s_cnt(2'b00));
	end
	end
	endgenerate
```
### Results:

```
--------------------------------------------------
    Simulation Started at 04:24:29 on Jun 17, 2019
--------------------------------------------------


    SIMULATION COMPLETED SUCCESSFULLY
    Number of errors: 0


-------------------------------------------------------------------------------
    Simulation time: 1.000 ns
    Cycle count: 21
    Average instructions per cycle: 1.045
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
    Simulation time: 1.000 ns
    Cycle count: 20
    Average instructions per cycle: 1.000
-------------------------------------------------------------------------------

```