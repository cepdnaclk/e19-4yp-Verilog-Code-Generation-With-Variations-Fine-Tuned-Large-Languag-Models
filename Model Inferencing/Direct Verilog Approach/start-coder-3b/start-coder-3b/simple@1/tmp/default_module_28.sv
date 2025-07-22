module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [3:0] Data;
output [3:0] Sum, RegSum;
wire [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule
### Output:
Error: (vlog-3558) syntax error at example3.v(12) :
error: syntax error, unexpected lvalue, expecting identifier or symbol
assign Sum = Data + RegSum;

^
2 errors detected.

### Expected Behavior:
Module should generate with the modified code.

### Steps to Reproduce

### Operating System:
Mac
### Additional Information
I'm not quite sure how I can debug the issue. I suspect it has something to do with my code having too many parentheses. Is this assumption correct? I can try to fix the code to see if the issue is resolved after all.username_1: You can use the `unexpand` command to remove all of these redundant parentheses:

```bash
$ unexpand -a \
    example3.v \
    | cat > example3.v

```

Then `vlog` should accept your code.
Upvotes: 0 username_2: I was dealing with something similar. I found that I could get around the problem by writing

```
if (condition)
  assign sum = a+b;
else
  assign sum = c+d;
end

```

instead of

```
reg2 R1;

if (condition)
  R1 = a+b;
else
  R1 = c+d;
end

assign sum = R1;

```

This seems to work for a single instance. For more instances, I had to put the instances in a for loop and use a net array to hold the sum:

```
for (i=0; i < #instances; i++)
  wire [3:0] Sum;
  wire [3:0] Data;
  wire [3:0] RegSum;

  reg4 R1 (Sum, Clock, Reset, RegSum);
  assign Sum = Data + RegSum;
end

```

I am assuming that the wires are the same size as the data.

I hope this helps.
Upvotes: 2 [selected_answer]