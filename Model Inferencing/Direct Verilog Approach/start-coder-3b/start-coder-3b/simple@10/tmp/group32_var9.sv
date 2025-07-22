1. t_Clock_Prog.v

```

module t_Clock_Prog ();

reg default_enum_status = 1'b0;
enum enum_status { default_enum_status, non_default_enum_status };

wire clock;

initial #100 $finish;
Clock_Prog M1 (clk, enum_status [1], enum_status [1], default_enum_status, enum_status [1], enum_status [1]);

endmodule
```
2. Clock_Prog.v

```

module Clock_Prog ( clk, input_array [0], input_array [1], output_array [0], output_array [1], resetn_enum, enable_array [0], enable_array [1] );

reg [3:0] input_array [0];
reg [3:0] input_array [1];
reg [3:0] output_array [0];
reg [3:0] output_array [1];
reg clk;
reg resetn_enum;
reg [1:0] enable_array [0];
reg [1:0] enable_array [1];
reg [1:0] [1:0] enum_status [1:0];
reg [2:0] [1:0] enum_status_0 [1:0];
reg [2:0] [1:0] enum_status_1 [1:0];

initial clk = 0;
initial resetn_enum = 1'b0;
initial enum_status [1:0] = 2'b00;
initial enum_status_0 [1:0] = 2'b00;
initial enum_status_1 [1:0] = 2'b00;
initial enable_array [0] = 1'b1;
initial enable_array [1] = 1'b1;
initial input_array [1] = 4'b1010;
initial output_array [0] = 4'b0101;
initial output_array [1] = 4'b1011;

Clock_Prog_L0 L0(clk, clk, resetn_enum, enum_status [0], ~enum_status [0], input_array [0], output_array [0], enable_array [0]);
Clock_Prog_L1 L1(clk, clk, resetn_enum, enum_status [1], ~enum_status [1], input_array [1], output_array [1], enable_array [1]);

endmodule
```
3. Clock_Prog_L0.v

```

module Clock_Prog_L0 ( clk, resetn_enum, enable_array [0], input_array, output_array );

reg clk;
reg enum_status [1:0];
reg resetn_enum;
reg [1:0] [1:0] enable_array [1:0];
reg [3:0] input_array;
reg [3:0] output_array;
reg [3:0] [1:0] [3:0] [1:0] [1:0] output_array_0 [1:0];
reg [3:0] [1:0] [3:0] [1:0] [1:0] output_array_1 [1:0];

initial clk = 0;
initial enum_status [1:0] = 2'b00;
initial resetn_enum = 1'b1;
initial enable_array [0] = 1'b1;
initial enable_array [1] = 1'b1;
initial input_array = 4'b0000;
initial output_array = 4'b0000;
initial output_array_0 [1:0] = 4'b0000;
initial output_array_1 [1:0] = 4'b0000;

always @(posedge clk or negedge resetn_enum) begin
	if (~resetn_enum) begin
		case (enum_status [0])
			3'b000 : begin
				output_array_0 [0] = 4'b0000;
				output_array_0 [1] = 4'b0000;
			end
			3'b001 : begin
				output_array_0 [0] = 4'b0000;
				output_array_0 [1] = 4'b0101;
			end
			3'b010 : begin
				output_array_0 [0] = 4'b1010;
				output_array_0 [1] = 4'b0101;
			end
			3'b011 : begin
				output_array_0 [0] = 4'b1010;
				output_array_0 [1] = 4'b0101;
			end
			3'b100 : begin
				output_array_0 [0] = 4'b0000;
				output_array_0 [1] = 4'b0011;
			end
			3'b101 : begin
				output_array_0 [0] = 4'b0000;
				output_array_0 [1] = 4'b0110;
			end
			3'b110 : begin
				output_array_0 [0] = 4'b1010;
				output_array_0 [1] = 4'b0110;
			end
			3'b111 : begin
				output_array_0 [0] = 4'b1010;
				output_array_0 [1] = 4'b0110;
			end
		end
		case (enum_status [1])
			3'b000 : begin
				output_array_1 [0] = 4'b0000;
				output_array_1 [1] = 4'b0000;
			end
			3'b001 : begin
				output_array_1 [0] = 4'b0000;
				output_array_1 [1] = 4'b0101;
			end
			3'b010 : begin
				output_array_1 [0] = 4'b1010;
				output_array_1 [1] = 4'b0101;
			end
			3'b011 : begin
				output_array_1 [0] = 4'b1010;
				output_array_1 [1] = 4'b0101;
			end
			3'b100 : begin
				output_array_1 [0] = 4'b0000;
				output_array_1 [1] = 4'b0011;
			end
			3'b101 : begin
				output_array_1 [0] = 4'b0000;
				output_array_1 [1] = 4'b0110;
			end
			3'b110 : begin
				output_array_1 [0] = 4'b1010;
				output_array_1 [1] = 4'b0110;
			end
			3'b111 : begin
				output_array_1 [0] = 4'b1010;
				output_array_1 [1] = 4'b0110;
			end
		end
		default: begin
			output_array_0 [0] = 4'b0000;
			output_array_0 [1] = 4'b0000;
			output_array_1 [0] = 4'b0000;
			output_array_1 [1] = 4'b0000;
		end
	endcase
end

always @(posedge clk or negedge resetn_enum) begin
	if (~resetn_enum) begin
		case (enum_status [0])
			3'b000 : begin
				output_array_0 [0] = 4'b0000;
				output_array_0 [1] = 4'b0000;
			end
			3'b001 : begin
				output_array_0 [0] = 4'b1010;
				output_array_0 [1] = 4'b0101;
			end