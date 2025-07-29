module tst_dec4();
wire [3:0]o;
wire [3:0]i;
reg en;
dec4 dec(o,i,en);
initial
begin
i =4'b1000; // Initialize i
end
initial begin
i =4'b0000; // Set i to zero
en =0; // Disable decoder
//en =1; // Enable decoder
end