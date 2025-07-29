module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule

module muxdfftest(input_wire [31:0] Clock,
                  input_wire Sel,
                  input_wire Signal[31],
                  input_wire [31:0] In,
                  input_wire Out);

muxdff dut(.Sel(Sel),.Clock(Clock),.D0(Signal[In[31:24]]),.D1(Signal[In[23:16]]),.Q(Q[0]));
muxdff dut1(.Sel(Sel),.Clock(Clock),.D0(Signal[In[15:8]]),.D1(Signal[In[7:0]]),.Q(Q[1]));

assert property(@(posedge Clock) (Q & (~Sel)) ##1 $past(Q,2) |-> $past(Q,2) == $past(Q,1));

endmodule

module tb_muxdfftest();

wire [31:0] Clock;
reg [31:0] Signal [0:255];
reg [31:0] In;
wire [1:0] Q;
wire Out;
initial begin
    Signal = new[256];
    Clock = 1'b1;
end

always #1 Clock