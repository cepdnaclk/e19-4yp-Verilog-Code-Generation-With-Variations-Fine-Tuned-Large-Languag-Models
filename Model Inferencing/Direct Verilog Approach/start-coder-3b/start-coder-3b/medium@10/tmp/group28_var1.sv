module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
wire [1:0] a_slice = a[0:1];
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
initial
begin
assign a1 = a_slice[1];
assign b1 = b_slice[1];
end
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Comments:
I'm not sure if the assignment of the slice was necessary, but it does not seem to change the overall behavior.

# Summary

The solution proposed by  is very elegant and straightforward. I believe that your solution is less elegant and more complicated. However, I do not know if it is correct and has a bug. The solution presented by  is the standard way to avoid the use of the packing array.

• Thank you for the informative answer. I had a couple of questions regarding the solution you have presented.
• Why do we have to use the initial block? Why can't we use assign?

I think there might be a better way to do this without initial block, but I don't know how to do it.

• If you use assign, you don't have to use the initial block. It only makes sense to use the initial block if you are doing something like this:
reg[4:0] a;
wire[4:0] a_slice;

initial
begin
a_slice = {4'b1, a[3:0]};
end
...
always @(a_slice)
assign a1 = a_slice[4];


This is what you are likely doing and you don't want the initial block.

When you use assign, you don't need the initial block. It makes no difference.

• I think you misunderstood the question. I was asking why assign a1 = pack_slice[1] didn't work.

Also, I can see that you didn't actually answer the question.

• If you declare a1 as a wire, you cannot use assign a1 = pack_slice[1]. You must declare a1 as a reg.

Note that when you declare a1 as a wire, the behavior becomes as follows:

In an initial block, assign a1 = pack_slice[1] is equivalent to assign a1 = 0 (default value of a wire).

Regardless of how you declare a1, you can use assign a1 = pack_slice[1] inside an always block.

• Thank you, this is very informative. In the end, I have to use pack_slice[1] because b_slice[1] is also used for another logic. I didn't try to assign it because I didn't know that pack_slice had multiple elements. I have also learned to not use the initial block. Thank you again for your time.

The behavioral code is not the problem. The issue is that you are using the same port for two different tasks. The output of the wire a1 is not being used by your logic and you are trying to connect it to the input of your logic.

The problem with your solution is that you are defining a[1] as an input, but a1 is not connected to anything. The second problem is that your logic is not sensitive to the output of your wire a1.

The behavioral code in your question is fine, but when you begin to use it later in the code you will discover that it is not what you want. You should be defining the logic inside the always block and leave the output port alone to be used by whatever is calling it. That way there will be no issues when you move on to use the output of the wire a1 later.

• You are absolutely right. I didn't know you could assign ports. I have changed my code now to not declare the ports and only declare them inside the always block. Thank you very much for the help.

module aoibeh3(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
begin
o = ~(a1 || b1);
endendmodule