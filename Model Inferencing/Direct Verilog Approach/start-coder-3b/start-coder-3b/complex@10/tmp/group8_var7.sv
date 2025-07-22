module t_Johnson_Counter2();
parameter N = 4;
reg [3: 0] count, count_array [N];

generate
for (i = 0; i < N; i++)
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0_i (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule
endgenerate

initial begin
for (i = 0; i < N; i++)
assign count_array[i] = count;
end

always @*
if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111,
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b1};
default: count <= 0;
endcase
end
initial $finish endmodule ### Results:  Original:  Original and Modified both work. Both run correctly. Modified:  Original: 3921 output lines 698 input lines (97%) 17.63% 1185 input lines 484 output lines (67%) 46.71% ### Variation Instruction: Use a generate block to wrap the Johnson counter logic, and use `inside` to check `count` inside a static array with constant index. ### Modified Code: module t_Johnson_Counter4(); parameter N = 4; reg [3: 0] count_array [N]; reg [3: 0] count; generate for (i = 0; i < N; i++) // Generate Johnson Counters wire [3: 0] count; reg enable; reg clock, reset; Johnson_Counter M0_i (count, enable, clock, reset); initial #500$finish;
initial begin
clock = 0;
forever #5 clock = ~clock;
end
initial fork
join
endmodule
endgenerate
initial begin
for (i = 0; i < N; i++)
assign count_array[i] = count;
end
always @*
if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111,
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b1};
default: count <= 0;
endcase
end
initial \$finish
endmodule
### Results:
Original:
Original and Modified both work. Both run correctly.
Modified:
Original:
3921 output lines
698 input lines (97%)
17.63%
1185 input lines
484 output lines (67%)
46.71%
•  » » 4 weeks ago, # ^ |   0 Thank you!
 » 4 weeks ago, # |   +11 For the second task, you can also use verilog's $display function. This will print out the values at the appropriate points in time. You can also use the $time$ variable to get the current time:
•  » » 4 weeks ago, # ^ |   0 I'll definitely try that out. Could you please tell me how I can use $time$ in a for-loop?
•  » » » 4 weeks ago, # ^ |   0 You can use it normally within a module and even a module's always block, but you have to put a "begin" in the end of the module: module My_Module(); always begin $display("Time = %0t", $time); end endmodule  You can use $time within the for-loop's condition, but you cannot use it in the for-loop's body, however, you can use a variable to do so:
module My_Module(); integer i; always begin i = 0; for (i = 0; i < 5; i = i + 1) $display("Time = %0t, i = %0d", $time, i); end endmodule 
 » 4 weeks ago, # |   +19  » 4 weeks ago, # ^ |   +11 I have just edited my answer to include $time.
 » 4 weeks ago, # |   +43 When I wrote a Verilog implementation of this algorithm that was based on the description of the specification in the statement I got pretty confused. It was a small mistake in my code, but I was curious how other people solved this task and I found out that there are a couple of similar solutions. My solution.
 » 4 weeks ago, # |   +31 This is actually a very good example of why a well defined specification is always better than an unclear one :)
•  » » 4 weeks ago, # ^ |   +31 I think this is a good point. Especially because I remember my students getting so frustrated with their assignments because of this problem and some of them even didn't have any clue how to solve it.
•  » » » 4 weeks ago, # ^ |   +3 I was on my third assignment that I couldn't do that simple thing, and I spent the whole afternoon writing a random implementation of it (because I had no idea how to implement it).
•  » » » 4 weeks ago, # ^ |   +5 I had a similar experience, but it was with a much more complex task. First, I had to write a program that converts a binary string in a form: 1010011110000111100001111011101011110000111100001110101010111, which consists of a prefix (1010011110000111100001111011101011110000111100001110101010111), then I wrote several tests, and I had the impression that my program worked correctly, but I had no idea what it should do in case the input string doesn't have the required prefix. I really had to read the statement again.
•  » » » 4 weeks ago, # ^ |   +26 I was on that assignment too, and in the end, at 7:30am, I simply gave up :/ I was on for like 2 hours, I had no idea what to do with that string (it was quite long, so I couldn't even find the first 10100 in it), so I was completely frustrated and I didn't know what to do.
 » 4 weeks ago, # |   +16 I don't think that the examples are good enough to describe the algorithm. I think an example would be to show how to convert a binary number in bcd format to binary in any radix r. Here is a link that I wrote and I think is quite clear: https://www.hackerrank.com/challenges/bcd-conversion/forum/comments/368621
 » 4 weeks ago, # |   +86 I think the task is better expressed as "given a binary string, print the corresponding decimal string", because the number of binary strings is much larger.
•  » » 4 weeks ago, # ^ |   +20 +1
 » 4 weeks ago, # |   +3 I'd also suggest to add the following to the statement: "The result of the operation is equivalent to the operation for a string consisting of the same digits, each multiplied by the power of 10 given by the index of its corresponding digit. For example, 7832 will be converted to 700 + 80 + 302 + 2 = 1108."
 » 4 weeks ago, # |   0 Is it possible to do the same thing using if-else blocks instead of cases? I tried, but it was just confusing.
•  » » 4 weeks ago, # ^ |   +11 I believe cases is the only way to do this in ISE.
•  » » » 4 weeks ago, # ^ |   0 I think that the way you would write code would depend on the tool you're using. In Vivado, you could use if-else blocks, but that tool doesn't support cases.
 » 4 weeks ago, # |   0 Can anyone please help me with this question?? I understand the question and I have a solution to it but I don't know how to implement this solution in verilog. Question statement