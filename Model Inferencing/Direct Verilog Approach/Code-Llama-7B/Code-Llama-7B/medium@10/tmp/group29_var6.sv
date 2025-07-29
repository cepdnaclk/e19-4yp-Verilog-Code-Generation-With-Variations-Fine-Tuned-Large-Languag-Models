module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule
module array_test (Sel, Input, Output);
input Sel;
input [511:0] Input;
output [31:0] Output;
wire [31:0] Output;
wire [31:0] Output;
wire [31:0] Output;
wire [31:0] Output;
wire [31:0] Output;

integer i;
generate
for (i = 0; i < 64; i = i + 1) begin : i
     muxdff uut(.D0(Input[i]),.D1(Input[63 - i]),.Sel(Sel),.Clock(1'b1),.Q(Output[i]));
    end
endgenerate

endmodule

### Expected Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]

### Actual Output:

D0, D1, Sel, Clock : [inputs]
Q : [outputs]