module example7_5(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg [10:1] Q1, Q2;
always @(posedge Clock)
begin
    Q2 <= Q1[9];
    Q1[9] <= D;
    Q1[9:0] <= Q1[9:1]+1;
end
endmodule
### Verilog Simulator Output:

![Lab7-5 Output](/Lab7-5Output.PNG)


function solution(N) {
  var length = N.toString().length;
  var power = Math.pow(10, length - 1);
  var array = [];
  var number = 0;

  for (var i = 0; i < power; i++) {
    array.push(i);
  }

  for (var i = 0; i < power; i++) {
    if (N.toString().includes(array[i].toString())) {
      number = array[i];
      break;
    }
  }

  return +(number + 1).toString();
}
## Lab 5-1: 

**Description:**

Write a Verilog HDL code that simulates the circuit with 6 input bits, 6 output bits and 1 clock input/output.

**Base Verilog Code:**

module ex_1(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg Q1, Q2;

always @(posedge Clock)

begin

Q1 <= D;

Q2 <= Q1;

end

endmodule

**Variation Instruction:**

Add a while loop condition that uses inside with a variable index applied to a packed array.

**Modified Code:**

module ex_2(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg [5:1] Q1, Q2;

always @(posedge Clock)

begin

Q2 <= Q1[5];

Q1[5] <= D;

Q1[5:1] <= Q1[5:2]+1;

end

endmodule

**Verilog Simulator Output:**

![](images/5-1_1.PNG)

**Lab 5-2:**

**Description:**

Write a Verilog HDL code that simulates the circuit with 6 input bits, 6 output bits and 1 clock input/output.

**Base Verilog Code:**

module ex_1(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg Q1, Q2;

always @(posedge Clock)

begin

Q1 <= D;

Q2 <= Q1;

end

endmodule

**Variation Instruction:**

Add a while loop condition that uses inside with a variable index applied to a packed array.

**Modified Code:**

module ex_2(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg [5:1] Q1, Q2;

always @(posedge Clock)

begin

Q2 <= Q1[5];

Q1[5] <= D;

Q1[5:1] <= Q1[5:2]+1;

end

endmodule

**Verilog Simulator Output:**

![](images/5-2_1.PNG)

**Lab 5-3:**

**Description:**

Write a Verilog HDL code that simulates the circuit with 2 input bits, 2 output bits and 1 clock input/output.

**Base Verilog Code:**

module ex_1(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg Q1, Q2;

always @(posedge Clock)

begin

Q1 <= D;

Q2 <= Q1;

end

endmodule

**Variation Instruction:**

Add a while loop condition that uses inside with a variable index applied to a packed array.

**Modified Code:**

module ex_2(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg [1:0] Q1, Q2;

always @(posedge Clock)

begin

Q2 <= Q1[1];

Q1[1] <= D;

Q1[1:0] <= Q1[1:1]+1;

end

endmodule

**Verilog Simulator Output:**

![](images/5-3_1.PNG)

**Lab 5-4:**

**Description:**

Write a Verilog HDL code that simulates the circuit with 10 input bits, 10 output bits and 1 clock input/output.

**Base Verilog Code:**

module ex_1(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg Q1, Q2;

always @(posedge Clock)

begin

Q1 <= D;

Q2 <= Q1;

end

endmodule

**Variation Instruction:**

Add a while loop condition that uses inside with a variable index applied to a packed array.

**Modified Code:**

module ex_2(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg [9:1] Q1, Q2;

always @(posedge Clock)

begin

Q2 <= Q1[9];

Q1[9] <= D;

Q1[9:1] <= Q1[9:2]+1;

end

endmodule

**Verilog Simulator Output:**

![](images/5-4_1.PNG)

**Lab 5-5:**

**Description:**

Write a Verilog HDL code that simulates the circuit with 10 input bits, 10 output bits and 1 clock input/output.

**Base Verilog Code:**

module ex_1(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg Q1, Q2;

always @(posedge Clock)

begin

Q1 <= D;

Q2 <= Q1;

end

endmodule

**Variation Instruction:**

Add a while loop condition that uses inside with a variable index applied to a packed array.

**Modified Code:**

module ex_2(D, Clock, Q1, Q2);

input D, Clock;

output Q1, Q2;

reg [9:1] Q1, Q2;

always @(posedge Clock)

begin

Q2 <= Q1[9];

Q1[9] <= D;

Q1[9:1] <= Q1[9:2]+1;

end

endmodule

**Verilog Simulator Output:**

![](images/5-5_1.PNG)

## Chapter 2 Quiz 2.3.11

Question:

What is the time complexity of a linked list for inserting a new node at the end of the list?

- O(1)
- O(n)
- O(n2)
- O(log n)

Correct Answer: O(n)## Lab 11-1: 

**Description:**

Write a Ver