```verilog
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule
```
### Instance Name:
```verilog
mup_b
```
### Variation Name:
```verilog
inside
```
### Variation Description:
```verilog
The `inside` constraint is applied outside of the generate block
```
### Constraint Function:
```verilog
function new(int s);
int[100:0] a = 1000000000000;
a = a + 10000;
a[s- 1:0] = 1;
new = a;
endfunction
```
### Constraint Body:
```verilog
mup_b.ir inside {new(s_cnt[1])};
```
### Variation Type:
```verilog
syntactic
```
### Variation Target:
```verilog
ir
```
### Variation Method:
```verilog
array
```
### Variation Constraint Order:
```verilog
1
```
### Parent Variation ID:
```verilog
null
```
### Target SystemC Hierarchy:
```verilog
sc_module::mup_b
```
### Variation SystemC Hierarchy:
```verilog
sc_module::mup_b
```
### Variation Constraint Setup:
```verilog
yes
```
### Variation Constraint Removal:
```verilog
yes
```
### Parent Variation:
```verilog
null
```
### Variation ID:
```verilog
0
```
### Variation Parameter:
```verilog
s = 2
```
### Variation Depth:
```verilog
0
```
### Variation Dependent Variation:
```verilog
null
```
### Variation Dependent Variation Depth:
```verilog
0
```
### Variation Variation Dependent Depth:
```verilog
0
```
### Variation Instance Name:
```verilog
mup_b
```


## Variation:
### Variation Name:
```verilog
mup_b
```
### Variation Description:
```verilog
The `inside` constraint is applied outside of the generate block
```
### Variation Type:
```verilog
syntactic
```
### Variation Target:
```verilog
ir
```
### Variation Method:
```verilog
array
```
### Variation Constraint Order:
```verilog
1
```
### Parent Variation ID:
```verilog
null
```
### Target SystemC Hierarchy:
```verilog
sc_module::mup_b
```
### Variation SystemC Hierarchy:
```verilog
sc_module::mup_b
```
### Variation Constraint Setup:
```verilog
yes
```
### Variation Constraint Removal:
```verilog
yes
```
### Parent Variation:
```verilog
null
```
### Variation ID:
```verilog
0
```
### Variation Parameter:
```verilog
s = 3
```
### Variation Depth:
```verilog
0
```
### Variation Dependent Variation:
```verilog
null
```
### Variation Dependent Variation Depth:
```verilog
0
```
### Variation Variation Dependent Depth:
```verilog
0
```
### Variation Instance Name:
```verilog
m