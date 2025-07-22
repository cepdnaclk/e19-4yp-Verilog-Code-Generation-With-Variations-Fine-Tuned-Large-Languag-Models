module multiplexer( input logic d_in0, input logic d_in1,
input logic d_in2, input [1:0] s_cnt, output logic q );
logic [1:0] ctrl_logic;
always @( posedge s_cnt ) begin: combinational
case( s_cnt )
4'b0000: ctrl_logic = 0;
4'b0001: ctrl_logic = 0;
4'b0010: ctrl_logic = 0;
4'b0011: ctrl_logic = 0;
4'b0100: ctrl_logic = 1;
4'b0101: ctrl_logic = 1;
4'b0110: ctrl_logic = 1;
4'b0111: ctrl_logic = 1;
4'b1000: ctrl_logic = 2;
4'b1001: ctrl_logic = 2;
4'b1010: ctrl_logic = 2;
4'b1011: ctrl_logic = 2;
4'b1100: ctrl_logic = 3;
4'b1101: ctrl_logic = 3;
4'b1110: ctrl_logic = 3;
4'b1111: ctrl_logic = 3;
endcase
end
always @( posedge s_cnt ) begin: register
if ( ctrl_logic == 0 ) q <= d_in0;
else if ( ctrl_logic == 1 ) q <= d_in1;
else if ( ctrl_logic == 2 ) q <= d_in2;
else if ( ctrl_logic == 3 ) q <= ctrl_logic;
end
endmodule

## Decrementer

Decrementers are used in many places in hardware, and are the base of many of the logic gates. The decrementer is a device that enables one or more inputs to be routed to the same output based on a single control input. This is accomplished by using a logic expression to select the correct data to be routed to the output. While many ways of implementing a decrementer can be found online, the code sample below uses a combinational logic expression and a register to implement one.

### Base Verilog Code:
module decrementer( input logic ld, input [3:0] s_cnt, output logic [3:0] q );
reg [3:0] int_q;
always @( posedge ld ) begin: combinational
int_q = q