class dff_aa extends dff #(.DI(1'b1),.QB(1'b0));
  parameter DI=1'b1, QB=1'b0;
  reg q;
  always @(posedge clk or posedge clr or posedge pr)
    if(clr) q <= 1'b0;
    else if(pr) q <= 1'b1;
    else q <= DI;
  end
endclass

module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
  output q,qb; input di,clk,clr,pr;
  reg q;
  assign qb=~q;
  dff #(.DI(DI),.QB(QB)) d0(.q(q),.qb(qb),.di(di),.clk(clk),.clr(clr),.pr(pr));
endmodule
### Simulation:
```
$./bin/vsim -voptargs=-verbose dff_aa_tb
### Expected Output:
```
...

Simulation Time: 0 ps, 0 ns (from 0 ps to 0 ns)

WARNING: RTL Simulation Results

WARNING: Simulating module dff_aa_tb

	[x] Top level module: dff_aa_tb
	[x] Simulation results for module dff_aa_tb

	[x] Simulation results for module dff_aa
	[x] Signal q at dff_aa : 0
	[x] Signal qb at dff_aa : 1
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 0
	[x] Signal qb at dff_aa : 1
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 0
	[x] Signal qb at dff_aa : 1
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0
	[x] Signal q at dff_aa : 1
	[x] Signal qb at dff_aa : 0
	[x] Signal di at dff_aa : 1
	[x] Signal clk at dff_aa : 1'b0
	[x] Signal clr at dff_aa : 1'b0
	[x] Signal pr at dff_aa : 1'b0