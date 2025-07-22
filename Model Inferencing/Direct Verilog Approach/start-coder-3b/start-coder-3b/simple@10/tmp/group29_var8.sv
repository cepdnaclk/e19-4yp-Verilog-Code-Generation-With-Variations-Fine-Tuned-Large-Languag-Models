module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Expected Output:
module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Actual Output:
module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Expected Behavior:
Associative Access to an associative array
### Actual Behavior:
Associative Access to an associative array
### Command Line Options Used:
-p1768
### Operating System (OS):
Windows 10
### Version of VHDL Compiler:
VHDL Compiler Version 12.2.0
### VHDL Input File Used:
SchedDelayA.vhd
### Steps to Reproduce the Issue:
#### 1. Place SchedDelayA.vhd file in the working directory
#### 2. Open VHDL Compiler and click File -> Open
#### 3. Go to the working directory and select the SchedDelayA.vhd file
#### 4. Click Compile