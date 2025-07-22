module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
assign z = ~s[1] & ~s[0] & c[0] // Select c[0] when s=00
| ~s[1] & s[0] & c[1] // Select c[1] when s=01
| s[1] & ~s[0] & c[2] // Select c[2] when s=10
| s[1] & s[0] & c[3]; // Select c[3] when s=11
| c[4]; // Default condition
endmodule
### Analysis:
In a case block, the last case has default condition, which is specified as a line with only 'default' keywords. The corresponding input signal (c[4]) is assigned to the output signal using | operator in 'endmodule' line. Thus, the case block is equivalent to a single line module. This is the reason that the case block is valid in Verilog HDL.
"""

# Input: 5-input switch box
v5_input_signal = ('s','y','z', 'a', 'b')
v5_output_signal = ('s','y','z', 'a', 'b')
v5_output_signal_value = ('0','1','0', '0', '1')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('0','1','1', '1', '1')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('0','1','0', '1', '1')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('0','1','1', '0', '1')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('0','1','1', '1', '0')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('0','1','0', '0', '0')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','0', '0', '0')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','1', '0', '0')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','0', '1', '0')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','1', '1', '0')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','0', '0', '1')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','1', '0', '1')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','0', '1', '1')

# Input: 5-input switch box
#v5_input_signal = ('s','y','z', 'a', 'b')
#v5_output_signal = ('s','y','z', 'a', 'b')
#v5_output_signal_value = ('1','1','1', '1', '1')

print('Input: 5-input switch box')
print('Inverter Case: ')
print(v5inverter_code)
print('Verilog Code: ')
print(v5_verilog)
v5inverter_verilog = v5inverter_code.replace('s','s1').replace('y','y1').replace('z','z1').replace('a','a1').replace('b','b1').replace('c','c1')
print('Verilog Code with Verilog HDL Syntax (inverter module): ')
print(v5inverter_verilog)

print('Multiplexer 4:1 Case: ')
print(v5mux41_code)
print('Verilog Code: ')
print(v5_verilog)
v5mux41_verilog = v5mux41_code.replace('s','s2').replace('y','y2').replace('z','z2').replace('a','a2').replace('b','b2').replace('c','c2')
print('Verilog Code with Verilog HDL Syntax (multiplexer 4:1 module): ')
print(v5mux41_verilog)

print('Multiplexer 4:2 Case: ')
print(v5mux42_code)
print('Verilog Code: ')
print(v5_verilog)
v5mux42_verilog = v5mux42_code.replace('s','s3').replace('y','y3').replace('z','z3').replace('a','a3').replace('b','b3').replace('c','c3')
print('Verilog Code with Verilog HDL Syntax (multiplexer 4:2 module): ')
print(v5mux42_verilog)

print('Multiplexer 4:3 Case: ')
print(v5mux43_code)
print('Verilog Code: ')
print(v5_verilog)
v5mux43_verilog = v5mux43_code.replace('s','s4').replace('y','y4').replace('z','z4').replace('a','a4').replace('b','b4').replace('c','c4')
print('Verilog Code with Verilog HDL Syntax (multiplexer 4:3 module): ')
print(v5mux43_verilog)

print('Multiplexer 4:4 Case: ')
print(v5mux44_code)
print('Verilog Code: ')
print(v5_verilog)
v5mux44_verilog = v5mux44_code.replace('s','s5').replace('y','y5').replace('z','z5').replace('a','a5').replace('b','b5').replace('c','c5')
print('Verilog Code with Verilog HDL Syntax (multiplexer 4:4 module): ')
print(v5mux44_verilog)

print('Mux 4:1x3 Case: ')
print(v5mux41_code)