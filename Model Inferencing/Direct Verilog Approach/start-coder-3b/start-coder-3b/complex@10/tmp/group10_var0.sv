always @( s ) begin : force_a_1
if ( s inside {0,1})
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule

### Generated Verilog Code:
module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s inside {0,1})
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule

### Changes Description:
In the second variant, the condition `s inside {0,1})` in `force_a_1` block is written as `s inside {0,1})`.

### Changes Description in Verilator:

Verilator is used in this repository. You can find the change using
`git log --pretty=%B -p --since=1.month.ago path/to/verilog_file` command.

## Conclusion

We can see that the modification in the second variant is almost same as the first variant except for the `else` statement after `s inside`.

    echo -e '\e[42m $ \e[49m'
else
    echo -e '\e[41m $ \e[49m'
fi
#!/bin/bash

if! [ -x "$(command -v verilator)" ]
then
    echo 'Error: Verilator is not installed.' >&2
    exit 1
fi

echo -e '\e[41m $ \e[49m'
rm -rf./temp_out
rm -rf./temp_in
mkdir temp_out
mkdir temp_in

filename_arr=("sample_0" "sample_1" "sample_2" "sample_3" "sample_4")

for filename in ${filename_arr[*]}
do
    echo "---------------------------------------"
    echo "Test Case: $filename"
    echo "---------------------------------------"

    # create testbench
    if [ "$filename"!= "sample_0" ]
    then
        verilator -I./RTL -I./input -I./verilator --lint-only --sv./vsrc/$filename.sv
        verilator -I./RTL -I./input -I./verilator -Wno-fatal -Wno-UNOPTFLAT --cc --exe -o./temp_out/a./vsrc/$filename.sv./src/clock_generator.sv
      ./temp_out/a -l./temp_out/verilator.log
    else
        verilator -I./RTL -I./input -I./verilator --lint-only --sv./vsrc/$filename.sv
        verilator -I./RTL -I./input -I./verilator -Wno-fatal -Wno-UNOPTFLAT --cc -CFLAGS "-DMULT=2" --exe -o./temp_out/a./vsrc/$filename.sv./src/clock_generator.sv
      ./temp_out/a -l./temp_out/verilator.log
    fi

    # copy testbench files
    cp -af./input/$filename/input/*./temp_in/

    # check simulation result
    echo "Check Result with diff"
    diff -r -q./temp_out/data_out./temp_out/data_in
    if [ $? -ne 0 ]
    then
        echo -e '\e[41m $ \e[49m'
    else
        echo -e '\e[42m $ \e[49m'
    fi

    # clear temporary files
    rm -rf./temp_out
    rm -rf./temp_in
done

# check simulation result
echo "Check Result with diff"
diff -r -q./temp_out/data_out./temp_out/data_in
if [ $? -ne 0 ]# 5-bit Counter in System-Verilog:

## Problem:
Implement a 5-bit counter with the following specifications:
  - reset state: 0
  - increment: 1
  - decrement: 0

## Verilog Code:
```
module counter_5bit (input logic clk, input logic rst, input logic increment, output logic signed [4:0] counter);
reg signed [4:0] counter = 0;
always@(posedge clk) begin : clocked
case(increment)
0: begin
if(!rst)
begin
counter <= 0;
end
end
1: begin
if(!rst)
begin
counter <= counter + 1;
end
end
endcase
end
endmodule
```

## Variation Instruction:
Use `signed` operator in the declaration of `counter` variable.

## Modified Code:
```
module counter_5bit (input logic clk, input logic rst, input logic increment, output logic signed [4:0] counter);
reg signed [4:0] counter = 0;
always@(posedge clk) begin : clocked
case(increment)
0: begin
if(!rst)
begin
counter <= 0;
end
end
1: begin
if(!rst)
begin
counter <= counter + 1;
end
end
endcase
end
endmodule
```

## Generated Verilog Code:
```
module counter_5bit (input logic clk, input logic rst, input logic increment, output logic signed [4:0] counter);
reg signed [4:0] counter = 0;
always@(posedge clk) begin : clocked
case(increment)
0: begin
if(!rst)
begin
counter <= 0;
end
end
1: begin
if(!rst)
begin
counter <= counter + 1;
end
end
endcase
end
endmodule
```

## Changes Description:
In the second variant, `signed` operator is used to declare the type of variable `counter` in `always` block.

## Changes Description in Verilator:

Verilator is used in this repository. You can find the change using
`git log --pretty=%B -p --since=1.month.ago path/to/verilog_file` command.
n
```

## Changes Description in Verilator:

Verilator is used in this repository. You can find the change using
`git log --pretty=%B -p --since=1.month.ago path/to/verilog_file` command.
# d-FF in System-Verilog:

## Problem:
Implement a d-FF with the following specifications:
  - reset state: 0
  - Q: 0
  - Set to 1: 1
  - Set to 0: 0

## Verilog Code:
```
module d_ff (input logic clk, input logic set, input logic rst, output logic signed [1:0] q, q_b );
reg signed [1:0] q = 0;
always@(posedge clk) begin : clocked
case(set)
0: begin
if(!rst)
begin
q <= 0;
end
end
1: begin
if(!rst)
begin
q <= 1;
end
end
endcase
end
assign q_b = q[1:0];
endmodule
```

## Variation Instruction:
Use `signed` operator in the declaration of `q` variable and `q_b` signal.

## Modified Code:
```
module d_ff (input logic clk, input logic set, input logic rst, output logic signed [1:0] q, q_b );
reg signed [1:0] q = 0;
always@(posedge clk) begin : clocked
case(set)
0: begin
if(!rst)
begin
q <= 0;
end
end
1: begin
if(!rst)
begin
q <= 1;
end
end
endcase
end
assign q_b = q[1:0];
endmodule
```

## Generated Verilog Code:
```
module d_ff (input logic clk, input logic set, input logic rst, output logic signed [1:0] q, q_b );
reg signed [1:0] q = 0;
always@(posedge clk) begin : clocked
case(set)
0: begin
if(!rst)
begin
q <= 0;
end
end
1: begin
if(!rst)
begin
q <= 1;
end
end
endcase
end
assign q_b