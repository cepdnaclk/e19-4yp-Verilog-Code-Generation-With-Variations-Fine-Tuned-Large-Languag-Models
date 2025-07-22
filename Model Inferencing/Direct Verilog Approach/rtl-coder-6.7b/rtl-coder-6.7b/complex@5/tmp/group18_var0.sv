module dff_aa(q,qb,di,clk,clr,pr); // Behavioral DFF with async controls and conditional path delay
	  output q,qb; input di,clk,clr,pr;
	  reg [1:0] X;
	  reg [2:1] Y;
	  assign q = X[1];
	  assign qb=~q;
	  specify
	    // Conditional path delay: clk->q edge-sensitive path active only if clr and pr are low
	    if (!clr &&!pr) (posedge clk *> (q:di)) = 1;
	  endspecify
	  // Behavioral description with async reset/preset priority
	  always @(posedge clk or posedge clr or posedge pr) // Added async sensitivity
	    if(clr) X <= 1'b0; // Use non-blocking <=
	    else if(pr) X <= 1'b1;
	    else X <= di;
      // Check if X[1] is in the array Y
      property check_slice;
        @(posedge clk) (X[1] inside {Y});
      endproperty
      a:assert property (check_slice);
	endmodule
Note: the assertion property name must be the same as the property itself.
## $setup and $hold:
**Simulation Variables**

`$setuphold`, `$setup`, `$hold`, `$past`:
|   |   |   |
|---|---|---|
|`$setuphold`|`$setup`|`$hold`|
|`$past`|

`$past` is used to specify the name of the signal to be checked.


## Modports:

>*Example code*

	interface modport #name;
		// Declarations
	endinterface

	interface interface_name
	endinterface

	module modport_name (interface_name);
		// Module body
	endmodule

	module modport_example (interface_name modport_name);
		// Module body
	endmodule

	interface interface_name_modport;
		// Declarations
	endinterface: interface_name_modport

	module modport_example2 (interface_name_modport);
		// Module body
	endmodule

**Using a module with a modport**

	module #(parameter_name, value) module_name
		(output_ports,
		modport_name input_ports );
		// Module body
	endmodule

	module modport_example3 #(int value)
		(modport_interface_name modport_name);
		// Module body
	endmodule

## Formal Specifications:

Formal Specification (FS) is a tool for verifying that a design contains no errors.

Formal Specification (FS) is a tool to verify the correctness of hardware design. FS is mainly used in digital verification to check whether a design is correct or not. For example, FS can be used in verification of a design to ensure that the design is free of any unknown, undesirable, unverifiable or untestable behavior.

### Formal Specification (FS)

FS is a tool that can be used to verify the correctness of a digital circuit or system by checking whether the behavior of the system or the system’s components is correct. FS can be used to verify the behavior of a hardware design or a software design. FS can be used to verify the behavior of a circuit or system by checking whether the system or the system’s component generates the correct output for a given input or not. FS can also be used to verify the absence of any errors in a circuit or system, such as bugs or faults. FS can also be used to verify the correctness of a system by checking whether the system generates the correct output for a given input or not. FS can be used to verify the correctness of a circuit or system by checking whether the system or the system’s components behave correctly or not. FS can be used to verify the correctness of a circuit or system by checking whether the system or the system’s components generate the correct output for a given input or not. FS can be used to verify the correctness of a circuit or system by checking whether the system or the system’s components generate the correct output for a given input or not. FS can be used to verify the correctness of a circuit or system by checking whether the system or the system’s components generate the correct output for a given input or not.


#### What is Formal Specification?

Formal Specification (FS) is a tool used in digital circuit design verification to ensure that the design is free of any unknown, undesirable, unverifiable or untestable behavior. FS is also used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking whether the system or the system’s components generate the correct output for a given input or not. FS is used to check the behavior of a system or a circuit by checking