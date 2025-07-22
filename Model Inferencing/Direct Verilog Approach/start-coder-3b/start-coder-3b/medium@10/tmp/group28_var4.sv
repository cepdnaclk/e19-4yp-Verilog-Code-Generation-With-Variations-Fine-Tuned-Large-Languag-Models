module aoibeh2(o,a,b); // Mixed structural/behavioral AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
initial // Initial block
assign {a1,b1} = {a[1:0],b[1:0]};
reg o; // Behavioral output must be reg
// Structural AND gates using primitives
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Behavioral NOR logic sensitive to AND outputs
always@(a1 or b1)
o = ~(a1 || b1);
endmodule
### Result:
This works. But it is not much different from the normal procedural assign with initial block.
Why is this?
##### Share on other sites

As you've probably noticed by now, this won't work in Verilog because of the way the language constructs.

And this will not work in Verilog either (for any other reason)

always@(a1 or b1)


I'm not certain why you want this to work, but Verilog doesn't like the way you've structured it.

I'd like to see the code for the module that you're working on now.

edit:

What you've made is an asynchronous OR gate. It won't do what you expect.

##### Share on other sites

I'm not certain why you want this to work

Why do you need this? I thought only the one-way is not enough.

##### Share on other sites

A synchronous or gate is made using a combination of logic gates that have the right inputs configured to turn into logic levels that match the desired function using always and/or or blocks.

For example, the one in question here could be made like this:

module aoibeh2(o,a,b);
output o;
input[1:0]a,b;
wire a1,b1;
reg a1,b1;
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
always @(*)
begin
a1 = a[1];
b1 = b[1];
end

always@(a1 or b1)
o = ~(a1 || b1);
endmodule

Note that I have changed the order of assignment, so that the input values are set as part of the assignment that is triggered by the output. This can be done since the signals are declared as registers. You could also just use assign a1 = a[1] and have it be the same as I have. Also note that I have used the more compact and more readable bit selectors instead of a[0] and a[1], but you can use the full-word selectors if you want.

Note also that I have used the @(*) block to trigger the assignments whenever anything changes. It's important because if I do this:

always @ (posedge clk);


Then the assign would only fire at the rising edge of the clock. This can be a big headache, especially when I'm not sure what's going to change so I have to write down all the signals I want to assign. This is especially cumbersome when I have a lot of lines of code.

##### Share on other sites

Why do you need this? I thought only the one-way is not enough.

I don't think so. You need a two-way, because you have to take into account the change of one input and the change of the other.

##### Share on other sites

I don't think so. You need a two-way, because you have to take into account the change of one input and the change of the other.

But you don't need two different wires. You don't need a second always block. You just need to assign to the wires instead of the regs.

##### Share on other sites

But you don't need two different wires. You don't need a second always block. You just need to assign to the wires instead of the regs.

Wire a AND b;
assign a = a[1];
assign b = b[1];


A synchronous or gate is made using a combination of logic gates that have the right inputs configured to turn into logic levels that match the desired function using always and/or or blocks.

For example, the one in question here could be made like this:

This is what I meant by "two different wires". The problem is that the other always block isn't needed, because it won't fire at all.

##### Share on other sites

A synchronous or gate is made using a combination of logic gates that have the right inputs configured to turn into logic levels that match the desired function using always and/or or blocks.

For example, the one in question here could be made like this:

This is what I meant by "two different wires". The problem is that the other always block isn't needed, because it won't fire at all.

Ah, okay. I see what you're saying now. Thanks for clearing it up for me.

##### Share on other sites

In general, you will not be able to make this work properly. There are many possible combinations that will not work. (For instance, if you flip the inputs, the output changes, but the internal logic of the module will need to change accordingly.) You also cannot really do this in the same module. You would need a separate module for this gate, or you would need multiple modules, one for each input combination.

##### Share on other sites
In general, you will not be able to make this work properly. There are many possible combinations that will not work. (For instance, if you flip the inputs, the output changes, but the internal logic of the module will need to change accordingly.) You also cannot really do this in the same module. You would need a separate module for this gate, or you would need multiple modules, one for each input combination.

That's what I tried to achieve.

So, if the module that I want to modify is a behavioral module, how can this be done?

##### Share on other sites

Sorry, you can't. Behavioral modules are designed to work with different inputs. You'd have to duplicate the module for every possible input combination.

##### Share on other sites

Sorry, you can't. Behavioral modules are designed to work with different inputs. You'd have to duplicate the module for every possible input combination.

Is there any way to implement this using behavioral primitives?

##### Share on other sites

Is there any way to implement this using behavioral primitives?

Yes, you'd need a case statement.

##### Share on other sites

That's what I tried to achieve.

So, if the module that I want to modify is a behavioral module, how can this be done?

##### Share on other sites

For a behavioral module, just use a case statement and the primitive functions.

##### Share on other sites

This topic is 1612 days old which is more than the 365 day threshold we allow for new replies. Please post a new topic.

## Create an account

Register a new account

• ### Forum Statistics

• Total Topics
628725
• Total Posts
2984411

• 25
• 11
• 10
• 16
• 14