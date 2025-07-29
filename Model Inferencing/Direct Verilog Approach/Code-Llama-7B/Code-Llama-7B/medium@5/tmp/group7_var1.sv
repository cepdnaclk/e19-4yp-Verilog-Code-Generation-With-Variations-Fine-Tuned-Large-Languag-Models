module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
initial
	if (i1!= i2 && (i1!= 0 || i2!= 0)) 
		$display("ERROR: i1: %b i2: %b both non-zero", i1, i2);
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
### Simulation Logic:
```
# i1 i2 o
#  0  0 1
#  0  1 1
#  1  0 1
#  1  1 1
```
### Resulting VCD File:
```
#0
i1  0
i2  0
o  1
#1
i1  0
i2  1
o  0
#2
i1  1
i2  0
o  0
#3
i1  1
i2  1
o  1
#1000000
$end
```
### Explanations:
The simulation logic for the initial block as shown below and the VCD file output are given above.
```
#0
initial
	if (i1!= i2 && (i1!= 0 || i2!= 0)) 
		$display("ERROR: i1: %b i2: %b both non-zero", i1, i2);
#1
initial
	if (i1!= i2 && (i1!= 0 || i2!= 0)) 
		$display("ERROR: i1: %b i2: %b both non-zero", i1, i2);
#2
initial
	if (i1!= i2 && (i1!= 0 || i2!= 0)) 
		$display("ERROR: i1: %b i2: %b both non-zero", i1, i2);
#3
initial
	if (i1!= i2 && (i1!= 0 || i2!= 0)) 
		$display("ERROR: i1: %b i2: %b both