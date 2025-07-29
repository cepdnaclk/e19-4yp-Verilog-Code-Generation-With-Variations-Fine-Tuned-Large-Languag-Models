module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  if (s[3:1] inside {2'b101,2'b110,2'b111,2'b011})
    s = 1;
  else if (s [3:1] inside {2'b010,2'b011,2'b100,2'b101})
    ca = 1;
  else if (s[3:1] inside {2'b100,2'b010})  // Note use of 'inside' operator
    s = ca = 0;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Synthesis Log:
[Synth 8-508] synth_design -top testbench_h -part xc7a100tfgg484-3
### Simulation Log:
[Sim 8-508] do_simulate -force xcelium -input testbench_h
Using Xcelium version 20.1.0-1139954
.l ha_8.v
.l testbench_h.v
.procs
.end
trce -labels -v
rtrace -labels -v
.end
.tran 0.01 0.10
.end