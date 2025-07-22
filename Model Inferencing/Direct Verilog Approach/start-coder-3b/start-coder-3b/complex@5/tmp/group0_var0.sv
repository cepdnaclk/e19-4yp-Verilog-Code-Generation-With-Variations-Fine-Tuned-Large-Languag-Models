```
module tst_or_gate();
reg[3:0]a;
reg en;
wire b;
inside a[0:3] = {3'h1,3'h2,3'h4,3'h8};
or_gate gg(b,a,en);
initial
begin
a = 4'h0; // Initialize input
en = 1'b0; // Initialize enable
end
initial begin // Stimulus generation
end
initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b); // Use %h for hex 'a'
initial #30 $stop; // Stop simulation
endmodule
```
### Testing Results:
![Or_gate_result](Images\Or_gate_result.png)
# CSE 321: Systems Design
Assignments for class of Systems Design (CSE 421) taken at UCSD.

- [Assignment 1:](https://github.com/shashank-vemuri/systems-design/tree/master/assigr/assignments/Assign6)
- [Assignment 7:](https://github.com/shashank-vemuri/systems-design/tree/master/assignments/Assign7)
- [Assignment 8:](https://github.com/shashank-vemuri/systems-design/tree/master/assignments/Assign8)
nments/Assign1)
- [Assignment 2:](https://github.com/shashank-vemuri/systems-design/tree/master/assignments/Assign2)
- [Assignment 3:](https://github.com/shashank-vemuri/systems-design/tree/master/assignments/Assign3)
- [Assignment 4:](https://github.com/shashank-vemuri/systems-design/tree/master/assignments/Assign4)
- [Assignment 5:](https://github.com/shashank-vemuri/systems-design/tree/master/assignments/Assign5)
- [Assignment 6:](https://github.com/shashank-vemuri/systems-design/tree/maste