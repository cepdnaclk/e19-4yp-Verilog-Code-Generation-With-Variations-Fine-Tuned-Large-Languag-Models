module jkEdgeFF(q, clock, j, k, preset, clear);
input j, k, clock;
input preset, clear;
output q;
reg q;
logic [3:0] array [2:0];
always @(posedge clock)
begin
  // Procedural assignment to array using constant index
  array[0] = 4'b1111;
  if(preset)
  begin
    q <= 1;
  end
  else if(clear)
  begin
    q <= 0;
  end
  else if(j)
  begin
    q <= ~ q;
  end
end
endmodule
### Expected Output:
Simulation should halt with an error message along the lines of:
"Procedural assignment has been detected while executing the following statement: array[0] = 4'b1111"
### Simulation Logic
This example test case will show the same procedural code as the first test case, but will use an 1D array instead of a 2D array.
### Test Case:
module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
logic [3:0] array [2:0];
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
$display(array[0][0]);
end
m555 timer(clock);
endmodule
### Expected Output:
Simulation should halt with an error message along the lines of:
"Procedural assignment has been detected while executing the following statement: array[0][0] = 1'b0"
### Summary:
This example should demonstrate a procedural assignment to a 2D logic array. Since the index is a constant, and the memory is not large enough to accommodate the index, MDA will raise an error.
### Simulation Logic
Similar to the second test case, but now with a procedural assignment to an 1D logic array.
### Test Case:
module jkEdgeFF(q, clock, j, k, preset, clear);
input j, k, clock;
input preset, clear;
output q;
reg q;
logic [3:0] array [2:0];
always @(posedge clock)
begin
  // Procedural assignment to array using constant index
  array = 6'b111111;
  if(preset)
  begin
    q <= 1;
  end
  else if(clear)
  begin
    q <= 0;
  end
  else if(j)
  begin
    q <= ~ q;
  end