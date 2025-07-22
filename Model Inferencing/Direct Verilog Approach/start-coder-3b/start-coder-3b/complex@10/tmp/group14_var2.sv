module hex7seg_le(
input wire [3:0] x,
output wire [6:0] a_to_g
);
reg [6:0] led_state;
wire inside_check = (0 <= x) && (x < 7); // This is inside the 7-segment number system.
assign a_to_g = inside_check? led_state[x] : 1'b1;
generate
forall (0,6)
assign led_state[0] = ~x[3] & ~x[2] & ~x[1] & x[0];
assign led_state[5] = x[2] & x[1] & ~x[0];
// Insert this part select after "assign led_state[6] = ~x[3] & ~x[2] & x[1] & ~x[0];"
assign led_state[6] = inside_check? led_state[x]: 1'b1;
endgenerate
endmodule
### Results:
```
-bash-3.2$ csim-rv64-1.11 hex7seg_le.v hex7seg_le_tb.v
hex7seg_le_tb
VCD file hex7seg_le_tb.vcd written.

================================================================================================================
================================================================================================================
================================================================================================================
Testing hex7seg_le with initial value x=0000...
Initial value of x00000000 in hex7seg_le:
	x = x00000000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0001...
Initial value of x00010000 in hex7seg_le:
	x = x00010000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0002...
Initial value of x00020000 in hex7seg_le:
	x = x00020000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0003...
Initial value of x00030000 in hex7seg_le:
	x = x00030000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0004...
Initial value of x00040000 in hex7seg_le:
	x = x00040000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0005...
Initial value of x00050000 in hex7seg_le:
	x = x00050000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0006...
Initial value of x00060000 in hex7seg_le:
	x = x00060000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0007...
Initial value of x00070000 in hex7seg_le:
	x = x00070000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0008...
Initial value of x00080000 in hex7seg_le:
	x = x00080000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0009...
Initial value of x00090000 in hex7seg_le:
	x = x00090000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000a...
Initial value of x000a0000 in hex7seg_le:
	x = x000a0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000b...
Initial value of x000b0000 in hex7seg_le:
	x = x000b0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000c...
Initial value of x000c0000 in hex7seg_le:
	x = x000c0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000d...
Initial value of x000d0000 in hex7seg_le:
	x = x000d0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000e...
Initial value of x000e0000 in hex7seg_le:
	x = x000e0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000f...
Initial value of x000f0000 in hex7seg_le:
	x = x000f0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0000...
Initial value of x00000000 in hex7seg_le:
	x = x00000000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0001...
Initial value of x00010000 in hex7seg_le:
	x = x00010000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0002...
Initial value of x00020000 in hex7seg_le:
	x = x00020000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0003...
Initial value of x00030000 in hex7seg_le:
	x = x00030000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0004...
Initial value of x00040000 in hex7seg_le:
	x = x00040000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0005...
Initial value of x00050000 in hex7seg_le:
	x = x00050000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0006...
Initial value of x00060000 in hex7seg_le:
	x = x00060000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0007...
Initial value of x00070000 in hex7seg_le:
	x = x00070000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0008...
Initial value of x00080000 in hex7seg_le:
	x = x00080000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=0009...
Initial value of x00090000 in hex7seg_le:
	x = x00090000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000a...
Initial value of x000a0000 in hex7seg_le:
	x = x000a0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000b...
Initial value of x000b0000 in hex7seg_le:
	x = x000b0000
	inside_check=1
================================================================================================================
Testing hex7seg_le with initial value x=000c...
Initial value of x000c0000 in hex7seg_le:
	x = x000c0000
	inside_check=1
================================================================================================================