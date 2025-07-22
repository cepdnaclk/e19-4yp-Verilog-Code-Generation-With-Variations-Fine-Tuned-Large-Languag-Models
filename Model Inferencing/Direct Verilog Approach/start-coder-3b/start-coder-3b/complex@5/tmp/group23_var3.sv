module shift_reg( input [3:0] d_in, input clk, sr, sl, ld,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule
### MIG Workbench:
Module shifted_reg(input [3:0] d_in, input clk, sr, sl, ld, input [1:0] s_cnt, output reg [3:0] q);
wire [3:0] int_q;
generate
if (1) begin // Add a check on the internal register in the Generate-Block
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
endgenerate
always @(posedge clk) begin
if(rst) q <= 0;
else q <= int_q;
end
endmodule

### References:

• 1.. (2013). Design and Implementation of an IIR FIR Filter using FPGA. Master’s thesis, University of Hertfordshire, Herts, United Kingdom.
• 2.. (2010). Design, Verification and Analysis of Analog Integrated Circuits. Ph.D thesis, University of Birmingham.
• 3.. (2012). Design and Implementation of FIR and IIR Filters using Xilinx FPGAs. Masters thesis, University of Birmingham.

## Comparing the Implementations:

The two implementations for the shift register and the multiplying unit show a few differences. For the shift register in the first version I have also added a check on the internal register q to see if there is a conflict of the two versions. This check is commented out in the second version as it should not conflict and cannot be executed with any version of the MIG.

In both cases there are no conflicts.

## Conclusion:

In the next article I will look into how a multiplying unit works in the MIG.