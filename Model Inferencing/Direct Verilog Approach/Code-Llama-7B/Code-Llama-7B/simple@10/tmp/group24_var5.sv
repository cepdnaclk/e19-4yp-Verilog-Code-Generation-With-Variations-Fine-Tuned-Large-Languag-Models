module Anding (input a, b, output y);
and (y, a, b);
endmodule

### Assumptions:
None
### Test Cases:
Test Case 1:
### Pass/Fail Criteria:
Pass:
- There are no errors in the log file.
- There is no unexpected behavior when the code is simulated.
### Instructions to Build, Execute and Test the Module
##### Step 1:
```
cd verilog-module-template-anding
```
##### Step 2:
Create a new file called `anding.v` in the verilog folder.
##### Step 3:
Copy the below design code into the `anding.v` design file.
```verilog
module Anding (input a, b, output y);
and (y, a, b);
endmodule
```
##### Step 4:
Add the following code inside the `testbench.v` file.
```verilog
module testbench;

logic [7:0] a = 0;
logic [7:0] b = 0;
logic [7:0] y = 0;

logic [8:0] a_arr = 0;
logic [8:0] b_arr = 0;
logic [8:0] y_arr = 0;

localparam DATA_WIDTH = 8;
localparam NUM_OF_DATA = 2;

Anding #(.DATA_WIDTH(DATA_WIDTH),.NUM_OF_DATA(NUM_OF_DATA)) UUT (
   .a(a_arr),
   .b(b_arr),
   .y(y_arr)
);

initial begin
    a_arr = 8'hA;
    b_arr = 8'hB;
    repeat (10) begin
        #10;
        a = a + 1;
        b = b + 1;
    end
end

initial begin
    $display("a = %d", a);
    $display("b = %d", b);
    $display("y = %d", y);
    $display("a_arr = %