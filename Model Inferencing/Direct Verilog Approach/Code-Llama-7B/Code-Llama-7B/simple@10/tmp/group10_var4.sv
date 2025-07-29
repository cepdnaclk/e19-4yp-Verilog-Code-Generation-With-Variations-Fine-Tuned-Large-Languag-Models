module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; wire co; // Changed data types
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
### Output:
![image](https://user-images.githubusercontent.com/92193127/148636425-029a00ec-3674-4f8e-b037-6c0c3b3b0716.png)
### Explanation:
- The logic-vector data type is a vector of logic type elements. It is used to store a single bit or a set of bits. It is represented by a set of logic elements in the form of an array.
- Each element of this array is of logic type and the total number of elements in it is called the rank of the array.

The above code is a modified code from the ALU_4 code to which the data type of the output was changed to logic.

### Testing Logic-Vector 
The data type logic-vector is a special kind of vector in which each element of the array has the same data type.

In the above code, the logic data type was changed to a logic-vector data type.

The following code is used to test the correctness of the modified ALU_4 code:

module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; wire co;
  alu_4