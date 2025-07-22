module SchedDelayA_v2;
class classA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endclass
endmodule
class classA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endclass
### Expected Output:
Error: scheddelaya_v2.sv:15: object "a" is a reg, not a class (classA)
Error: scheddelaya_v2.sv:20: object "b" is a wire, not a class (classA)
Error: scheddelaya_v2.sv:25: object "a" is a reg, not a class (classA)
Error: scheddelaya_v2.sv:30: object "b" is a wire, not a class (classA)

#### 1 comment:

1. Hello Guys,

I am new to verilog, but am trying to find a way to implement associative array in verilog. I am not able to understand how can i define the key and the value in the associative array. I have tried this below example which is in.sv file.

module assoc_array_test;
reg data;
initial $dumpfile("assoc_array_test.vcd"); initial$dumpvars(0,assoc_array_test);

assoc_array_test(data);

initial begin
data = 1;
end

endmodule

module assoc_array_test #(parameter type = type1) (input data, output data);

initial $dumpfile("assoc_array_test.vcd"); initial$dumpvars(0,assoc_array_test);

// Create an associative array with 1001 entries

int {type} arr_1001[25] [15];

// Fill all the entries with zero to start

integer i;
integer j;

for (i = 0; i < 25; i = i + 1)
for (j = 0; j < 15; j = j + 1)
arr_1001[i][j] = 0;

// Create an entry named "a"

arr_1001["a" ] = 1;

// Create an entry named "b"

arr_1001["b" ] = 2;

// Create an entry named "c"

arr_1001["c" ] = 3;

// Create an entry named "d"

arr_1001["d" ] = 4;

// Accessing the entries through the entries

$display("arr_1001[a ] = %d", arr_1001["a" ]);$display("arr_1001[b ] = %d", arr_1001["b" ]);

$display("arr_1001[c ] = %d", arr_1001["c" ]);$display("arr_1001[d ] = %d", arr_1001["d" ]);

initial begin
data = arr_1001[a][] ;
end

endmodule

The error i am getting is :
Error: assoc_array_test.v:30:12: object arr_1001[a][] is not available
and i am not able to find the reference for this object.

Please help.

Thanks