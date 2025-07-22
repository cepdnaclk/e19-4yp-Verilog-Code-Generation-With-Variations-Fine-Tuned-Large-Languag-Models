module IR ( logic [1:0] A [0:3], input [7:0] data_in, input load, clk, output reg [7:0] data_out );
always @( posedge clk )
if ( load ) data_out <= data_in;
end
endmodule
#
### Simulation:
The simulation will be run using the following testbench code:
### Testbench:
module irtb;
logic clk;
logic load;
logic [7:0] data_in;
logic [4:0] A;
logic [7:0] data_out;

# Generate inputs from a packed array
reg_A  = 0;
A = {A[3:2], A[1:0]};

initial
# 100ns delay
clk = 0;
# 100ns delay
load = 1;
# 100ns delay
# Run 5 cycles
# 50ns delay
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =!$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load = $rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 # 100ns delay clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
\$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
# 100ns delay

end
endmodule



# 10.9.2.5.1  Simulating the FSM With the New IR Module

To finish the module, we add the following to the end of the IR module:

## module IR( input [7:0] data_in, input load, clk,
## output reg [7:0] data_out );
##
## // Simple register (Instruction Register) loaded on posedge clk when load is high
## always @( posedge clk )
## if ( load ) data_out <= data_in;
##

/*
The clock signal does not need to be explicitly added to the module because the
module is already listed in the netlist.
*/
endmodule


## Simulating the FSM With the New IR Module

The simulation will be run using the following testbench code:

### Testbench:
module irtb;
logic clk;
logic load;
logic [7:0] data_in;
logic [4:0] A;
logic [7:0] data_out;

# Generate inputs from a packed array
reg_A = 0;
A = {A[3:2], A[1:0]};

initial
# 100ns delay
clk = 0;
# 100ns delay
load = 1;
# 100ns delay
# Run 5 cycles
# 50ns delay
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =!$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 # 100ns delay clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 # 100ns delay clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
clk =!$rose(); load =$rose();
$display("data_in = %x, data_out = %x", data_in, data_out); data_in = 2, data_out = 2 # 100ns delay clk =$rose();
load =!$rose();$display("data_in = %x, data_out = %x", data_in, data_out);
data_in = 2, data_out = 2
end
endmodule



# 10.9.2.5.2  Simulation Run Using Waveform Capture

After the simulation is run, the waveform will be captured using the Waveform Capture utility to the following file

### Waveform

Figure