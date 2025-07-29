module SchedDelayB;
class C;
rand int a;
endclass

reg c[5];
reg s[5];
C cobj[5];

initial
begin
  for(int i = 0; i < 5; i++)
    c[i] = cobj[i].a;
end

always @(c[0]) s[0] = c[0];
always @(c[1]) s[1] = c[1];
always @(c[2]) s[2] = c[2];
always @(c[3]) s[3] = c[3] < 2;
always @(c[4]) s[4] = c[4];
endmodule
### Expected Output:
Test Passed.
### Test Metric: