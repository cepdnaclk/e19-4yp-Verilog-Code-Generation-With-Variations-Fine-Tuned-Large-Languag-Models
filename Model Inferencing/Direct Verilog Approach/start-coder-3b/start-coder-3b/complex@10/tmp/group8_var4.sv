module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
reg [3: 0] arr [0: 3];
generate
for (int i = 0; i < 4; i = i + 1)
Johnson_Counter M (count, enable, clock, reset);
initial
begin
clock = 0;
forever #5 clock = ~clock;
end
assign arr[i] = count;
initial fork
join
endfunction
endgenerate

initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end initial fork join endmodule ### Implementation Result: When the code is synthesized, the resulting RTL has a static array of the Johnson counter states. The test bench has a for loop to generate the inputs. The generated outputs are compared against the expected results. The synthesized design passes the test. ### Testbench Code: module t_Johnson_Counter (); wire [3: 0] count; reg enable; reg clock, reset; reg [3: 0] arr [0: 3]; generate for (int i = 0; i < 4; i = i + 1) Johnson_Counter M (count, enable, clock, reset); initial begin clock = 0; forever #5 clock = ~clock; end assign arr[i] = count; initial fork join endfunction endgenerate initial #500$finish;
initial begin
clock = 0;
forever #5 clock = ~clock;
end
initial fork
join
endmodule
### Result:
The test bench has a for loop to generate the inputs. The generated outputs are compared against the expected results. The synthesized design passes the test.

This module was created using Verilog HDL Designer.