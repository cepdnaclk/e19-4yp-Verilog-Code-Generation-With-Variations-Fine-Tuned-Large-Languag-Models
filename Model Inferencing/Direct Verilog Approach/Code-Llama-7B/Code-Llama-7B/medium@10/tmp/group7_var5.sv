module contres_m(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1, weak0); // Drives pull '1', weak '0'
//buf(pull1, weak0) g2(o,i2, weak0); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
if(i1==1)
    o=1;
else
    o=0;
if(i2==1)
    o=1;
else
    o=0;
endmodule
### Simulation Log:
	> iverilog -o contres_m.vvp contres_m.v
	> vvp contres_m.vvp
	i1 = 0, i2 = 0: 0 0
	i1 = 0, i2 = 1: 0 1
	i1 = 1, i2 = 0: 1 0
	i1 = 1, i2 = 1: 1 1
### Base Verilog Code:
module contres_m(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1, weak0); // Drives pull '1', weak '0'
//buf(pull1, weak0) g2(o,i2, weak0); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1;