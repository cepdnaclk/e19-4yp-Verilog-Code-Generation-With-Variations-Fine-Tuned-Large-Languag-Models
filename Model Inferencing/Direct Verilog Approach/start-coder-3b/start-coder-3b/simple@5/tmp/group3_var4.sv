module full_adder_3_inputs(i1, i2, cin, i3, sum, cout);
input i1, i2, cin, i3;
output logic[1:0] sum, cout;
assign sum = i1 ^ i2 ^ cin ^ i3;
assign cout = (i1 & i2 & i3) | (cin & (i1 | i2 | i3));
endmodule
### Output:
![FullAdder3Inputs](images/full_adder_3_inputs.PNG)
### Output Simulation:
![FullAdder3Inputs_Simulation](images/full_adder_3_inputs_simulation.PNG)


## Multiplexor
### Base Verilog Code:
module multiplexor(x, sel, y);
input x, sel;
output y;
assign y = x;
assign y = ~sel & (sel & x) | (~sel & x);
endmodule
### Output:
![Multiplexor](images/multiplexor.PNG)
### Output Simulation:
![Multiplexor_Simulation](images/multiplexor_simulation.PNG)


## Multiplexer
### Base Verilog Code:
module multiplexer(i0,i1,sel,out);
input i0,i1;
input sel;
output out;
assign out = sel? i1 : i0;
endmodule
### Output:
![Multiplexer](images/multiplexer.PNG)
### Output Simulation:
![Multiplexer_Simulation](images/multiplexer_simulation.PNG)


## Encoder
### Base Verilog Code:
module encoder(in, out);
input in;
output [3:0] out;
assign out[3:0] = in;
endmodule
### Output:
![Encoder](images/encoder.PNG)
### Output Simulation:
![Encoder_Simulation](images/encoder_simulation.PNG)


## Decoder
### Base Verilog Code:
module decoder(in, out);
input [3:0] in;
output out;
assign out = in;
endmodule
### Output:
![Decoder](images/decoder.PNG)
### Output Simulation:
![Decoder_Simulation](images/decoder_simulation.PNG)


## Summing Module
### Base Verilog Code:
module summing_module(clk, a1, a2, a3, sum1, sum2, sum3, sum4, c1, c2, c3, c4);
input clk;
input [1:0] a1, a2, a3;
output [1:0] sum1, sum2, sum3, sum4;
output c1, c2, c3, c4;
wire sum1_in, sum2_in, sum3_in, sum4_in;
wire c1_in, c2_in, c3_in, c4_in;
full_adder sum1_adder(a1[0], a2[0], a3[0], sum1[0], sum1_in[0]);
full_adder sum2_adder(a1[1], a2[1], a3[1], sum2[1], sum2_in[0]);
full_adder sum3_adder(a1[2], a2[2], a3[2], sum3[2], sum3_in[0]);
full_adder sum4_adder(a1[3], a2[3], a3[3], sum4[3], sum4_in[0]);
full_adder c1_adder(sum1_in[0], sum2_in[0], sum3_in[0], c1_in[0], c1[0]);
full_adder c2_adder(sum1_in[1], sum2_in[1], sum3_in[1], c2_in[0], c2[0]);
full_adder c3_adder(sum1_in[1], sum2_in[1], sum3_in[1], c3_in[0], c3[0]);
full_adder c4_adder(sum1_in[1], sum2_in[1], sum3_in[1], c4_in[0], c4[0]);
endmodule
### Output:
![SummingModule](images/summing_module.PNG)
### Output Simulation:
![SummingModule_Simulation](images/summing_module_simulation.PNG)


## Shift Register
### Base Verilog Code:
module shift_register(clk, load, data, out);
input clk;
input load;
input [7:0] data;
output out;
reg [7:0] reg = 8'h0;
always @(posedge clk or negedge load) begin
if (load == 1'b1)
reg <= data;
end
endmodule
### Output:
![ShiftRegister](images/shift_register.PNG)
### Output Simulation:
![ShiftRegister_Simulation](images/shift_register_simulation.PNG)
/README.md
# VHDL-Projects

## Verilog Topics:

### Data Type:
![Data Types](images/data_types.PNG)

### Input, Output and Parameters:
![I/O and Parameters](images/io_and_parameters.PNG)

### Multiple Inputs and Outputs:
![Multiple Inputs and Outputs](images/multiple_inputs_and_outputs.PNG)

### Array:
![Array](images/array.PNG)

### Combinational Circuit:
![CombinationalCircuit](images/combinational_circuit.PNG)

### Synchronous Circuit:
![SynchronousCircuit](images/synchronous_circuit.PNG)

### Combinational Logic:
![CombinationalLogic](images