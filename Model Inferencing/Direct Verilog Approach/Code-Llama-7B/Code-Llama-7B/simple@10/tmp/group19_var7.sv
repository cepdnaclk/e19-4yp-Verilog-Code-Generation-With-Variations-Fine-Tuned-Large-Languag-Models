module tb_lpm_ff();

reg [7:0] input [3:0];
reg Reset;
reg Clock;
reg [7:0] output;

dff_inst dff (.D(input[0]),.Clock(Clock),.Resetn(Reset),.Q(output[0]));
dff_inst dff1 (.D(input[1]),.Clock(Clock),.Resetn(Reset),.Q(output[1]));
dff_inst dff2 (.D(input[2]),.Clock(Clock),.Resetn(Reset),.Q(output[2]));
dff_inst dff3 (.D(input[3]),.Clock(Clock),.Resetn(Reset),.Q(output[3]));

initial begin
    Clock = 0;
    Reset = 1;
    #5
    Reset = 0;
end


always
begin
    Clock = #5 ~Clock;
end

sequence test_vector(inputs, outputs);
    @(posedge Clock) Resetn == 0;
    for(int i=0; i<4; i = i+1) 
    @(posedge Clock) $rose(inputs[i]) |=> $rose(outputs[i]);
endsequence

assert property(test_vector(input, output));
endmodule
```

### 15.10 - 15.18

### Base Verilog Code:
```verilog
module bcd_counter_inst(Clock, Resetn, Num, En, BCD);
input Clock, Resetn;
input [3:0] Num;
input En;
output [6:0] BCD;

reg [3:0] cnt;
reg [3:0] cntn;

always @ (posedge Clock or negedge Resetn)
begin
    if(~Resetn)
    begin
        cnt <= 0;
        cntn <= 0;
        BCD <= 0;
    end
    else
    begin
        cnt <=