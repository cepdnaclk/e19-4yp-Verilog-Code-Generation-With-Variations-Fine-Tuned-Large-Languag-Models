```verilog
module dff_inst(D, Clock, Resetn, Q);
input D, Clock, Resetn;
output Q;
lpm_ff flipflop(.data(D),.aclr(Resetn),.clock(Clock),.q(Q));
defparam flipflop.lpm_width = 1;
endmodule

module tb_dff;
parameter DATA_SIZE = 6;
logic [DATA_SIZE-1:0] D;
logic [DATA_SIZE-1:0] Q;
logic Clock, Resetn;

dff_inst uut(.D(D),.Clock(Clock),.Resetn(Resetn),.Q(Q));

always #5 Clock = ~Clock;

initial begin
    // Initialize
    Clock = 0;
    Resetn = 0;
    #5 Resetn = 1;

    // Test 1: Write 1 to D and read back
    D = 6'b100101;
    #10;
    $display("D: %b, Q: %b", D, Q);

    // Test 2: Write 0 to D and read back
    D = 6'b000000;
    #10;
    $display("D: %b, Q: %b", D, Q);

    // Test 3: Write 111111 to D and read back
    D = 6'b111111;
    #10;
    $display("D: %b, Q: %b", D, Q);

    // Test 4: Write 000000 to D and read back
    D = 6'b000000;
    #10;
    $display("D: %b, Q: %b", D, Q);

    // Test 5: Write 101010 to D and read back
    D = 6'b101010;
    #10;
    $display("D: %b, Q: %b", D, Q);

    // Test 6: Write