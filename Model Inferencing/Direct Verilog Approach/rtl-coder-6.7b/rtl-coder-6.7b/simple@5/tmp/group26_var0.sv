module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
struct {bit a, a1;} ea;
struct {bit b, c, b1, c1;} eb;
// Instantiate OR gate with inertial delay 3
or #3 gg1(ea.a1,eb.c1,eb.b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(ea.a,eb.c,eb.b);
endmodule
### Constraints File:
set_input_delay 0 -clock clk {b,c}
set_input_delay 0 -clock clk {b1,c1}
set_output_delay 0 -to [get_nets {a1}] -clock clk
set_output_delay 0 -to [get_nets {a}] -clock clk
report_timing -capacitance -from [get_ports b] -to [get_ports a]
report_timing -capacitance -from [get_ports b] -to [get_ports a1]
report_timing -capacitance -from [get_ports b] -to [get_ports c]
report_timing -capacitance -from [get_ports b] -to [get_ports b1]
### Simulation Command:
vsim gade -L /home/work/cadence/nc-1.5.12/lib-ccs/lib-ccs/CCS/db/saed12s6_ixt
#####


set_input_delay -clock {clk} 0 -max 0 [get_ports {a}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {b}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {c}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {d}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {e}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {f}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {g}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {h}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {i}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {j}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {k}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {l}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {m}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {n}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {o}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {p}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {q}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {r}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {s}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {t}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {u}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {v}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {w}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {x}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {y}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {z}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {aa}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ab}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ac}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ad}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ae}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {af}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ag}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ah}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ai}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {aj}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ak}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {al}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {am}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {an}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ao}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ap}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {aq}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ar}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {as}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {at}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {au}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {av}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {aw}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ax}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ay}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {az}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {ba}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bb}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bc}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bd}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {be}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bf}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bg}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bh}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bi}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bj}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bk}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bl}]
set_input_delay -clock {clk} 0 -max 0 [get_ports {bm}]
set_input_delay -clock {clk} 0 -max