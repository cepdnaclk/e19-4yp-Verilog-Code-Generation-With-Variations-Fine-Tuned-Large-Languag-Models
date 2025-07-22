-module AND_Gate(
-   input A, B,
-    output Y
-);
-    logic [1:0] A [0:3];
-    assign Y = A[0] & A[1] & A[2] & A[3];
-endmodule
+
+module AND_Gate(
+    input A, B,
+    output Y
+);
+    logic [1:0] A [0:3];
+    assign Y = A[0] & A[1] & A[2] & A[3];
+endmodule
 
 module OR_Gate(
     input A, B,
     output Y
 );
-    logic [1:0] A [0:3];
-    assign Y = A[0] & A[1] & A[2] & A[3];
+    logic [1:0] A [0:3];
+    assign Y = A[0] | A[1] | A[2] | A[3];
 endmodule
 
 module NOT_Gate(
     input A,
     output Y
 );
-    logic [1:0] A [0:3];
-    assign Y = A[0] & A[1] & A[2] & A[3];
+    logic [1: