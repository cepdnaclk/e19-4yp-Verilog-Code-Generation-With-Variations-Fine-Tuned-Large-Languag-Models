module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
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
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
generate
for (i = 0; i < 16; i = i + 1)
Johnson_Counter M0_i (count, enable, clock, reset);
initial enable = 0;
initial begin clock = 0; for (j = 0; j < 50; j = j + 1) #5 clock = ~clock; end while (j < 200) #5 clock = ~clock; end

always #500 begin reset = 0; enable = 0; for (j = 0; j < 50; j = j + 1) #5 clock = ~clock; end while (j < 200) #5 clock = ~clock; end
enable = 1; for (j = 0; j < 50; j = j + 1) #5 clock = ~clock; end while (j < 200) #5 clock = ~clock; end end

initial enable = 1;
initial begin clock = 0; for (j = 0; j < 50; j = j + 1) #5 clock = ~clock; end while (j < 200) #5 clock = ~clock; end

always #500 begin reset = 0; enable = 1; for (j = 0; j < 50; j = j + 1) #5 clock = ~clock; end while (j < 200) #5 clock = ~clock; end end
endgenerate

initial #500 $finish; initial begin clock = 0; forever #5 clock = ~clock; end endmodule ## 8.2.4.6 Exercises 1. Write a Verilog module that generates a bus of N 1-bit registers and an `N` bus register of N 1-bit registers. The N 1-bit registers should be connected together in any combination of N 1-bit registers. You will need to generate the `N` 1-bit registers and connect them with a case statement to connect the bus together. Your module should be parameterized such that the number of 1-bit registers in the bus is parameterized. 2. Write a Verilog module that generates a bus of N 1-bit registers and an `N` bus register of N 2-bit registers. The N 2-bit registers should be connected together in any combination of N 2-bit registers. You will need to generate the `N` 2-bit registers and connect them with a case statement to connect the bus together. Your module should be parameterized such that the number of 1-bit registers in the bus is parameterized. 3. Write a Verilog module that generates a bus of N 1-bit registers and an `N` bus register of N 1-bit registers. The N 1-bit registers should be connected together in any combination of N 1-bit registers. You will need to generate the `N` 1-bit registers and connect them with a case statement to connect the bus together. Your module should be parameterized such that the number of 1-bit registers in the bus is parameterized. 4. Write a Verilog module that generates a bus of N 1-bit registers, an `N` bus register of 2N 1-bit registers, and an `N` bus register of 4N 1-bit registers. Generate the N 1-bit registers and the 2N 1-bit registers and connect them with case and `default` statements. 5. Write a Verilog module that generates a bus of N 1-bit registers, an `N` bus register of 2N 1-bit registers, and an `N` bus register of 4N 1-bit registers for N = 4. Generate the N 1-bit registers and the 2N 1-bit registers and connect them with case and `default` statements. ## 8.2.5 Tips 1. Use the `inside` statement to check if an array index is inside a static array. The `inside` statement is part of the IEEE. 2. Use the inside statement to create a static array with a constant index. Use this static array with the inside statement to check if the array index is inside a static array. 3. Use the generate loop to create a static array with a constant index. Use this static array with the inside statement to check if the array index is inside a static array. You can use the generate block for all the Johnson counter examples and exercises. 1. Generate the Johnson counter N = 4 N times. 2. Generate the Johnson counter N = 8 N times. 3. Generate the Johnson counter N = 16 N times. 4. Do you see any difference in performance between the Johnson counters that use an array index that is inside a static array with a constant index and the Johnson counters that use an array index that is inside a dynamic array? ## 8.2.6 Problems 1. An N 1-bit register is connected to an N 1-bit register by a simple wire. Make a Verilog module that generates two N 1-bit wires that are connected together to form one N 1-bit register. Make sure that the number of N 1-bit wires are parameterized. 2. An N 1-bit register is connected to an N 1-bit register by a simple wire. Make a Verilog module that generates two N 1-bit wires that are connected together to form one N 1-bit register. Make sure that the number of N 1-bit wires are parameterized. 3. An N 1-bit register is connected to an N 1-bit register by a simple wire. Make a Verilog module that generates two N 1-bit wires that are connected together to form one N 1-bit register. Make sure that the number of N 1-bit wires are parameterized. 4. Make a Verilog module that generates a bus of N 1-bit registers and an N 1-bit bus register of N 1-bit registers. The N 1-bit bus register should be connected together in any combination of N 1-bit registers. Your module should be parameterized so that the number of 1-bit registers in the bus is parameterized. 5. Make a Verilog module that generates a bus of N 1-bit registers and an N 1-bit bus register of N 2-bit registers. The N 1-bit bus register should be connected together in any combination of N 2-bit registers. Your module should be parameterized so that the number of 1-bit registers in the bus is parameterized. 6. Make a Verilog module that generates a bus of N 1-bit registers and an N 1-bit bus register of N 1-bit registers. The N 1-bit bus register should be connected together in any combination of N 1-bit registers. Your module should be parameterized so that the number of 1-bit registers in the bus is parameterized. 7. Make a Verilog module that generates a bus of N 1-bit registers, an N 1-bit bus register of 2N 1-bit registers, and an N 1-bit bus register of 4N 1-bit registers. Your module should be parameterized so that the number of 1-bit registers in the bus is parameterized. ## 8.2.7 Solutions 1. Use the `inside` statement to check if the array index is inside a static array with a constant index. ### Source Code: module N_1_bit_Static_Array_Check (io_output_a, io_input_a, io_input_en); output [1: 0] io_output_a; input [1: 0] io_input_a; input io_input_en; reg [1: 0] io_output_a; reg [1: 0] io_input_a; reg [1: 0] io_input_en; always @ (*) begin if (io_input_en) begin$rose = io_input_a; if (inside(io_input_a, {1'b