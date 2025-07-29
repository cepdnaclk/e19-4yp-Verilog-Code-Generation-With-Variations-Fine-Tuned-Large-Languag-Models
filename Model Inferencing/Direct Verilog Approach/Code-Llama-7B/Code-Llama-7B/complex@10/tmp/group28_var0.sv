```
`define pck_range_0_to_2 pkg::state_0_to_2
`define pck_range_3_to_5 pkg::state_3_to_5

package pkg;
	typedef enum {state_0_to_2,state_3_to_5} state_t;
endpackage

module dlatch(en,d,q,qb);
input en,d;
output q,qb;
wire q,qb;
state_t state;
localparam delay = 2;
initial q = 1'b0;
qb = ~q;
always @(posedge en)
case(state) inside
	`pck_range_0_to_2: if (d) begin 
	                        q <= 1'b1;
				state <= state + 1; end
	`pck_range_3_to_5: if (d) state <= state + 1;
endcase
always @(negedge en)
case(state) inside
	`pck_range_0_to_2: q <= 1'b0;
	`pck_range_3_to_5: state <= state - 1;
endcase
endmodule
```
## 19.2.11
### Problem
```
//1) Add a reset signal to the above design.
//2) When reset is high, set the output to X and disable the output driver for 4 cycles.
//3) Imagine the latch is being used for a flip-flop. How do you ensure that the output is high-impedance prior to the first clock edge?
```
### Solution
```
module dlatch(en,d,q,qb,rst);
input en,d,rst;
output q,qb;
wire q,qb;
state_t state;
localparam delay = 2;
initial q = 1'b0;
qb = ~q;
always @(posedge en)
case(state) inside
	`pck_range_0_to_2: if (d) begin 
	                        q <= 1'b1;
				state <= state + 1