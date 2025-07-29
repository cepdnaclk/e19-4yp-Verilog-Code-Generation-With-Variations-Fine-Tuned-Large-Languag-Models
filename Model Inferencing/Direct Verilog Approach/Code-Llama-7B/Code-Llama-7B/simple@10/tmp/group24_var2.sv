module DFF (input [7:0] x, output reg [7:0] q);
q <= x;
endmodule

### Changes:
- [Bugzilla 1541672] Incorrect portwidth for packed union
### Diff file:

Diff file for bug 1541672:
@@ -1,4 +1,4 @@
-//