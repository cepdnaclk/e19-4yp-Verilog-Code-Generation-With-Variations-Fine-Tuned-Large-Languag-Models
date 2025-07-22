module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
`time f$100
`time f$101
`time f$102
`time f$103
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
### Result:
```
time 0: en=00, di=00, do=00
time 100: en=00, di=00, do=01
time 200: en=00, di=00, do=10
time 300: en=00, di=10, do=10
time 400: en=01, di=10, do=10
time 500: en=11, di=10, do=10
time 600: en=11, di=10, do=01
time 700: en=11, di=01, do=01
time 800: en=11, di=01, do=00
time 900: en=11, di=00, do=00
time 1000: en=11, di=00, do=00
time 1100: en=11, di=00, do=00
time 1200: en=11, di=00, do=00
time 1300: en=11, di=00, do=00
time 1400: en=11, di=00, do=00
time 1500: en=11, di=00, do=00
time 1600: en=11, di=00, do=00
time 1700: en=11, di=00, do=00
time 1800: en=11, di=00, do=00
time 1900: en=11, di=00, do=00
time 2000: en=11, di=00, do=00
time 2100: en=11, di=00, do=00
time 2200: en=11, di=00, do=00
time 2300: en=11, di=00, do=00
time 2400: en=11, di=00, do=00
time 2500: en=11, di=00, do=00
time 2600: en=11, di=00, do=00
time 2700: en=11, di=00, do=00
time 2800: en=11, di=00, do=00
time 2900: en=11, di=00, do=00
time 3000: en=11, di=00, do=00
time 3100: en=11, di=00, do=00
time 3200: en=11, di=00, do=00
time 3300: en=11, di=00, do=00
time 3400: en=11, di=00, do=00
time 3500: en=11, di=00, do=00
time 3600: en=11, di=00, do=00
time 3700: en=11, di=00, do=00
time 3800: en=11, di=00, do=00
time 3900: en=11, di=00, do=00
time 4000: en=11, di=00, do=00
time 4100: en=11, di=00, do=00
time 4200: en=11, di=00, do=00
time 4300: en=11, di=00, do=00
time 4400: en=11, di=00, do=00
time 4500: en=11, di=00, do=00
time 4600: en=11, di=00, do=00
time 4700: en=11, di=00, do=00
time 4800: en=11, di=00, do=00
time 4900: en=11, di=00, do=00
time 5000: en=11, di=00, do=00
time 5100: en=11, di=00, do=00
time 5200: en=11, di=00, do=00
time 5300: en=11, di=00, do=00
time 5400: en=11, di=00, do=00
time 5500: en=11, di=00, do=00
time 5600: en=11, di=00, do=00
time 5700: en=11, di=00, do=00
time 5800: en=11, di=00, do=00
time 5900: en=11, di=00, do=00
time 6000: en=11, di=00, do=00
time 6100: en=11, di=00, do=00
time 6200: en=11, di=00, do=00
time 6300: en=11, di=00, do=00
time 6400: en=11, di=00, do=00
time 6500: en=11, di=00, do=00
time 6600: en=11, di=00, do=00
time 6700: en=11, di=00, do=00
time 6800: en=11, di=00, do=00
time 6900: en=11, di=00, do=00
time 7000: en=11, di=00, do=00
time 7100: en=11, di=00, do=00
time 7200: en=11, di=00, do=00
time 7300: en=11, di=00, do=00
time 7400: en=11, di=00, do=00
time 7500: en=11, di=00, do=00
time 7600: en=11, di=00, do=00
time 7700: en=11, di=00, do=00
time 7800: en=11, di=00, do=00
time 7900: en=11, di=00, do=00
time 8000: en=11, di=00, do=00
time 8100: en=11, di=00, do=00
time 8200: en=11, di=00, do=00
time 8300: en=11, di=00, do=00
time 8400: en=11, di=00, do=00
time 8500: en=