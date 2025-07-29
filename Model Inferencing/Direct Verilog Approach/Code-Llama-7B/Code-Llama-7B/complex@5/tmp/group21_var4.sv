module Prob_6_7_Mealy (Detect_Mealy, D_in, clk, rst);
// Mealy nonresetting sequence detector
output Detect_Mealy;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
parameter S_5 = 5, S_6 = 6, S_7 = 7;
reg [2: 0] state_Mealy, next_state;
wire Detect_Mealy = (((state_Mealy == S_3)&&(D_in inside {1'b0, 1'b1}))
|| ((state_Mealy == S_7)&&(D_in inside {1'b0, 1'b1})));
always @ (posedge clk) if (rst) state_Mealy <= S_0; else state_Mealy <= next_state;
always @ (state_Mealy, D_in) begin
next_state = S_0;
case (state_Mealy)
S_0: if (D_in inside {1'b0, 1'b1}) next_state = S_1; else if (D_in == 0) next_state = S_5;
S_1: if (D_in inside {1'b0, 1'b1}) next_state = S_2; else if (D_in == 0) next_state = S_5;
S_2: if (D_in inside {1'b0, 1'b1}) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_3: if (D_in inside {1'b0, 1'b1}) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_5: if (D_in inside {1'b0, 1'b1}) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_6: if (D_in inside {1'b0, 1'b1}) next_state = S_1; else if (D_in == 0) next_state = S_7;
S_7: if (D_in inside {1'b0, 1'b1}) next_state = S_1; else if (D_in == 0) next_state = S_7;
default: next_state = S_0;
endcase
end
endmodule
### Generating Test Vector:
```python
import random
import string
import numpy as np
import veri
from veriutils import rand_bit_list, rand_bit_list_msb, rand_one_hot
from pdk_test import pdk_test

def gen_data(arg1, arg2, arg3, arg4, arg5, arg6):
	if (arg1 == "D_in") : return rand_bit_list(arg2)
	elif (arg1 == "clk") : return "1"
	elif (arg1 == "rst") : return rand_one_hot(arg2)
	else : print "Error: testbench has no variable called " + arg1

def gen_tests(n):
	test_list = []
	for i in range(n):
		rst_list = rand_bit_list_msb(2)
		d_in_list = rand_bit_list(30)
		clk_list = rand_bit_list(2)
		test_list.append({"clk": clk_list, "rst": rst_list, "D_in": d_in_list})
	return test_list

def get_data_list(test_list):
	data_list = []
	for test in test_list:
		data_list.append(['clk', 'rst', 'D_in'])
		data_list.append(test['clk'])
		data_list.append(test['rst'])
		data_list.append(test['D_in'])
	return data_list

def print_vector(test_list):
	data_list = get_