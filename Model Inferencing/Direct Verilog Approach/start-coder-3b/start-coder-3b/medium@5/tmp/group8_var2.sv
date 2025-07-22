module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial begin i =2'b00;
end
initial if(i==3'b11) begin
$stop; // Stop simulation
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule
### Simulation Results:
Time : 158.266 ns
Simulation ends at time 158.266 ns
Output o = 0, input i = 00

## Question 2 :
The following verilog code has been modified to illustrate the difference in the 3-state D flip-flop.

module flip_flop_2t(q,q_bar,d,clk);
reg q, q_bar;
assign q=q_bar;
always @(posedge clk)
q_bar <= d;
endmodule
What is the resulting behavior of this flip-flop when clk is set to 0, 1, and 0 (without using the not gate).
### Solution:
| CLK | Q | Q_bar |
|---|---|---|
|1 |0| 1 |
|0 |1| 1 |
|1 |1| 0 |
|0 |1| 1 |

## Question 3 :
Simulate the following code segment using the tst_3sta_dff module.

module tst_3sta_dff(q,q_bar,d,clk);
wire [1:0] q;
wire[0:0] q_bar;
wire [1:0] d;
wire clk;

dff_2t dff(q,q_bar,d,clk);
initial
begin
d = 2'b00;
clk = 0;

# 5 clk = 1;
# 5 clk = 0;
# 5 clk = 1;
# 5 clk = 0;
# 5 clk = 1;
# 5 clk = 0;
# 5 clk = 1;
# 5 clk = 0;
end
initial $monitor ($time, "output q = %b, input q_bar = %b, input d= %b ", q,q_bar,d);
initial #2000 $stop; // Stop simulation
endmodule
### Solution:
| Time | q | q_bar | d |
|---|---|---|---|
| 0 | 00 | 0 | 00 |
| 5 | 00 | 1 | 00 |
| 10 | 10 | 1 | 00 |
| 15 | 10 | 0 | 00 |
| 20 | 00 | 1 | 00 |
| 25 | 00 | 0 | 00 |
| 30 | 10 | 1 | 00 |
| 35 | 10 | 0 | 00 |

## Question4 :
The following module has been modified to illustrate the difference in the 3-state D flip-flop.

module flip_flop_2t(q,q_bar,d,clk);
reg q, q_bar;
assign q=q_bar;
always @(posedge clk)
q_bar <= d;
endmodule
What is the resulting behavior of this flip-flop when clk is set to 0, 1, and 0 (without using the not gate).
### Solution:
|CLK|  Q | Q_bar | D |
|---|---|---|---|
|1| 00 |  1  | 00 |
|0| 10 |  1  | 00 |
|1| 10 |  0  | 00 |
|0| 00 |  1  | 00 |

## Question 5 :
A 3-state D flip-flop has been implemented with VHDL.

package flip_flop is
type clock_t is (clock, reset, set, reset);
type data_t is (data_0, data_1, data_2);
end package

entity flip_flop is
port(clk: in clock_t;
set: in data_t;
reset: in data_t;
data_in: in data_t;
output data_out: out data_t);
end entity;

architecture Behavioral of flip_flop is
signal next_data: data_t;
begin
data_out <= next_data;

process (set)
begin
case set is
when reset =>
next_data <= data_2;
when data_0 =>
next_data <= data_1;
when data_1 =>
next_data <= data_2;
when data_2 =>
next_data <= data_0;
else
next_data <= data_0;
end case;
end process;

process (reset)
begin
case reset is
when reset =>
next_data <= data_0;
when data_0 =>
next_data <= data_1;
when data_1 =>
next_data <= data_2;
when data_2 =>
next_data <= data_0;
else
next_data <= data_0;
end case;
end process;

process (clk)
begin
case clk is
when clock =>
if (reset = data_2) then
next_data <= data_0;
elsif (set = data_0) then
next_data <= data_1;
elsif (set = data_1) then
next_data <= data_2;
elsif (set = data_2) then
                next_data <= data_0;
else
next_data <= data_0;
end if;
end case;
end process;

end Behavioral;

### Simulation:

## Question 6 :
Modify the flip_flop_2t module to incorporate a set-reset flip-flop.

package flip_flop is
type clock_t is (clock, reset, set, reset);
type data_t is (data_0, data_1, data_2);
end package

entity flip_flop is
port(clk: in clock_t;
set: in data_t;
reset: in data_t;
data_in: in data_t;
output data_out: out data_t);
end entity;

architecture Behavioral of flip_flop is
signal next_data: data_t;
signal set_reset: boolean := false;
begin
data_out <= next_data;

process (set)
begin
case set is
when reset =>
set_reset <= true;
when data_0 =>
set_reset <= false;
when data_1 =>
set_reset <= false;
when data_2 =>
set_reset <= false;
else
set_reset <= false;
end case;
end process;

process