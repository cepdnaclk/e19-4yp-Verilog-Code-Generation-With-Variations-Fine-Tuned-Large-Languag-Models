module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Test:
```
vlog -sv 1800-2012  -f filelist
vsim -c -novopt -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver
-L cycloneive_ver -L cycloneive -L rtl_work tst_alu4
# Loading SystemVerilog: 1800-2012
# Loading Library: altera_ver
# Loading Library: lpm_ver
# Loading Library: sgate_ver
# Loading Library: altera_mf_ver
# Loading Library: altera_lnsim_ver
# Loading Library: cycloneive_ver
# Loading Library: cycloneive
# Loading work...
# Loading work...
# Loading library...
# Compiling top level module "tst_alu4"
# Loading library...
# Loading library...
# Loading library...
# Loading library...
# Compiling module "alu_4"
# Compiling module "alu_4"
# Compiling module "alu_4"
# Compiling module "alu_4"
# Compiling module "alu_4"
# Compiling module "alu_4"
# Compiling module "alu_4"
# Compiling