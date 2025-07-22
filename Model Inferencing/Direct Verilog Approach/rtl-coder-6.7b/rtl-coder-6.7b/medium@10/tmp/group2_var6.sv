```verilog
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
end
localparam N = 2;                   // Create a constant N for the array size
reg [N-1:0] Q;                      // Define the signal Q as a packed array of size N
integer i;                          // Initialize the index variable i
initial begin
    for (i = 0; i < N; i = i + 1) begin
        Q[i] <= (i+1) * 2;          // Set the initial values of the array elements
    end
end
```