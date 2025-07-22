module alu_4(output c,input x,input y,output s,input[1:0] f,input cin);
  // Performs addition, subtraction, logical AND, or exclusive-OR
  logic co;
  assign co = (x&y)|(x&cin)|(cin&y); // carry-in logic
  assign c = (x&(~y))|(y&(~x))|(cin&(x^y)); // Sum logic
  assign s = (f==2'b00)?x&y:(f==2'b01)?x|y:(f==2'b10)?x^y:y; // Select-line logic
endmodule