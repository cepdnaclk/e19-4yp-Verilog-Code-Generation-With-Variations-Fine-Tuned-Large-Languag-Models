module nor2NMOS(in1, in2, b); // 2-input NMOS NOR
  output b;
  input in1,in2;
  supply0 a; // Ground
  wire b; // Output wire (should be just output b;)
  // Parallel NMOS transistors connect output to ground
  nmos (b, a, in1);
  nmos (b, a, in2);
  pullup (b); // Pullup device on the output
  nor2NMOS(in1, in2, b);

endmodule

### Circuit Simulation Results:

#### Nor3NMOS
![alt text](nor3NMOSVariation.png)
#### Nor2NMOS
![alt text](nor2NMOSVariation.png)

### Conclusion:
The two NOR gates simulate to the same circuit. The nor3NMOS circuit produces a more complex circuit due to the added pullup device. The nor2NMOS circuit produces a very simple circuit.

## Problem 2.9:
## Verilog Code:
module nor2NMOS(in1,in2,b); // 2-input NMOS NOR
  output b;
  input in1,in2;
  supply0 a; // Ground
  wire b; // Output wire (should be just output b;)
  // Parallel NMOS transistors connect output to ground
  nmos (b, a, in1);
  nmos (b, a, in2);
  pullup (b); // Pullup device on