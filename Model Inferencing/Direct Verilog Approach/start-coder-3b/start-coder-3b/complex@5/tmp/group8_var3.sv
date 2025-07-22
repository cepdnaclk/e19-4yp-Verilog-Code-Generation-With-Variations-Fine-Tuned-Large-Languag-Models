module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
generate
`for (i = 0; i < 16; i = i + 1) begin
Johnson_Counter M1 (count, enable, clock, reset);
always @ (posedge clock, posedge reset)
if (!reset) count[i] <= 0;
else if (enable)
case (count[i])
4'b0000,
4'b0001,
4'b0011,
4'b0111: count[i] <= {count[i][2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count[i] <= {count[i][2: 0], 1'b0};
default: count[i] <= 0;
endcase
end
end
endgenerate
join
endmodule

## Question 4 (10 points):

### Base Verilog Code:
module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish; initial begin clock = 0; forever #5 clock = ~clock; end initial fork join endmodule ### Variation Instruction: 1. Use `generate` block to instantiate 16 Johnson counters. 2. Use `assign` to assign 16 `count` signals to a 16-bit input `in`. 2. Use `assign` to assign 16 `count` signals to a 16-bit output `out`. 3. Use `always_comb` to generate 16 `assign` statements to assign `out` values to `in`. ### Modified Code: module t_Johnson_Counter (); wire [3: 0] count; reg enable; reg clock, reset; Johnson_Counter M0 (count, enable, clock, reset); initial #500$finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
generate
`for (i = 0; i < 16; i = i + 1) begin
Johnson_Counter M1 (count, enable, clock, reset);
always @ (posedge clock, posedge reset)
if (!reset) count[i] <= 0;
else if (enable)
case (count[i])
4'b0000,
4'b0001,
4'b0011,
4'b0111: count[i] <= {count[i][2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count[i] <= {count[i][2: 0], 1'b0};
default: count[i] <= 0;
endcase
end
end
endgenerate
assign in = {count[3: 0], 1};
assign out = {count[12: 8]};
assign
for (i = 0; i < 16; i = i + 1)
out[i] = M1.count[i];
end
join
endmodule

## Question 5 (20 points):

### Base Verilog Code:
module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish; initial begin clock = 0; forever #5 clock = ~clock; end initial fork join endmodule ### Variation Instruction: 1. Use `always_ff` to add a Johnson counter to the base code. 2. Use `always_ff` to add another Johnson counter to the base code. ### Modified Code: module t_Johnson_Counter (); wire [3: 0] count; reg enable; reg clock, reset; Johnson_Counter M0 (count, enable, clock, reset); initial #500$finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
always_ff @(posedge clock or posedge reset)
if (!reset) count <= 0;
else if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: count <= {count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
end
always_ff @(posedge clock or posedge reset)
if (!reset) count <= 0;
else if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: count <= {count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
end
join
endmodule

## Question 6 (10 points):

### Base Verilog Code:
module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500$finish; initial begin clock = 0; forever #5 clock = ~clock; end initial fork join endmodule ### Variation Instruction: 1. Use `reg` in `always_ff` to add a Johnson counter to the base code. 2. Use `reg` in `always_ff` to add another Johnson counter to the base code. 3. Use `wire` in `always_ff` to add a Johnson counter to the base code. 4. Use `wire` in `always_ff` to add another Johnson counter to the base code. ### Modified Code: module t_Johnson_Counter (); wire [3: 0] count; reg enable; reg clock, reset; Johnson_Counter M0 (count, enable, clock, reset); initial #500$finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
always_ff @(posedge clock or posedge reset)
if (!reset) M0.count <= 0;
else if (enable)
case (M0.count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: M0.count <= {M0.count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: M0.count <= {M0.count[2: 0], 1'b0};
default: M0.count <= 0;
endcase
end
always_ff @(posedge clock or posedge reset)
if (!reset) M0.count <= 0;
else if (enable)
case (M0.count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: M0.count <= {M0.count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: M0.count <= {M0.count[2: 0], 1'b0};
default: M0.count <= 0;
endcase
end
join
endmodule

## Question 7 (10 points):

This question is designed to show that you understand the process of designing a Verilog module.

### Base Verilog Code:

module t_Johnson_Counter ();
initial #500 $finish; initial begin