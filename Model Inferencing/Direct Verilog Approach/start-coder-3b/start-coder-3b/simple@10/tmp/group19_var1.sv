module test_dff(D, Clock, Resetn, Q);
lpm_ff dff_inst(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam dff_inst.lpm_width = 1;

//Create an array of 16 test cases.
integer D_in[128] = {1};
integer  Clock_in[128] = {1};
integer Resetn_in[128] = {0};
integer Q_out[128] = {1};

integer i;
for(i = 0; i < 128; i++){
assign dff_inst.data = D_in[i];
assign dff_inst.aclr = Resetn_in[i];
assign dff_inst.clock = Clock_in[i];
initial begin
#10;
end
#50;
Clock_in[i] <= 0;
D_in[i] = D_in[i] + 1;
end
initial

#32;
end

endmodule

### Output:

Testbench Output:

Test Case 1:

Test Case 2:

Test Case 3:

Test Case 4:

Test Case 5:

Test Case 6:

## Dynamic Array in Verilog Code (Module/Function/Program)

A dynamic array is a variable of type “array of N” in Verilog.

• Arrays hold a sequence of elements of a uniform type.
• These elements are addressed by their index.
• The index is an integer in the interval 0 ≤ index ≤ N−1.
• The elements of an array are always of the same type.
• Arrays are defined with a left-hand and right-hand size.
• The array size must be known at compile time.
A dynamic array can be used to store sequence of elements of a similar type.
The index at which the element stores starts from 0.
Dynamic arrays are defined in the following syntax:
integer array_name[N] = {list_of_elements};
integer array_name[N] = {list_of_elements, list_of_elements,...};
integer array_name[N] = {value,value,value,..., value,value, value};

### Example

dynamic array integer array_1[16] = {0};
dynamic array integer array_2[4] = {1,2,3,4};
dynamic array integer array_3[4] = {10,20,30,40};

## Dynamic Array in Verilog Code (Module/Function/Program)

Arrays can also be used to store the sequence of values obtained from another array.
dynamic array integer array_1[16] = {0};
integer i;
for(i=0; i<16; i++){
array_1[i] <= 2*i;
end

## Dynamic Array in Verilog Code (Module/Function/Program)

### Example

Dynamic array is used to store sequence of values obtained from another array.
dynamic array integer array_1[16] = {0};
dynamic array integer array_2[4] = {1,2,3,4};
integer i;
for(i=0; i<16; i++){
array_1[i] <= array_2[i];
end

## Dynamic Array in Verilog Code (Module/Function/Program)

Dynamic arrays are useful in situations where the size of the array must be determined at run time.

### Example

dynamic array integer array_1[16]; // Dynamic array defined.
integer array_1_size = 7; // Size of the array.
array_1[0] = 1;
array_1[1] = 2;
array_1[2] = 3;
array_1[3] = 4;
array_1[4] = 5;
array_1[5] = 6;
array_1[6] = 7;
integer i;
for(i=0; i<array_1_size; i++){
$display("array_1[%d]=%d", i, array_1[i]); #100; end ## Dynamic Array in Verilog Code (Module/Function/Program) ### Example Dynamic array is declared but not defined. This type of array is known as a parameter array. dynamic array parameter integer array[16] array_1; integer array_1_size = 7; array_1[0] = 1; array_1[1] = 2; array_1[2] = 3; array_1[3] = 4; array_1[4] = 5; array_1[5] = 6; array_1[6] = 7; integer i; for(i=0; i<array_1_size; i++){$display("array_1[%d]=%d", i, array_1[i]);
#100;
end

## Dynamic Array in Verilog Code (Module/Function/Program)

Dynamic array is declared along with the other parameters in the function declaration.

### Example

dynamic array integer array_1[16]; // Dynamic array defined.
integer array_1_size = 7; // Size of the array.
function integer array_add(integer array[16] array_1, integer array_1_size);
integer i;
for(i=0; i<array_1_size; i++){
array_1[i] = array_1[i] + 1;
}
integer array_add(integer array[16] array_1, integer array_1_size){
integer i;
for(i=0; i<array_1_size; i++){
array_1[i] = array_1[i] + 1;
}
}

## Dynamic Array in Verilog Code (Module/Function/Program)

Dynamic array is declared along with the other parameters in the function declaration.

### Example

The following example shows how to modify an element of dynamic array.

function integer array_mod(integer array[16] array_1, integer array_1_size, integer index, integer element);
integer i;
for(i=0; i<array_1_size; i++){
assign array_1[i] = array_1[i] + 1;
}
integer array_mod(integer array[16] array_1, integer array_1_size, integer index, integer element){
integer i;
for(i=0; i<array_1_size; i++){
array_1[i] = array_1[i] + 1;
}
}

## Dynamic Array in Verilog Code (Module/Function/Program)

Dynamic array is declared along with the other parameters in the function declaration.

### Example

The following example shows how to add two dynamic arrays.

function integer array_add(integer array[16] array_1, integer array_1_size, integer index, integer element);
integer i;
for(i=0; i<array_1_size; i++){
assign array_1[i] = array_1[i] + 1;
}
integer array_add(integer array[16] array_1, integer array_1_size, integer index, integer element){
integer i;
for(i=0; i<array_1_size; i++){
array_1[i] = array_1[i] + 1;
}
}

## Dynamic Array in Verilog Code (Module/Function/Program)

Dynamic array is declared along with the other parameters in the function declaration.

### Example

The following example shows how to add two dynamic arrays.

function integer array_add(integer array[16] array_1, integer array_1_size, integer index, integer element);
integer i;
for(i=0; i<array_1_size; i++){
assign array_1[i] = array_1[i] + 1;
}
integer array_add(integer array[16] array_1, integer array_1_size, integer index, integer element){
integer i;
for(i=0; i<array_1_size; i++){
array_1[i] = array_1[i] + 1;
}
}

## Dynamic Array in Verilog Code (Module/Function/Program)

Dynamic array is declared along with the other parameters in the function declaration.

### Example

The following example shows how to multiply all the elements of the dynamic array.

function integer array_mult(integer array[16] array_1, integer array_1_size, integer index, integer element);
integer i;
for(i