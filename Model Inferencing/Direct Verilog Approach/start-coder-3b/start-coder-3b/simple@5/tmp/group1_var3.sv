// Verilog code for Problem 3
module OR_Gate(
    input A [0:n], B [0:n],
    output Y [0:n]
);
    integer j;
    logic [1:0] A_new [0:n];
    logic [1:0] B_new [0:n];
    logic [1:0] Y_new [0:n];
    //convert logic arrays into packed logic vectors
    for (j = 0; j < n; j = j + 1) begin