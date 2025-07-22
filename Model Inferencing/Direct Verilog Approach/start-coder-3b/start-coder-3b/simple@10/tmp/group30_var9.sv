module netdelay5(x[31:0],y[31:0]);
input x[31:0];
output y[31:0];
packed
wire #(2,1) nn(x); // Declare packed two inputs and outputs
wire #(2,1) ny(y);
assign y=nn;
packed
endmodule
### Verilator Output:
netdelay5.cpp: In function 'int test_bench_netdelay5()':
netdelay5.cpp:12:5: error: expected ';' before 'packed'
netdelay5.cpp:12:5: error: expected '}' before 'packed'

## Module: netdelay6
### Base Verilog Code:
module netdelay6(x,y);
input x;
output y;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not #(2,1) nn(x); // Assign NOT(x) to '