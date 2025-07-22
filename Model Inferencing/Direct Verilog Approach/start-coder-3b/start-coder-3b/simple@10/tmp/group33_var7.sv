module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  
  parameter IN_DELAY = 1;
  parameter OUT_DELAY = 1;
  parameter IN_DELAY_2 = 2;
  parameter OUT_DELAY_2 = 2;
  
  parameter p = (1,IN_DELAY,OUT_DELAY,1,IN_DELAY_2,OUT_DELAY_2);
  parameter signed[0:1] c1_p = p[0:1];
  parameter signed[0:1] c2_p = p[2:3];
  parameter signed[0:1] c3_p = p[4:5];
  
  xor #(c1_p) (s,a,b);
  and #(c2_p) (ca,a,b);
  
endmodule
### Testbench Code:
module tb_ha_1;
  wire s,ca;
  wire [0:1] a,b;
  
  ha_1 #(1,2,3,4,5,6) ha_1(.s(s),.ca(ca),.a(a[0]),.b(a[1]));
  assign a = {1'b0,1'b1}; // a = 01
  assign b = {1'b1,1'b1}; // b = 11
  initial begin
    $monitor("a = %d, b = %d, s = %d, ca = %d",a[0],a[1],s,ca);
    #10;
    $monitor("a = %d, b = %d, s = %d, ca = %d",a[0],a[1],s,ca);
    #20;
    $monitor("a = %d, b = %d, s = %d, ca = %d",a[0],a[1],s,ca);
  end
endmodule
### Expected Testbench Output:
a = 0, b = 1, s = 0, ca = 0
a = 0, b = 1, s = 1, ca = 0
a = 1, b = 0, s = 1, ca = 0
a = 1, b = 0, s = 0, ca = 1
### Testbench Result:
a = 0, b = 1, s = 1, ca = 0
a = 1, b = 1, s = 1, ca = 0
a = 1, b = 1, s = 1, ca = 1
a = 1, b = 1, s = 0, ca = 1
```
/labs/labs/lab4/lab4_code/ha_1.py
#!/usr/bin/env python

import veriloggen
import ha_1

veriloggen.resetmodules()

# a = {1'b0,1'b1};
# b = {1'b1,1'b0};

a = [1,0]
b = [0,1]

d = {0:1,1:2}

mod = ha_1.definition(
    name = "test_ha_1",
    a = a, 
    b = b,
    c1_d = d[0], 
    c2_d = d[1]
)

# mod = ha_1.definition(
#     name = "test_ha_1",
#     a = {1:1,0:0},
#     b = {1:0,0:1}
# )

# print(mod)

mod.elaborate()

# print(mod)

fsim = mod.simulator(
    vcd_name = "test_ha_1.vcd",
    bin_dir = "./"
)

result = fsim.run()

print(result)
/labs/labs/lab4/src/labs/lab4/lab4_code/ha_1.py
#!/usr/bin/env python

import veriloggen

from ha_1_mod import ha_1

def definition(
	name,
	a,
	b,
	c1_d,
	c2_d,
	out_p,
	in_p
):
	params = {
		"a": a,
		"b": b,
		"c1_d": c1_d,
		"c2_d": c2_d,
		"out_p": out_p,
		"in_p": in_p
	}

	mod = ha_1(
		name = name,
		params = params
	)

	return mod/labs/labs/lab4/src/labs/lab4/lab4_code/lab4_tb_ha_1.py
#!/usr/bin/env python

import veriloggen

from ha_1_mod import ha_1

def definition(
    name
):
	s = veriloggen.Signal(1, 0)
	ca = veriloggen.Signal(1, 0)
	a = veriloggen.Signal(1, 0)
	b = veriloggen.Signal(1, 0)
	
	ha_1_tb = ha_1(
		name = name,
		s = s,
		ca = ca,
		a = a,
		b = b
	)

	return ha_1_tb/labs/labs/lab4/src/labs/lab4/lab4_code/ha_1_mod.py
#!/usr/bin/env python

from math import log2
import veriloggen
import ha_1

class ha_1(ha_1.ha_1):
    def __init__(
            self,
            name,
            clock,
            a,
            b,
            c1_d,
            c2_d,
            out_p,
            in_p,
            *args, **kwargs):
        ha_1.ha_1.__init__(
            self,
            name,
            *args, **kwargs
        )

        self.a = a
        self.b = b
        self.out_p = out_p
        self.in_p = in_p

        self.a_1 = veriloggen.Signal(1, 0)
        self.a_2 = veriloggen.Signal(1, 0)
        self.out_1 = veriloggen.Signal(1, 0)
        self.out_2 = veriloggen.Signal(1, 0)
        self.delay_1_2 = veriloggen.Signal(1, 0)
        self.delay_2_1 = veriloggen.Signal(1, 0)
        self.ca = veriloggen.Signal(1, 0)

        delay_1 = veriloggen.Delay(1)(
            self.data_in[0],
            self.a_1,
            clock
        )
        delay_2 = veriloggen.Delay(c1_d)(
            self.data_in[1],
            self.a_2,
            clock
        )
        out_1 = veriloggen.Logic1(c1_d)(
            self.a_1,
            self.b[0],
            self.out_1
        )
        out_2 = veriloggen.Logic2(c2_d)(
            self.a_2,
            self.b[1],
            self.out_2
        )

        self.submodules.delay_1 = delay_1
        self.submodules.delay_2 = delay_2
        self.submodules.out_1 = out_1
        self.submodules.out_2 = out_2

        # self.a_1 = veriloggen.Signal(1, 0)
        # self.a_2 = veriloggen.Signal(1, 0)
        # # self.out_1 = veriloggen.Signal(1, 0)
        # # self.out_2 = veriloggen.Signal(1, 0)
        # self.delay_1_2 = veriloggen.Signal(1, 0)
        # self.delay_2_1 = veriloggen.Signal(1, 0)

        # delay_1 = veriloggen.Delay(1)(
        #     self.data_in[0],
        #     self.a_1,
        #     clock
        # )
        # delay_2 = veriloggen.Delay(c1_d)(
        #     self.data_in[1],
        #     self.a_2,
        #     clock
        # )
        # delay_1_2 = veriloggen.Delay(c2_d)(
        #     self.a_1,
        #     self.out_1,
        #     clock
        # )
        # delay_2_1 = veriloggen.Delay(c2_d)(
        #     self.a_2,
        #     self.