module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~(a1 || b1);
endmodule // Mixed structural/behavioral AOI
endmodule

## Elaboration

Elaborating this design results in the following code:

``````module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~(a1 || b1);
endmodule

// Outputs of AND gates
always @(a or b)
a1 = a[1];
b1 = b[1];
endmodule``````

This design can be verified as follows:

`verilator -Wno-lint --top-module aoibeh2 -M aoibeh2.v aoibeh2_tb.v aoibeh2.cpp`


Elaboration

```module aoibeh2(o,a,b); // Mixed structural/behavioral AOI output o; input[1:0]a,b; wire a1,b1; // Outputs of AND gates reg o; // Behavioral output must be reg // Structural AND gates using primitives and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]); // Behavioral NOR logic sensitive to AND outputs always@(a1 or b1) o = ~(a1 || b1); endmodule // Outputs of AND gates always @(a or b) a1 = a[1]; b1 = b[1]; endmodule Elaboration Verilator 4.100 -Wno-lint --top-module aoibeh2 -M aoibeh2.v aoibeh2_tb.v aoibeh2.cpp Elaborated module AOI Behavioral AOI Beh_AOI aoibeh() aoibeh() aoibeh2(o,a,b); // Mixed structural/behavioral AOI output o; input[1:0]a,b; wire a1,b1; // Outputs of AND gates reg o; // Behavioral output must be reg // Structural AND gates using primitives and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]); // Behavioral NOR logic sensitive to AND outputs always@(a1 or b1) o = ~(a1 || b1); endmodule // Outputs of AND gates always @(a or b) a1 = a[1]; b1 = b[1]; endmodule AOI Beh_AOI ```

## Simulation

Simulation can be done as follows:

`./sim_aoibeh2`


Simulation

```#1 @ 9.500ns a = 0001, b = 0001, o = 0001 a = 0000, b = 0000, o = 1001 a = 0001, b = 0000, o = 1001 a = 0000, b = 0001, o = 1001 a = 0001, b = 0001, o = 1001.E10 @ 9.500ns a = 0001, b = 0001, o = 0001 a = 0000, b = 0000, o = 1000 a = 0001, b = 0000, o = 1000 a = 0000, b = 0001, o = 1000 a = 0001, b = 0001, o = 1000.E10 @ 19.000ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b = 0001, o = 0001 a = 0001, b = 0001, o = 0000.E10 @ 28.500ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b = 0001, o = 0001 a = 0001, b = 0001, o = 0000.E10 @ 38.000ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b = 0001, o = 0001 a = 0001, b = 0001, o = 0000 #2 @ 47.500ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b = 0001, o = 0001 a = 0001, b = 0001, o = 0000.E10 @ 57.000ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b = 0001, o = 0001 a = 0001, b = 0001, o = 0000.E10 @ 66.500ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b = 0001, o = 0001 a = 0001, b = 0001, o = 0000.E10 @ 76.000ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b = 0001, o = 0001 a = 0001, b = 0001, o = 0000 #3 @ 85.500ns a = 0001, b = 0001, o = 0000 a = 0000, b = 0000, o = 0001 a = 0001, b = 0000, o = 0001 a = 0000, b =