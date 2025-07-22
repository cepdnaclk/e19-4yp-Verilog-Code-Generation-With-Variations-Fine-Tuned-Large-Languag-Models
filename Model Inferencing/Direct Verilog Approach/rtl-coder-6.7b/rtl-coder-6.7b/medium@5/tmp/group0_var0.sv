### Specparam:
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
  endspecify
### Testing:
  initial begin
    $display("a,b,s,ca");
    a = 0;
    b = 1;
    $display("%d,%d,%d,%d",a,b,s,ca);
  end
### Test Results:
a,