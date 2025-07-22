```
module ra(s,c,a,b);
  input a[3:0],b[3:0]; output [3:0] s,c;
  ha_packed #(3) #(1) (s,a,b);
endmodule
```
### New Test Case:
New test case has to be generated with random inputs for the packed structure and then the values for the individual members of the structure have to be extracted from the packed structure.

---
## Pack and Unpack:
Create a new Verilog module ha_packed that has a parameter called depth, which is the number of bits in the packed array. Implement a packing instruction that takes an array of 2 depth bits and packs them into an array of depth+1 bits, and an unpacking instruction that takes in an array of depth+1 bits and unpacks them into two depth-bit arrays.

```
module ha_packed(s,a,b);
  unpacked #(1) (s,a);
endmodule
```

---
## Pack and Unpack Verilog Code:
```
module ha_packed(s,a,b);
  unpacked_packed #(1) (s,a,b);
endmodule
```

---
## Pack and Unpack Assembly Code:
```
	sub	r2,r2,r2
	j	label
	label:	add	r1,r1,r1
	mul	r2,r2
	and	r1,r1,r2
```

---
## Pack and Unpack Test Case:
New test case has to be generated with random inputs for the packed structure and then the values for the individual members of the structure have to be extracted from the packed structure.

---
## Verilog Code:
```
module ha_packed(s,c,a,b);
  input a[3:0],b[3:0]; output [3:0] s,c;
  ha #(1,4) (s[1],s[0],a[1],b[1]);
  ha #(1,4) (c[1],a[0],b[0]);
  ha #(1,4) (s[0],c[0],a[0],b[0]);
endmodule
```

---
## Assembly Code:
```
	and 	r3,r1,r1
	mov	r2,r1
	or		r1,r2,r3
	mov	r2,r1
	or		r1,r2,r3
	mov	r2,r1
	or		r1,r2,r3
```

---
## Verilog Code:
```
module ha_packed(s,a,b);
  unpacked #(1) (s,a,b);
endmodule
```

---
## Assembly Code:
```
	and	r1,r1,r1
	or	r1,r1,r1
	mov	r1,r1
	or	r1,r1,r1
	mov	r1,r1
	or	r1,r1,r1
```

---
## Verilog Code:
```
module and(s,a,b);
  input a,b; output s;
  a_gate #(1) s(a,b);
endmodule
```

---
## Assembly Code:
```
	and	r1,r1,r1
```

---
## Verilog Code:
```
module or(s,a,b);
  input a,b; output s;
  b_gate #(1) s(a,b);
endmodule
```

---
## Assembly Code:
```
	or	r1,r1,r1
```

---
## Verilog Code:
```
module xor(s,a,b);
  input a,b; output s;
  c_gate #(2) s(a,b);
endmodule
```

---
## Assembly Code:
```
	xor	r1,r1,r1
```

---
## Verilog Code:
```
module not(s,a);
  input a; output s;
  not_gate #(4) s(a);
endmodule
```

---
## Assembly Code:
```
	not	r1,r1
```

---
## Verilog Code:
```
module adder(s,c,a,b);
  input a,b; output s,c;
  s_gate #(1) c(s,a,b);
endmodule
```

---
## Assembly Code:
```
	add	r1,r1,r1
```

---
## Verilog Code:
```
module carry(s,c,a,b);
  input a,b; output s,c;
  c_gate #(1) s(a,b,c);
endmodule
```

---
## Assembly Code:
```
	mov	r1,r1
```

---
## Verilog Code:
```
module or_gate(s,i,o);
  input i; output s;
  or_or(s,i,o);
endmodule
```

---
## Assembly Code:
```
	or	r1,r1,r1
```

---
## Verilog Code:
```
module or_or(s,a,b);
  input a,b; output s;
  or_or_or(s,a,b);
endmodule
```

---
## Assembly Code:
```
	or	r1,r1,r1
```

---
## Verilog Code:
```
module not_gate(s,i);
  input i; output s;
  and_not(s,i);
endmodule
```

---
## Assembly Code:
```
	and	r1,r1,r1
```

---
## Verilog Code:
```
module and_not(s,i);
  input i; output s;
  and_not_and(s,i);
endmodule
```

---
## Assembly Code:
```
	not	r1,r1
```

---
## Verilog Code:
```
module and_not_and(s,a);
  input a; output s;
  not_and(s,a);
endmodule
```

---
## Assembly Code:
```
	and	r1,r1,r1
```

---
## Verilog Code:
```
module not_and(s,a);
  input a; output s;
  and_not_not(s,a);
endmodule
```

---
## Assembly Code:
```
	not	r1,r1
```

---
## Verilog Code:
```
module and_not_not(s,a);
  input a; output s;
  not_not(s,a);
endmodule
```