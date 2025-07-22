module ha_2(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  ha_1 ha(s,ca,a,b);
endmodule
### Compilation Command:
vlog -sv ha_1.sv ha_2.sv && vsim -novopt -sv_lib -l log.txt ha_2
### Output:
```
(vsim-21763) (sv_lib) Error: /u/mjones/tmp/sv.2/sv.2.3/ha_2.sv(7): Module ha_2 was not compiled
(vsim-21763) (sv_lib) Error: Error count: 1
```