module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule

### Testing

* Testing on the P130 board

  * `export MTDEV_PLATFORM_DESCR=p130`
  * `export MTDEV_PLATFORM_ROOT=<path-to-p130-platform>`
  * `export MTDEV_PLATFORM_RUNDIR=<path-to-p130-run-directory>`
  * `simulate tst_nm_in`

 ![img](pics/p130_nm_in.PNG)

  

* Testing on the P201 board

  * `export MTDEV_PLATFORM_DESCR=p201`
  * `export MTDEV_PLATFORM_ROOT=<path-to-p201-platform>`
  * `export MTDEV_PLATFORM_RUNDIR=<path-to-p201-run-directory>`
  * `simulate tst_nm_in`

 ![img](pics