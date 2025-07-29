module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    if(a && b)
      (a, b *> s) = dl1;
    if(ca)
      (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Synthesis Results:
#### Latency:
![alt text](https://github.com/ahmed-si/Low-Power-FPGA-Designs/blob/main/Specify_path_delays/src/results/specify_path_delays_latency.png?raw=true)
#### Area: 
![alt text](https://github.com/ahmed-si/Low-Power-FPGA-Designs/blob/main/Specify_path_delays/src/results/specify_path_delays_