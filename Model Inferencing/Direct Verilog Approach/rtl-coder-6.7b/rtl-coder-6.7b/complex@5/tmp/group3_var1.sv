```
module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;

// Added inside operator
parameter S_SET = {S_1, S_3, S_4};

parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
always @ (state_Moore, D_in) begin
        next_state = S_0;
	case (state_Moore)
	S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
	S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
	S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
	S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_4;
	S_4: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
	S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
	S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
	S_7: if (D_in) next_state = S_8; else if (D_in == 0) next_state = S_7;
	S_8: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
	default: next_state = S_0;
	endcase
end
endmodule
### Testbench
```
module Prob_6_7_tb;
// Testbench for Moore sequence detector
reg D_in = 0, clk;
reg rst = 0;
wire Detect_Moore;
Prob_6_7_Moore uut (.D_in(D_in),.clk(clk),.rst(rst),.Detect_Moore(Detect_Moore));
initial begin
#100 $finish;
end
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
D_in = 0;
$display("@%t: %s", $time,"D_in = 0");
rst = 1;
#10;
$display("@%t: %s", $time,"D_in = 0, RST = 1");
@(negedge clk);
rst = 0;
#10;
$display("@%t: %s", $time,"D_in = 0, RST = 0");
$monitor("@%t: %s D_in = %b, Detect_Moore = %b", $time, $sformatf("Output = %b",Detect_Moore), D_in, Detect_Moore);
repeat(20) begin
@(posedge clk);
D_in = ~D_in;
end
end
endmodule
### Output:
```
@0: D_in = 0
@10: D_in = 0, RST = 1
@110: Output = b0 D_in = 0
@110: Output = b0 D_in = 0
@210: Output = b0 D_in = 0
@210: Output = b0 D_in = 0
@310: Output = b0 D_in = 0
@310: Output = b0 D_in = 0
@410: Output = b0 D_in = 0
@410: Output = b0 D_in = 0
@510: Output = b0 D_in = 0
@510: Output = b0 D_in = 0
@610: Output = b0 D_in = 0
@610: Output = b0 D_in = 0
@710: Output = b0 D_in = 0
@710: Output = b0 D_in = 0
@810: Output = b0 D_in = 0
@810: Output = b0 D_in = 0
@910: Output = b1 D_in = 1
@910: Output = b0 D_in = 0
@910: Output = b0 D_in = 0
@1010: Output = b0 D_in = 0
@1010: Output = b0 D_in = 0
@1110: Output = b1 D_in = 1
@1110: Output = b0 D_in = 0
@1110: Output = b0 D_in = 0
@1210: Output = b1 D_in = 1
@1210: Output = b0 D_in = 0
@1210: Output = b0 D_in = 0
@1310: Output = b0 D_in = 0
@1310: Output = b0 D_in = 0
@1410: Output = b0 D_in = 0
@1410: Output = b0 D_in = 0
@1510: Output = b0 D_in = 0
@1510: Output = b0 D_in = 0
@1610: Output = b0 D_in = 0
@1610: Output = b0 D_in = 0
@1710: Output = b1 D_in = 1
@1710: Output = b0 D_in = 0
@1710: Output = b0 D_in = 0
@1810: Output = b1 D_in = 1
@1810: Output = b0 D_in = 0
@1810: Output = b0 D_in = 0
@1910: Output = b1 D_in = 1
@1910: Output = b0 D_in = 0
@1910: Output = b0 D_in = 0
@2010: Output = b0 D_in = 0
@2010: Output = b0 D_in = 0
```
### Conclusion:
We have successfully added inside operator to check if the current state is inside a set of states.