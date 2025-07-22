module par(my_parity, my_all_ones);
    // Unpacked Structure Definition
    typedef struct packed {
        logic [4:0] a;
        logic [1:0] b;
        logic [1:0] c;
        logic [2:0] d;
    } my_struct;

    my_struct s0;
    
    // Assigning Values to Structure Variables
    assign s0.a = 5'b10100;
    assign s0.b = 2'b11;
    assign s0.c = 2'b10;
    assign s0.d = 3'b111;

    // Structure Variable Assignments
    logic [7:0] x, y;
    logic [1:0] out;

    // Input Assignments
    assign x[4] = 1'b1;
    assign y[4] = 1'b0;

    assign x[6] = 1'b1;
    assign y[6] = 1'b0;

    // Structure Variable Assignment using Structure Variables
    logic my_parity;
    logic my_all_ones;
    assign my_parity = $bits(my_struct)'(s0.a ^ s0.b ^ s0.c ^ s0.d);
    assign my_all_ones = $bits(my_struct)'(s0.a & s0.b & s0.c & s0.d);
    assign out = my_parity? 2'b01 : 2'b10;

    // Output Declaration
    logic [63:0] my_out;
    
    // Generating Outputs
    assign my_out = { 8'b0000_0000, x, 8'b0000_0000, y, 8'b0000_0000, out };
endmodule