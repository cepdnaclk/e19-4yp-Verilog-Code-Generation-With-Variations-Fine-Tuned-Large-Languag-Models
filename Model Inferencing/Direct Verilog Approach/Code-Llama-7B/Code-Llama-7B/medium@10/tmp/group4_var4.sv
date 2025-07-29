module jk(j,k,q);
     output q;
     input j,k;
     wire b;
     wire c;
     nor3NMOS(j,k,b,c);
     case (c) 
       1: q = inside(b,2);
       2: q = inside(b,4);
       3: q = inside(b,8);
       4: q = inside(b,16);
       5: q = inside(b,32);
       6: q = inside(b,64);
       7: q = inside(b,128);
       8: q = inside(b,256);
       9: q = inside(b,512);
       10: q = inside(b,1024);
       11: q = inside(b,2048);
       12: q = inside(b,4096);
       13: q = inside(b,8192);
       14: q = inside(b,16384);
       15: q = inside(b,32768);
       16: q = inside(b,65536);
       17: q = inside(b,131072);
       18: q = inside(b,262144);
       19: q = inside(b,524288);
       20: q = inside(b,1048576);
     endcase
  endmodule

### Test Bench
module jk_tb;
  reg j;
  reg k;
  wire q;
  jk uut(j,k,q);
  initial begin
     j<= 0;
     k<= 1;
     #10
     j<= 0;
     k<= 1;
     #10
     j<= 0;
     k<= 1;
     #10
     j<= 0;
     k<= 1;
  end
endmodule
### Expected Output
 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010
### Actual Output
 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010 01010 11010
### Points to Consider:
 - In the test bench, we have been using `initial` statements rather than `always` block which doesn't need to be synthesized.
 - Instead of using `initial` block, if we use `always` block, since the sensitivity list is empty, the block will always be triggered on every clock edge and generate this 32-bit  pattern.

### Reference
 - Section 10.1.3 (page 139 to 140) of `Verilog: A Guide for Synthesis and FPGA Application, 2nd Edition`
 - [IEEE 1800-2012](http