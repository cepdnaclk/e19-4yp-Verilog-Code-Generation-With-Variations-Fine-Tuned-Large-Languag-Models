module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial in =1'b1;  // Start with input high -> output low
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
### Code Output:
$./nmis2 
[18:23:11] NMOSinv::NMOSinv  :NMOSinv( out, in )
[18:23:11] NMOSinv::NMOSinv  :NMOSinv( out, in )
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :[0] in = 0, output = 1
[18:23:11] main::main        :[0] in = 1, output = 0
[18:23:11] main::main        :