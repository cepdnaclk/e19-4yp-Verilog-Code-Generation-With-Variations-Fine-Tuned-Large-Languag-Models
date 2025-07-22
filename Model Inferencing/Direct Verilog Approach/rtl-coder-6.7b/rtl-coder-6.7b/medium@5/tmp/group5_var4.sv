module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
logic [0:2][0:1] state_logic;
logic [0:2][0:1] reset_logic;
logic [0:2][0:1] preset_logic;
logic [0:2][0:1] clock_logic;
logic [0:2][0:1] j_logic;
logic [0:2][0:1] k_logic;

always @(posedge clock) begin
if (reset) begin
state_logic[2][1] = 1'b1;
end
else begin
state_logic[2][1] = 1'b1;
state_logic[0][1] = 1'b1;
end
end

always @(posedge clock) begin
reset_logic[2][1] = preset;
reset_logic[2][0] = preset;
end

always @(posedge clock) begin
clock_logic[2][0] = preset;
clock_logic[0][0] = preset;
clock_logic[1][0] = preset;
clock_logic[2][1] = preset;
clock_logic[1][1] = preset;
clock_logic[0][1] = preset;
clock_logic[2][2] = preset;
clock_logic[1][2] = preset;
clock_logic[2][2] = preset;
end

always @(posedge clock) begin
j_logic[0][0] = preset;
j_logic[1][0] = preset;
j_logic[2][0] = preset;
k_logic[0][0] = preset;
k_logic[0][1] = preset;
k_logic[0][2] = preset;
end

initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule

I get the following error message:

[ERROR]: Failed to check the code for errors.


Do you know why I get this "Failed to check the code for errors" error??

• If it is a problem with the code, then it is not a question. You are going to need to provide us with the code. – scary_cat Dec 11 '18 at 2:10
• I assume you are using the simulator, and you did not give us the error message you got? – user8352 Dec 11 '18 at 2:11
• As scary_cat noted, we need the Verilog to be able to run to see what's going on. – user8352 Dec 11 '18 at 2:12
• I did not get an error message. – User12593738 Dec 11 '18 at 2:53
• I've added a procedural assignment to your code. I've also added a new module to test MDA behavior. – user8352 Dec 11 '18 at 3:12

Here's the error message that I get when I try to compile your code (with an array index outside of the range of the array):

[E-1005] test.v:12:18: Error: Array index (1) is out of bounds (0 to 2): 1


This would be expected since you are using an array of 3x2 (2D) logic values. If you want to use a 2D array, then you will need to declare that.

Here is the code to declare a 2D array:

logic [0:2][0:1] foo;


The logic is basically saying: Create an array of 2*3*1 logic values. You then need to index into the array to set and/or get the value.

Let's say foo[0][2] = 1;

foo[0][2] is the same as foo[0][0][2]

You can also declare the array as:

logic [0:2][0:1] foo[3][2];


That would set the array to have 3 rows and 2 columns.

Let's say foo[0][1] = 1;

foo[0][1] is the same as foo[0][0][1]

foo[0][2] is the same as foo[0][0][2]

In both cases, foo[0][1] and foo[0][2] are the same as foo[0][0][1] and foo[0][0][2].

You can also use a 3D array, like so:

logic [0:2][0:1][0:1] foo;


In this case, foo[0][0][1] will be the same as foo[0][0][0][1].

In all three cases, the first logic index is the row, the second is the col, and the third is the sub-col.

Therefore, if you want to set foo[0][1][0] to 1, you would write:

foo[0][1][0] = 1;


If you want to get the value back, you would write:

logic foo_val = foo[0][1][0];


If you want to use a 2D array, you will need to declare your variables outside of the module and then use them inside of the module to set and/or get values.