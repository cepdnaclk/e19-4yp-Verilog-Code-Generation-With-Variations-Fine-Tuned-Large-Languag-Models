or_fr_rl.v:
```
module or_fr_rl(DataIn, DataOut, clock);
parameter Delay = 2;	// Delay in time units of the OR gate
parameter Delay_release = 5;	// Amount of time to hold the release line

// Parameter block
parameter [0:0] DataIn_tmp = {DataIn[2:0]};

input clock;
input [1:0] DataIn;
output reg [1:0] DataOut;

// Registers and inverters
reg [1:0] D_n;
reg [1:0] D_not;

// Delayed assignments

always @(posedge clock) begin
	D_not[2:0] <= ~DataIn[2:0];
	D_not[1] <= 1;
end

always @(posedge clock) begin
	case(DataOut)	// Compare register and output toggling (case 1)
		DataOut[2:0]: begin
			D_n[0] <= 1;
			D_n[1] <= 0;
		end
		default: begin
			D_n[0] <= 0;
			D_n[1] <= 0;
		end
	endcase
end

always @(posedge clock) begin
	case(D_n)	// Compare delay and register (case 2)
		D_not[2:0]: begin
			D_n[2] <= Delay_release + Delay;
			D_n[3] <= ~Delay_release + Delay;
		end
		default: begin
			D_n[2] <= Delay;
			D_n[3] <= Delay;
		end
	endcase
end

always @(posedge clock) begin
	D_n[2:0] <= D_not[2:0];
end

assign DataOut = D_n;

// Forces
always @(posedge clock) begin
	D_n[1] <= 1;	// Force '1' to 'DataOut'
end

always @(posedge clock) begin
	D_n[1] <= 0;	// Release '1' from 'DataOut'
end
```

# Task 6

### Base Verilog Code:
module or_fr_rl; // OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,