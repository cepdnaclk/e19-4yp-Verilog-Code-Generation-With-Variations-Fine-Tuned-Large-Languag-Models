`module mux2x1 (input [1:0] sel, input [7:0] in0, output reg [7:0] out);
always_comb begin:
    out = sel? in0 : 7'b0;
end
endmodule
### Result:
![Base Verilog Code](https://user-images.githubusercontent.com/61718956/114468470-b3124d00-9c0d-11eb-9766-58f09d175303.png)

![Modified Verilog Code](https://user-images.githubusercontent.com/61718956/114468486-b4de1080-9c0d-11eb-8434-c643044f8dd3.png)

![Result](https://user-images.githubusercontent.com/61718956/114468503-b7406a80-9c0d-11eb-887b-6c19f0c6c54b.png)

### Observation:
Since the output is a register, so the out in the always_comb block is a wire and the input is in the always_comb block.
/Lab1/README.md
# Lab1
# Lab1: Bitwise Operators.

## Task 1:

![Task 1](https://user-images.githubusercontent.com/61718956/114357158-f52f1f00-9b79-11eb-9fe2-0be72031a164.png)

### Observation:

This is a logical operator. In this task, an AND-gate and an OR-gate are used as and-gate and or-gate respectively. So a logical operator is the most suitable for these two gates.  

![OR-gate](https://user-images.githubusercontent.com/61718956/114357247-23146380-9b7a-11eb-88f9-37d8b1e9d0d3.jpg)
![AND-gate](https://user-images.githubusercontent.com/61718956/114357241-20197300-9b7a-11eb-86cc-ee208948ae45.jpg)

## Task 2:

![Task 2](https://user-images.githubusercontent.com/61718956/114357312-46d7aa00-9b7a-11eb-8636-21770d669117.png)

### Observation:

This is a bitwise operator. In this task, an XOR-gate is used as the bitwise operator. So a bitwise operator is suitable for this gate.  
![XOR-gate](https://user-images.githubusercontent.com/61718956/114357550-9b8b2400-9b7a-11eb-9672-5147521424ed.jpg)

## Task 3:

![Task 3](https://user-images.githubusercontent.com/61718956/114357585-ad055d80-9b7a-11eb-85cb-9e4368288295.png)

### Observation:

This is a bitwise operator. In this task, a NOT-gate is used as the bitwise operator. So a bitwise operator is suitable for this gate.  
![NOT-gate](https://user-images.githubusercontent.com/61718956/114357596-b1317b00-9b7a-11eb-9005-a51d079290d6.jpg)

## Task 4:

![Task 4](https://user-images.githubusercontent.com/61718956/114357653-c7d7d200-9b7a-11eb-963d-98006f695346.png)

### Observation:

This is a bitwise operator. In this task, a NAND-gate is used as the bitwise operator. So a bitwise operator is suitable for this gate.  
![NAND-gate](https://user-images.githubusercontent.com/61718956/114357722-eb9b1800-9b7a-11eb-8e70-d76ff9e513dc.jpg)

## Task 5:

![Task 5](https://user-images.githubusercontent.com/61718956/114357772-066d8c80-9b7b-11eb-816a-7434b1031307.png)

### Observation:

This is a bitwise operator. In this task, a NOR-gate is used as the bitwise operator. So a bitwise operator is suitable for this gate.  
![NOR-gate](https://user-images.githubusercontent.com/61718956/114357779-0b324080-9b7