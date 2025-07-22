module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [1:0] Q[2];
always @(posedge Clock)
begin
    while(1)
    begin
        Q[0] <= D;
        Q[1] <= Q[0];
    end
end
endmodule
### Test Case:
### Expected Output:

### Observed Output:

/README.md
# Verilog
I will be adding and updating the Verilog code I found on https://www.electronics-tutorials.ws/verilog/index.html