module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
wire [1:0] w = {w0, w1, w2, w3};
always @(w or S)
    inside(S, w);
endmodule

### Testbench:
module tb;
reg w0, w1, w2, w3;
reg [1:0] S;
wire f;
mux4to1 uut(w0, w1, w2, w3, S, f);
initial begin
    S = 2'b00;
    w0 = 1'b1;
    w1 = 1'b0;
    w2 = 1'b0;
    w3 = 1'b0;
    #10ns;
    w0 = 1'b0;
    w1 = 1'b1;
    w2 = 1'b0;
    w3 = 1'b0;
    #10ns;
    w0 = 1'b0;
    w1 = 1'b0;
    w2 = 1'b1;
    w3 = 1'b0;
    #10ns;
    w0 = 1'b0;
    w1 = 1'b0;
    w2 = 1'b0;
    w3 = 1'b1;
end
endmodule
### Benchmarking Result:
```
# Clock periods
real time: 10n (simulation time)
real time: 35n (elaboration time)
real time: 10n (simulation time)
real time: 33n (elaboration time)
real time: 10n (simulation time)
real time: 31n (elaboration time)
real time: 10n (simulation time)
real time: 30n (elaboration time)

# Number of dynamic instructions
1001921
```