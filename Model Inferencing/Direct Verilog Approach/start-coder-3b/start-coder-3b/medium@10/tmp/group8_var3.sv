module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
// This initial code block is not needed
//initial $monitor ($time, " output o = %b, input i = %b ", o,i);
if(i) // The if statement takes care of the initial code block
initial #14 $stop; // Stop simulation endmodule Edited by:  ### Comments: I have included an edited code above. It removes the initial code block. I removed the // from the comments which doesn't make much sense. Original Author: