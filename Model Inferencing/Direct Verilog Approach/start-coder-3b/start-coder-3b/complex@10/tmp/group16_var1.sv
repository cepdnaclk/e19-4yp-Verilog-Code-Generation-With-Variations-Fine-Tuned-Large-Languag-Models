--- a/verilog/tests/TOP1.v
 +++ b/verilog/tests/TOP1.v
 @@ -7,13 +7,12 @@
   output reg [15:0] comparator_out,
   output reg [15:0] comparator_out_negated
   );
-  // TODO: add parameters for inputs
-  parameter [15:0] x, y;
   // TODO: add parameters for the comparator output
   parameter [15:0] comparator_out;
   parameter [15:0] comparator_out_negated;
 
-  // TODO: add parameter for input
   parameter [15:0] comparator_in;
+  // TODO: add parameter for input
 
   initial begin
     comparator_out = 0;
     comparator_out_negated = 0;
@@ -20,23 +19,23 @@
     comparator_out_negated = comparator_in;
   end
 
-  // TODO: add comparator logic
-  // TODO: add an output to the comparison result
+  always @(posedge clk) begin
+    comparator_out <= comparator_in;
+  end
 
-  assign comparator_out = comparator_in;
-  assign comparator_out_negated = comparator_in;
+  assign comparator_out_negated = comparator_out;
 
 endmodule
 
 #### Variation Summary:
 
-This is a simple variation of how a comparator is used inside of a module.
+This is a simple variation of comparing the values `x` and `y`.
 
 In this variation, the comparator module is used as a sub-module.  The
 module is not used in the main testbench directly.
 
 The inputs to the comparator module are `x`, `y`, and `comparator_in`.
-The module is set to be used as a comparator by assigning it directly to
+The module is set to be used as a comparator by assigning the output of the comparator directly to
 the `comparator_out` output.  The use of a function call is avoided by
 directly assigning the `comparator_in` input.
 
@@ -45,13 +44,13 @@
 
 ### Design Goal:
 
-This variation is designed to be used as a reference for when a comparator
-is used inside of a module.  The module in this variation is designed to
-be used as a comparator.  The module is used as a sub-module, but it is
-not used in the main testbench directly.
-
-The inputs to the comparator module are `x`, `y`, and `comparator_in`.
-The module is set to be used as a comparator by assigning it directly to the `comparator_out` output.  The use of a function call is avoided by directly assigning the `comparator_in` input.
+This variation is designed to be used as a reference for when a comparator is
+used inside of a module.  The module in this variation is designed to
+be used as a comparator.  The module is used as a sub-module, but it is
+not used in the main testbench directly.
+
+The inputs to the comparator module are `x`, `y`, and `comparator_in`.
+The module is set to be used as a comparator by assigning the output of the comparator directly to the `comparator_out` output.  The use of a function call is avoided by directly assigning the `comparator_in` input.
 
 ### Variation Logic Description:
 
@@ -59,6 +58,7 @@
 This variation is designed to be used as a reference for when a comparator
 is used inside of a module.  The module in this variation is designed to
 be used as a comparator.  The module is used as a sub-module, but it is
+not used in the main testbench directly.
 not used in the main testbench directly.
 
 The inputs to the comparator module are `x`, `y`, and `comparator_in`.
@@ -81,8 +81,8 @@
 
 ### Design Goal:
 
-This variation is designed to be used as a reference for when a comparator
-is used inside of a module.  The module in this variation is designed to
+This variation is designed to be used as a reference for when a comparator is
+used inside of a module.  The module in this variation is designed to
 be used as a comparator.  The module is used as a sub-module, but it is
 not used in the main testbench directly.
 
 The inputs to the comparator module are `x`, `y`, and `comparator_in`.
@@ -93,8 +93,8 @@
 
 ### Variation Logic Description:
 
-This variation is designed to be used as a reference for when a comparator
+This variation is designed to be used as a reference for when a comparator is
 is used inside of a module.  The module in this variation is designed to
 be used as a comparator.  The module is used as a sub-module, but it is
 not used in the main testbench directly.
 
@@ -106,10 +106,8 @@
 The inputs to the comparator module are `x`, `y`, and `comparator_in`.
 The module is set to be used as a comparator by assigning it directly to
 the `comparator_out` output.  The use of a function call is avoided by
 directly assigning the `comparator_in` input.
-
-The inputs to the comparator module are `x`, `y`, and `comparator_in`.
 
 ### Design Goal:
 
 This variation is designed to be used as a reference for when a comparator
@@ -118,9 +116,9 @@
 module in this variation is designed to be used as a comparator.  The
 module is used as a sub-module, but it is not used in the main testbench
 directly.
 
-The inputs to the comparator module are `x`, `y`, and `comparator_in`.
+The inputs to the comparator module are `x`, `y`, and `comparator_in`.  The module is set to be used as a comparator by assigning it directly to the `comparator_out` output.  The use of a function call is avoided by directly assigning the `comparator_in` input.
 
 ### Variation Logic Description:
 
 This variation is designed to be used as a reference for when a comparator
@@ -128,11 +126,9 @@
 module in this variation is designed to be used as a comparator.  The
 module is used as a sub-module, but it is not used in the main testbench
 directly.
 
-The inputs to the comparator module are `x`, `y`, and `comparator_in`.
-
-The module is set to be used as a comparator