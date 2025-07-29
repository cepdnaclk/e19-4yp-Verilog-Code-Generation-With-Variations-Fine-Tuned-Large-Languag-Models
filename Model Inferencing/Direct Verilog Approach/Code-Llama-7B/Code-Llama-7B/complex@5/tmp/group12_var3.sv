module dffalter(output q, qb, input di, clk, clr, pr);
// parameter WIDTH=32; // Moved to Package
localparam WIDTH=5; // Modified to get desired width
// reg [WIDTH-1:0] q0; // Moved to Package
// reg q0b; // Moved to Package
// always @(posedge clk) begin q0<=di; q0b<=~di; end // Moved to Package
// wire [WIDTH-1:0] q1; // Added q1
// reg [WIDTH-1:0] q1b; // Added q1b
// wire [2:0] qb; // Modified
// reg [2:0]