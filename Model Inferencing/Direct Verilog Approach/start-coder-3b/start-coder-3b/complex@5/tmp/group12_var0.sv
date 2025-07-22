module dffalter_tst();
package dffalter_pkg;
`define dffalter_pkg`
...

```

### 1 comment

```
> 

I assume that you wrote something like this and that you know what you are doing.

```

### 3 comments

```
> 

Thank you for your response. Unfortunately, I do not know what you are asking.

> 

The question is why does the modified version not compile? That is, why is a package with a define in it not considered valid?

> 

I'm going to have to assume that you are not familiar with defines.

```

### 5 comments

In addition to your questions, I am going to give you a different answer to's question. For the sake of the discussion, I am going to assume that the question is aimed at you.

In your code, the `package` is not used in any way in your `dffalter_tst_inside` module. The `package` is not used in your `dffalter_pkg` module. So if you want to use the `package` in your `dffalter_tst_inside` and `dffalter_pkg`, then you have to move the `package` declarations outside of the modules. For example, your code could be

```
module dffalter_tst_inside(); // Testbench, likely for a DFF named dffalter

reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT
import dffalter_pkg::*;

initial
begin
  clr=1'b1;
  pr=1'b0;
  clk=1'b0;
  di=1'b0; // Start with clear asserted
end

always
begin
  clr=1'b0; // Deassert clear
end

always # 4 di =~di; // Toggle data

always #16 pr=1'b1; // Assert preset

always #20 pr =1'b0; // Deassert preset

initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);

initial #46 $stop; // Stop simulation
endmodule

package dffalter_pkg::*;

`define dffalter_pkg`

`package` definition inside `module`

module dffalter_pkg(); // Package named dffalter_pkg

dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT

endmodule

```

Notice that you move the package to a separate module. This is a very common practice. If you are concerned about using the package in an instance of an `interface`, then you can add the package as an `import` in the `module` where the instance of the `interface` is.

For example,

```
interface IDUT();

//...

endinterface

package dffalter_pkg::*;

`define dffalter_pkg`

`package` definition inside `module`

module dffalter_pkg(); // Package named dffalter_pkg

dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT

endmodule

module dffalter_tst_inside(IDUT dut); // Testbench, likely for a DFF named dffalter

reg di,clk,clr,pr;
wire q, qb; // Added qb

import dffalter_pkg::*;

initial
begin
  clr=1'b1;
  pr=1'b0;
  clk=1'b0;
  di=1'b0; // Start with clear asserted
end

always
begin
  clr=1'b0; // Deassert clear
end

always # 4 di =~di; // Toggle data

always #16 pr=1'b1; // Assert preset

always #20 pr =1'b0; // Deassert preset

initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);

initial #46 $stop; // Stop simulation
endmodule

```

Notice the `module dffalter_tst_inside(IDUT dut)` parameter list is now the `interface` name. This allows you to use the `package` inside the instance of the `interface`.

This pattern allows you to use `package`s in many different ways.

```
package dffalter_pkg::*;

`define dffalter_pkg`

`package` definition inside `module`

module dffalter_tst_inside(IDUT dut); // Testbench, likely for a DFF named dffalter

reg di,clk,clr,pr;
wire q, qb; // Added qb

import dffalter_pkg::*;

initial
begin
  clr=1'b1;
  pr=1'b0;
  clk=1'b0;
  di=1'b0; // Start with clear asserted
end

always
begin
  clr=1'b0; // Deassert clear
end

always # 4 di =~di; // Toggle data

always #16 pr=1'b1; // Assert preset

always #20 pr =1'b0; // Deassert preset

initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);

initial #46 $stop; // Stop simulation
endmodule

interface IDUT();

//...

endinterface

module dffalter_pkg_dut(inclk IDUT); // Package named dffalter_pkg

dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT

endmodule

```

Notice that the `package` is an `interface`. This allows you to use the `package` in the `module` as well as the `interface`.

```
package dffalter_pkg::*;

`define dffalter_pkg`

`package` definition inside `module`

module dffalter_tst_inside(IDUT dut); // Testbench, likely for a DFF named dffalter

reg di,clk,clr,pr;
wire q, qb; // Added qb

import dffalter_pkg::*;

initial
begin
  clr=1'b1;
  pr=1'b0;
  clk=1'b0;
  di=1'b0; // Start with clear asserted
end

always
begin
  clr=1'b0; // Deassert clear
end

always # 4 di =~di; // Toggle data

always #16 pr=1'b1; // Assert preset

always #20 pr =1'b0; // Deassert preset

initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);

initial #46 $stop; // Stop simulation
endmodule