module SchedDelayA_handle;
class class_handle;
endclass
class class_handle;
reg a, b;
reg [7:0] index = 0;
integer index_int = 0;
class_handle::class_handle() {
index_int = to_integer(index); }
class_handle::assign() begin
index = to_bits(index_int);
end
class_handle::display() begin
$display("%0d", index_int); end endclass class_handle::operator(+(class_handle A, class_handle B) begin return (class_handle) {$cast(A.index_int + B.index_int)};
end
class_handle::operator(+(integer A, class_handle B) begin
return (class_handle) {$cast(A + B.index_int)}; end class_handle::operator(+(class_handle A, integer B) begin return (class_handle) {$cast(A.index_int + B)};
end
class_handle::operator(*(integer A, integer B) begin
return (class_handle) {$cast(A * B)}; end class_handle::operator(integer A, class_handle B) begin return (class_handle) {$cast(A * B.index_int)};
end
class_handle::operator(class_handle A, integer B) begin
return (class_handle) {$cast(A.index_int * B)}; end endclass class_handle::operator(+(class_handle A, class_handle B) begin return (class_handle) {$cast(A.index_int + B.index_int)};
end
endclass
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Difference:
The following change is observed when the code is synthesized. The top module is not synthesizable when class handle is used in input or output. It is synthesizable only when it is used in the internal of the module.

### Base Verilog Code:
module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Variation Instruction:
Replace one of the inputs with a class handle and use inside operator with associative array to test class-based associative access.
I have tried this using different associative arrays in the class_handle class. I am seeing that the code is valid and generates the correct design, but is not synthesizable. There is no error message in the compile log. I have tried this with different associative arrays in the class_handle class. I am seeing that the code is valid and generates the correct design, but is not synthesizable. There is no error message in the compilation log.

Edit:

I have tried this with different associative arrays in the class_handle class. I am seeing that the code is valid and generates the correct design, but is not synthesizable. There is no error message in the compilation log.

Hi, This is because you cannot use an associative array in the input or output of a class. The code has a bug and it compiles successfully:

module Test;
class class_handle;
endclass
class class_handle;
int a, b;
int [7:0] index = 0;
int index_int = 0;
class_handle::class_handle() {
index_int = to_integer(index); }
class_handle::assign() begin
index = to_bits(index_int);
end
class_handle::display() begin
$display("%0d", index_int); end endclass class_handle::operator(+(class_handle A, class_handle B) begin return (class_handle) {$cast(to_integer(A.index) + B.index_int)};
end
class_handle::operator(+(class_handle A, integer B) begin
return (class_handle) {$cast(A.index_int + B)}; end class_handle::operator(+(integer A, class_handle B) begin return (class_handle) {$cast(A + to_integer(B.index))};
end
class_handle::operator(integer A, integer B) begin
return (class_handle) {$cast(A + B)}; end endclass class_handle::operator(+(class_handle A, class_handle B) begin return (class_handle) {$cast(to_integer(A.index) + B.index_int)};
end
endclass
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule

I have created a new post for it. Please see the link here.

• Hi,
I have tried this using different associative arrays in the class_handle class. I am seeing that the code is valid and generates the correct design, but is not synthesizable. There is no error message in the compilation log.

Hi, What type of error message do you get? Is it still synthesizable, or isn't it synthesizable?

• Hi,
I have tried this using different associative arrays in the class_handle class. I am seeing that the code is valid and generates the correct design, but is not synthesizable. There is no error message in the compilation log.

Hi, What type of error message do you get? Is it still synthesizable, or isn't it synthesizable?

Thanks.
I am not sure how to get the compilation log. I can upload it if you have any idea.
I will create a new post and show what I am seeing.

• Hi,
I am not sure how to get the compilation log. I can upload it if you have any idea.

Hi,

When you run the synthesis, there should be a.log file that you can open. This is the compilation log.

When you have multiple options on the synthesis, you should select the one you are going to use.

I will create a new post and show what I am seeing.

• Hi,
I am not sure how to get the compilation log. I can upload it if you have any idea.

Hi,

When you run the synthesis, there should be a.log file that you can open. This is the compilation log.

When you have multiple options on the synthesis, you should select the one you are going to use.

I will create a new post and show what I am seeing.

• Hi,
I am not sure how to get the compilation log. I can upload it if you have any idea.

Hi,

When you run the synthesis, there should be a.log file that you can open. This is the compilation log.

When you have multiple options on the synthesis, you should select the one you are going to use.

I will create a new post and show what I am seeing.

The following problem is observed when I synthesize the design with the class_handle class.

There is not any error message. I think the code is synthesizable.

It is synthesizable with the code.
Here is the top code and the code in the top module.

module Test;
class class_handle;
endclass
class class_handle;
int a, b;
int [7:0] index = 0;
int index_int = 0;
class_handle::class_handle() {
index_int = to_integer(index); }
class_handle::assign() begin
index = to_bits(index_int);
end
class_handle::display() begin
$display("%0d", index_int); end endclass class_handle::operator(+(class_handle A, class_handle B) begin return (class_handle) {$cast(to_integer(A.index) + B.index_int)};
end
class_handle::operator(+(class_handle A, integer B) begin
return (class_handle) {$cast(A.index_int + B)}; end class_handle::operator(+(integer A, class_handle B) begin return (class_handle) {$cast(A + to_integer(B.index))};
end
class_handle::operator(integer A, integer B) begin
return (class_handle) {$cast(A + B)}; end endclass class_handle::operator(+(class_handle A, class_handle B) begin return (class_handle) {$cast(to_integer(A.index) + B.index_int)};
end
endclass
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule

In the compilation log, the following errors are observed.

ERROR: [Synth 7-9463] Associative array is not supported in this context
ERROR: [Synth 7-9464] Associative array is not supported in this context
ERROR: [Synth 7-9465] Associative array is not supported in this context
ERROR: [Synth 7-94