module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    if(a[5:1] inside {[6:10], [2:4], [0:2]}) begin
      (a, b *> s) = dl1;
      (a, b *> ca) = dl2;
    end
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
### Verification:
Run the command "run" to obtain the summary report.
The expected report should be:
```