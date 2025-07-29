module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Initial block to test the array as a whole range
initial begin
	for (i=0; i<10; i=i+1) begin
		if ((arr[i]!=1) || (arr[9-i]!=0)) begin
			$display("ERROR: array is not resolved correctly");
			$finish();
		end
	end
end
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
### Comparison of the two Verilog Modules:

<table>
<tr>
<td>

module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
</td>
<td>
module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Initial block to test the array as a whole range
initial begin
	for (i=0; i<10; i=i+1) begin
		if ((arr[i]!=1) || (arr[9-i]!=0)) begin
			$display("ERROR: array is not resolved correctly");
			$finish();
		end
	end
end
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
</td>
</tr>
</table>

### Changes in the initial block:
* The code now checks the array as a whole range. 
* The for loop is executed 10 times and checks each value in the array against the expected value (1 or 0).
* The code now uses the if statement in the for loop that checks both the values on each iteration of the loop.


### Output of the modified code:
```console
...
ERROR: array is not resolved correctly
Simulation failed.
Error: Unknown error, simulation aborted
```
### Reflection:
* It was a bit difficult to decide where to put the code in the initial block.
* The if code inside the loop does not seem very efficient. 

### Changes in the base Verilog Module:
* Change the buffer instantiations from two to an array of two instantiations.
* Add a wire 'o' as an output.
* Add a wire 'i' as an input.
* Add an array 'arr' of 10 elements.
* Add a process 'p' that stores the value of 'o' in each element of the 'arr' array.
* Write an if statement to check the value of the 'o' output for each element in the 'arr' array.

### Modified Code