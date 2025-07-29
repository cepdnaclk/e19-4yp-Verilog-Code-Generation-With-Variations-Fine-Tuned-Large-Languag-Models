module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
struct{
	rand logic [7:0] rand_data;
} my_struct;
initial begin
	$display("Rand Data: %h", my_struct.rand_data);
end
endmodule
### Result:
%vitis_hls -f system_top.tcl -t hw
### Note:
This is to provide a reference implementation for a random struct. The random number used by structs in SystemVerilog is deterministic.
### Expected Output:
Rand Data: 2'b01

### Actual Output:
Rand Data: 2'b10

### Actual Output 2:
Rand Data: 2'b10

### Actual Output 3:
Rand Data: 2'b01

### Actual Output 4:
Rand Data: 2'b10

### Actual Output 5:
Rand Data: 2'b01

### Actual Output 6:
Rand Data: 2'b10

### Actual Output 7:
Rand Data: 2'b01

### Actual Output 8:
Rand Data: 2'b10

### Actual Output 9:
Rand Data: 2'b10

### Actual Output 10:
Rand Data: 2'b01

### Actual Output 11:
Rand Data: 2'b10

### Actual Output 12:
Rand Data: 2'b10

### Actual Output 13:
Rand Data: 2'b10

### Actual Output 14:
Rand Data: 2'b10

### Actual Output 15:
Rand Data: 2'b01

### Actual Output 16:
Rand Data: 2'b10

### Actual