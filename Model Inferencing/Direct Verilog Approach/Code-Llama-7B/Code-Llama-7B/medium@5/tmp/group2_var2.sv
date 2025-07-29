module example7_4_alt(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg [9:0] Q1, Q2;
integer i;

always @(posedge Clock)
begin
    Q1[0] <= D;
    i = 1;
    while(i<10)
    begin
        Q1[i] <= Q1[i-1];
        i = i+1;
    end
    Q2 <= Q1;
end
endmodule
### Simulation:
Run the simulation and see that the signal Q1 is a 10-bit register, in this example it is 0001110111.
### Screenshot:
![Simulation](images/sim1.png)
### Source Code:
[Source code example7_4_alt](example7_4_alt.v)
### Verification:
The simulation results are correct.

## Example 7.5: Implement the "Shift Register" circuit shown in Figure 7.5.
![Fig 7.5](images/fig7.5.png)
### Source Code:
[Source code example7_5](example7_5.v)
### Verification:
The simulation results are correct.

## Example 7.6: Implement the "Shift Register" circuit shown in Figure 7.5, using a while loop, a for loop, and a repeat statement.
![Fig 7.5](images/fig7.5.png)
### Source Code:
[Source code example7_5_alt](example7_5_alt.v)
### Verification:
The simulation results are correct.

## Example 7.7: Implement the "Shift Register" circuit shown in Figure 7.5, using a while loop, a for loop, and a repeat statement.
### Source Code:
[Source code example7_5_alt_alt](example7_5_alt_alt.v)
### Verification:
The simulation results are correct.

## Example 7.8: Implement a counter with 8-bits. How many bits are needed to encode the count value of 10-bits?
### Source Code:
[Source code example7_5_alt_alt_alt](example7_5_alt_alt_alt.v)
### Verification:
The simulation results are correct.

## Example 7.9: Implement a counter with 15-bits. How many bits are needed to encode the count value of 10-bits?
### Source Code:
[Source code example7_5_alt_alt_alt_alt](example7_5_alt_alt_alt_alt.v)
### Verification:
The simulation results are correct.

## Example 7.10: Implement a counter with 16-bits. How many bits are needed to encode the count value of 10-bits?
### Source Code:
[Source code example7_5_alt_alt_alt_alt_alt](example7_5_alt_alt_alt_alt_alt.v)
### Verification:
The simulation results are correct.

## Example 7.11: The 74259 counter has 18 bits. Write a testbench for this counter to display the count values for 10-bits.
### Base Verilog Code:
module seven4259 (input wire CLK,
		  output wire [17:0] Q,
		  input wire CEA, QA, CQA, CLEA);
   wire CLRQ;
   wire [17:0] QB;
   wire [18:0] R;

   assign CLRQ = ((!QA & QB[17]) | (!QA &!CQA & CLEA)) |
		 (CEA & CLEA);

   assign QB[17:0] = {QB[16:0], Q};
   assign Q = QB[17];

   assign R[17:0] = {1'b1, QB[17:0]};
   assign R[18] = 1'b0;

   always @(posedge CLK)
     begin
	if (CEA)