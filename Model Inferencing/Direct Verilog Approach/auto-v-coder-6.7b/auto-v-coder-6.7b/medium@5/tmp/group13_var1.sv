```verilog
wire [31:0] tb_array[31:0];
reg [4:0] x;

initial begin
    x = 16;  // Initialization of x
    if (x >= 16 && x <= 30)
        tb_array[x] = 'h0;  // tb_array[16] to tb_array[30] all set to 'h0
    else
        tb_