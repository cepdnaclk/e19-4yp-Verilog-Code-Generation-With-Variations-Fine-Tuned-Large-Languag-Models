module test;
wire a;
struct packed {reg x, y, z;} packed_sig;
assign #25 a = 1;
always begin
    packed_sig.x = #10 a;
end
endmodule
### Expected Result:
```
% SV-comp 2017-07-16
## IMPORTANT : The output format of test has changed
##   1) Removed the line "ERROR: SV-COMP test bench abnormal termination" from the output.
##   2) Removed the line "# 1" from the output.
```
##
```
$SVCOMP_TIMEOUT
```