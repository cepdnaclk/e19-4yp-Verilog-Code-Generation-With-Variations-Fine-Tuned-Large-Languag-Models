module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Expected Output:
* 3 assertions, 0 failures, 0 errors
* 3 assertions, 0 failures, 0 errors
### Test Output:
* 6 assertions, 0 failures, 0 errors
* 4 assertions, 1 failures, 0 errors
* 11 assertions, 0 failures, 0 errors
### Variation Name:
ByteTypeD
### Variation Explanation:
The input vector is modified to be of type byte.
### Variation Risks:
### Variation Remediation:
### Variation Affects: