module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
always @ (posedge clk)
if (clk) begin
if (i1[0:1]==1'b1)
if (i2[0:1]==1'b1)
o = 1'b1;
else
o = 1'b1;
else if (i1[0:1]==1'b1)
o = 1'b1;
else if (i2[0:1]==1'b1)
o = 1'b1;
else if (i1[0:1]==1'b0)
o = 1'b1;
else if (i2[0:1]==1'b0)
o = 1'b1;
else
o = 1'b0;
end
endmodule

```

-
This is a good question. I've remarked it in my answer below. But the question is not yet ready for a bounty. –  Jan 6 '13 at 13:55
@MarcusMüller - I think the question is clear enough. It seems a reasonable question to me. –  Jan 7 '13 at 15:12
@MarcusMüller - Yes, I agree. –  Jan 7 '13 at 15:42

This is an excellent question. I would like to provide a (semi-)complete answer, but first I should point out that it seems to me that the answers to this question are not as clear as they should be. Unfortunately I am not very familiar with the internals of Verilog, and therefore I often am not able to understand the answers to this question.

I will therefore first start with a very brief description of what I understand from your question.

First of all, Verilog does not have a concept of a "gate" in the same way that it has a concept of a "module". Instead, module declarations are just "a special case of an architecture".

Modules also have a "function" in that they can be instantiated. For example, you could have a module that is used to implement a comparator. There are, however, very few primitives that can be instantiated as a "module".

I'll start by pointing out that the "architecture" you refer to in your question is not really an architecture, but more a collection of wire declarations that are all together connected to each other.

I will then go on to describe the current state of the design that you have (you seem to have a lot of stuff missing) and attempt to give an explanation for why it is the way it is. This is mostly based on the information from the documentation that is available for the modelsim simulator.

I will not give you answers to all of your questions, since some of your points are not really well defined. But I will try to give you some good hints, that will hopefully be enough to give you an answer to your questions.

### Current Circuit

The first thing that you have to understand is that you can do everything that you do in Verilog in an architecture. But when you get down to it everything that you do in an architecture is translated into a module. That is not a very well defined concept, I agree. However, as I said before, in Verilog you can do everything, including instantiating modules.

I will now try to understand how would you do a "real" comparator. Note that this is not a real comparator, but instead it is an architecture that is used as a comparator. But that will suffice for now.

Let's have a look at the current design that you have now:

module comparator (
output wire o,
input wire i1,
input wire i2
);

buf i1_buf (i1, tmp1);
buf i2_buf (i2, tmp2);

assign o = tmp1? tmp2 : tmp1;

endmodule


Since the module has a lot of stuff in it I will only look at parts of it.

First of all there is this thing that's called a "buf". This is a kind of buffer that is used to implement a "gate". The buffer has two "pins" that are used to connect to the input and output wires.

Secondly you have various wire declarations that have names. Usually wires are used to represent "signals". But instead of just having one wire, there are two wires that are connected to each other. And you can see that there is also an output wire that is connected to the output pin of the buffer.

So what is this "tmp1" and "tmp2" thing? Well, it looks like "tmp" is used as a "temporary" name that stands for "temporary wire". It's not really a temporary wire. But instead it is used to "hold" a value. A temporary wire is a wire that is only used for one thing. You can use it to temporarily connect to another wire.

So where does the "assign" statement come from? Well, the "assign" statement is really nothing but a "wire assignment". So you can see that the "assign" statement assigns the value of the "tmp1" wire to the output wire.

Now I want you to understand what this circuit does. If you understand how a "simple comparator" works, then you understand how this circuit works.

If you don't know how a "simple comparator" works, I will try to explain it for you.

Let's say that you want to compare the value of the "i1" wire with the value of the "i2" wire. You can say that the new wire that we will create is either equal to "i1" or equal to "i2". But how do you know which one should you choose? Well, it is not really clear to me.

The best way to know how a "simple comparator" works is to look at how a "mux" works.

A mux is a "multiplexer". It can select between two inputs. If you choose the input "a" it will output the value of "a". If you choose the input "b" it will output the value of "b".

In order to get a "mux" you first have to create two "buffers" that are connected to the input wires. So now you have two inputs that you can connect to a "mux" that will select between the two inputs.

If you want to compare the two values you are using the "mux" to select between the two values. If the value of "a" is equal to the value of "b" you will choose the value of "a". Otherwise you will choose the value of "b". You can see that this is exactly what the "tmp1" and "tmp2" wires are doing.

But now the question is: how can you compare two values? Well, the answer is really simple. You just say that if "a" is equal to "b" you will choose true. If "a" is not equal to "b" you will choose false.

So how does the "mux" work? Well, I will try to explain it a bit more.

First of all: what is a "mux"? The "mux" is a "multiplexer". It is a logical circuit that can take multiple inputs and compare the values.

So what does a "mux" do? The first thing that you have to know is that a "mux" can only have two inputs. You have two wires ("a" and "b") and the "mux" can only compare the value of one of the inputs. What kind of comparison does the "mux" do?

If you compare "a" to "b" you can say that the value of "a" is equal to the value of "b". What does this mean? Well, it means that you compare the values of the two wires. If the values are equal then the "mux" will choose the value of "a". If the values are not equal then the "mux" will choose the value of "b".

Now you can see that the "tmp1" and "tmp2" wires are connected to an "mux" that compares the values of the two inputs.

In order to understand how the "mux" works, you have to think of it as a "multiplexer". It is a logical circuit that can take multiple inputs and compare the values of the inputs.

I will assume that you know what a "multiplexer" is (if not: read about it in your textbook or online). The "mux" is used to compare the values of the wires that are connected to the two inputs that are used