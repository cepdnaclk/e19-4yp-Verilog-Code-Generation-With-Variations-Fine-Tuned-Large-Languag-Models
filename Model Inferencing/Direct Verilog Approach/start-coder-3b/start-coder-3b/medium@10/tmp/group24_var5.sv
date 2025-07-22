module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop;
   begin
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
    end
  end
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
endmodule
### Output:
```bash
$ make
make -C./sim libvpi
make[1]: Entering directory './sim'
/usr/local/systemc-2.3.3/bin/sc_elab -e -L /usr/local/systemc-2.3.3/lib-linux64 -L /usr/local/vpi/lib-linux64  -L /usr/local/vpi/lib-linux64/ -L /usr/local/vpi/lib-linux64/  -L /usr/local/lib/gcc/x86_64-redhat-linux/4.4.6/ -L /usr/local/lib/vpi/ -L /usr/local/lib/vpi/ libvpi.so vpi_entry.o tst_dff_p_b.o
/usr/local/systemc-2.3.3/bin/../lib/gcc/x86_64-redhat-linux/4.4.6/../../../../x86_64-redhat-linux/bin/ld: cannot find -lsystemc
/usr/local/systemc-2.3.3/bin/../lib/gcc/x86_64-redhat-linux/4.4.6/../../../../x86_64-redhat-linux/bin/ld: cannot find -lvpi
/usr/local/systemc-2.3.3/bin/../lib/gcc/x86_64-redhat-linux/4.4.6/../../../../x86_64-redhat-linux/bin/ld: cannot find -lvpi
collect2: ld returned 1 exit status
make[1]: *** [tst_dff_p_b] Error 1
make[1]: Leaving directory './sim'
make: *** [libvpi] Error 2
```
**Issue:**
- It is not able to link systemc library.
/09_VCS/21/README.md
## **Question:**
Using VCS/SystemC/Verilog, implement a module (named dff_b) which performs the following (using the Verilog module). This module is supposed to be used as a black-box.

1. The module accepts the inputs di, ci and clk.
2. The module produces the output do.
3. The module has two different variants: dff_b_r and dff_b_s.
4. In the first variant, the module is described by the code below.
5. In the second variant, the code is similar to dff_b_r, but the module is implemented as follows:
```
module dff_b_s(do,di,ci,clk);
   reg do;
   reg di;
   reg ci;
   reg clk;
   always @ (posedge clk)
     if(ci)
       do <= di;
     else
       do <= do;
endmodule
```
## **Solution:**
This question is a variation of 6. In that, VCS is used to simulate the verilog code.

### **Base Verilog Code:**
```verilog
module dff_b(do,di,ci,clk);
  reg do,di,ci,clk;
  always @(posedge clk)
    if(ci)
      do<=di;
    else
      do<=do;
endmodule
```
### **Variation Instruction:**
Add first-variant of dff_b and second-variant of dff_b.
### **Modified Code:**
```verilog
module dff_b(do,di,ci,clk);
  reg do,di,ci,clk;
  always @(posedge clk)
  if(ci)
    do<=di;
  else
    do<=do;
endmodule

module dff_b_s(do,di,ci,clk);
  reg do,di,ci,clk;
  always @(posedge clk)
  if(ci)
    do<=di;
  else
    do<=do;
endmodule
```
### **Output:**
```bash
$ make
make -C./sim libvpi
make[1]: Entering directory './sim'
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb./tb/tst_dff_b.sv
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb./tb/dff_b.sv
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb./tb/dff_b_s.sv
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb./tb/dff_b_r.sv
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb./tb/dff_b_d.sv
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb./tb/dff_b_ds.sv
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb +incdir+../verilog./sim/tb/verilog/dff_b.svh
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb +incdir+../verilog./sim/tb/verilog/dff_b_s.svh
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb +incdir+../verilog./sim/tb/verilog/dff_b_r.svh
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb +incdir+../verilog./sim/tb/verilog/dff_b_d.svh
/usr/local/vcs-2017.09/bin/vlog +v2k -v2005 -sv +incdir+../tb +incdir+../tb +incdir+../verilog./sim/tb/verilog/dff_b_ds.svh
/usr/local/vcs-2017.09/bin/vsim -do "run -all; quit -f" +v2k -v2005 -sv +incdir+../tb +incdir+../tb +incdir+../verilog./sim/tb/verilog/dff_b.svh +libext+.v +libext+.sv +libext+.vhv +libext+.svh +libext+.svh./sim/tb/verilog/dff_b_s.svh +libext+.v +libext+.sv +libext+.vhv +libext+.svh +libext+.svh./sim/tb/verilog/dff_b_r.svh +libext+.v +libext+.sv +libext+.vhv +libext+.svh +libext+.svh./sim/tb/verilog/dff_b_d.svh +libext+.v +libext+.sv +libext+.vhv +libext+.svh +libext+.svh./sim/tb/verilog/dff_b_ds.svh +libext+.v +libext+.sv +libext+.vhv +libext+.svh +libext+.svh./sim/tb/verilog/tst_dff_b.svh +libext+.v +libext+.sv +libext+.vhv +libext+.sv