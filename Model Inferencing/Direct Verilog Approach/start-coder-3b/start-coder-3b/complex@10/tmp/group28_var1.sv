```
package clock_domain;

import "std.bitmanip.std_logic_vector";

// Clock gating definitions
const
  EN_LOW = 1'b0;
  EN_HIGH = 1'b1;
  EN_MASK = '0;

endpackage

module tstdlatch; //test-bench

// Clock gating definitions
parameter
  EN_LOW  = 1'b0;
  EN_HIGH = 1'b1;
  EN_MASK = '0;

// Port definitions
input [31:0] clk;
input [31:0] rising_edge;
input [31:0] falling_edge;

// Port declarations
reg d,en;
wire q,qb;

// Clock gating
reg [31:0] state, clk_enable;

// Clock gating
clock_domain::state state;

// Clock gating
clock_domain::clk_enable clk_enable;

// Clock gating 
always #4 clk_enable =~clk_enable;

// Clock gating
initial $monitor($time, " clk = %b, rising_edge = %b, falling_edge = %b ", clk, rising_edge, falling_edge);

initial $monitor($time, " clk_enable = %b ", clk_enable);

// latch
always @(posedge clk)
begin
state <= clk_enable;
end

// latch
always @(state and clk_enable )
begin
d <= rising_edge;
end

// latch
always @(state or clk_enable)
begin
en <= falling_edge;
end

// latch
always @(posedge clk)
begin
if(state and clk_enable) begin
if(d) begin
q <= 1'b1;
qb <= 1'b1;
end
else begin
q <= 1'b0;
qb <= 1'b0;
end
end
else begin
q <= 1'b0;
qb <= 1'b0;
end
end

 initial
begin
clk = '00000000000000000000000000000000;
rising_edge = '00000000000000000000000000000000;
falling_edge = '00000000000000000000000000000000;
end

initial $monitor($time, " clk = %b, rising_edge = %b, falling_edge = %b ", clk, rising_edge, falling_edge);
initial $stop;

endmodule
```

#### References:

* [VCS 10.1 User’s Manual](http://www.synopsys.com/verification/verification-program/vcs/user.html)
* [VCS 10.1 Release Notes](http://www.synopsys.com/verification/verification-program/vcs/relnote.html)
* [VCS 10.1 Documentation](http://www.synopsys.com/verification/verification-program/vcs/doc.html)
* [VCS 10.1 User’s Guide](http://www.synopsys.com/verification/verification-program/vcs/ug.html)

### 33. Verilog to VHDL Port Mapping

#### Description:

Port mapping in VHDL allows the mapping of Verilog ports to VHDL.

#### Verilog Code:

```
module tstdlatch; //test-bench
input [31:0] clk;
input [31:0] rising_edge;
input [31:0] falling_edge;
reg d,en;
wire q,qb;
always @(posedge clk)
begin
d <= rising_edge;
en <= falling_edge;
end
initial
begin
d = 1'b0;
en = 1'b0;
end
always #4 en =~en;
always #8 d=~d;
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial $stop;
endmodule
```

#### VHDL Code:

```
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tstdlatch is
generic ()
port (
clk : in std_logic_vector(31 downto 0);
rising_edge : in std_logic_vector(31 downto 0);
falling_edge : in std_logic_vector(31 downto 0);
d : out std_logic;
en : out std_logic;
q : in std_logic;
qb : in std_logic);
end tstdlatch;

architecture a of tstdlatch is
signal d : std_logic;
signal en : std_logic;
begin
d <= rising_edge;
en <= falling_edge;

end a;
```

#### References:

* [VHDL 2008 Language Specification](https://www.vhdl.org/docs/2008_VHDL_Reference_Guide.pdf)
* [VHDL 2008 User’s Guide](https://www.vhdl.org/docs/2008_VHDL_User_Guide.pdf)

### 34. Verilog to VHDL Clocking

#### Description:

Synchronizing D Flip-Flops on the same clock.

#### Verilog Code:

```
module tstdlatch; //test-bench

// Port definitions
input [31:0] clk;
input [31:0] rising_edge;
input [31:0] falling_edge;

reg d,en;
wire q,qb;

// latch
always @(posedge clk)
begin
d <= rising_edge;
en <= falling_edge;
end

// latch
always @(posedge clk)
begin
d <= rising_edge;
en <= falling_edge;
end

initial
begin
d = 1'b0;
en = 1'b0;
end

always #4 en =~en;
always #8 d=~d;
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial $stop;
endmodule
```

#### VHDL Code:

```
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tstdlatch is
generic ()
port (
clk : in std_logic_vector(31 downto 0); -- clock
rising_edge : in std_logic_vector(31 downto 0); -- input Rising Edge
falling_edge : in std_logic_vector(31 downto 0); -- input Falling Edge
d : out std_logic; -- output
en : out std_logic; -- output
q : in std_logic; -- input
qb : in std_logic); -- input
end tstdlatch;

architecture a of tstdlatch is
signal d : std_logic;
signal en : std_logic;
begin
d <= rising_edge;
en <= falling_edge;

end a;
```

#### References:

* [VHDL 2008 Language Specification](https://www.vhdl.org/docs/2008_VHDL_Reference_Guide.pdf)
* [VHDL 2008 User’s Guide](https://www.vhdl.org/docs/2008_VHDL_User_Guide.pdf)

### 35. Verilog to VHDL Clocking

#### Description:

Synchronizing D Flip-Flops on the same clock.

#### Verilog Code:

```
module tstdlatch; //test-bench

// Port definitions
input [31:0] clk;
input [31:0] rising_edge;
input [31:0] falling_edge;

reg d,en;
wire q,qb;

// latch
always @(posedge clk)
begin
d <= rising_edge;
en <= falling_edge;
end

// latch
always @(posedge clk)
begin
d <= rising_edge;
en <= falling_edge;
end

initial
begin
d = 1'b