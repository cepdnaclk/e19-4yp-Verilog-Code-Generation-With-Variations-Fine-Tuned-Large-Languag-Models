module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ao;
  enum {A=1'bx,B=1'bz} ai; // input ai; wire ao, ai;
  not #2 (ao,ai);
endmodule
### Verilog Testbench Code:
`ifdef INCLUDE_TESTS
  #include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>
  #include <time.h>
  //#include <sys/time.h>
  //#include <sys/types.h>
  #include <sys/times.h>
  #include "sv_stdio.h"
  class tb;
    tb_task_s t;
    logic ai; //enum {A=1'bx,B=1'bz} ai;
    logic ao;
    show_aa u_show_aa(ao,ai);
    task run;
      $display("");
      t.setup(2.2,10,1,1,0,0);
      t.setsim(0);
      ai = 0;
      #1;
      t.print;
      ai = 1;
      #1;
      t.print;
      ai = 2;
      #1;
      t.print;
      ai = 'bz;
      #1;
      t.print;
      ai = 3;
      #1;
      t.print;
      #1;
      t.print;
      ai = 'bx;
      #1;
      t.print;
      #1;
      t.print;
      #1;
      t.print;
      t.finish;
    endtask
  endclass
  initial begin
    tb t = new();
    t.run();
  end
`endif
### Testbench Output:

```
### Testbench Error Message(s):
### Command-line Arguments:
```
### Key Pipeline Output:
```
### Issues:
```
### Status:
###