initial begin: Apply_Data /*... Figure 8.11... */
indx = 0;
// Clear memory
for(indx=0; indx<3; indx=indx+1)
begin
mem1[indx] = 0;
mem2[indx] = 0;
end
// -- Set up memory for operands --
mem1[0] = 10;   // -- opnd1[7:0] = 10   --
mem1[1] = 0;    // -- opnd1[15:8] = 0   --
mem2[0] = 5;    // -- opnd2[7:0] = 5    --
mem2[1] = 0;    // -- opnd2[15:8] = 0   --
opnd1 = opnd1 + mem1[indx]; // -- Load MSB of operand 1 --
opnd2 = opnd2 + mem2[indx]; // -- Load MSB of operand 2 --
indx = indx + 1; // -- Increment memory address to next word --
im_data = opnd2[7:0]; // -- Load LSB of operand 2 --
end
### Expected Result:
Error: (vsim-3050) Operand 2 is all 0's.