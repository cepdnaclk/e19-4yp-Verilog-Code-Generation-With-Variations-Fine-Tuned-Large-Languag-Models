module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Testbench:
module ALU_TB();
    reg [7:0]       a;
    reg [7:0]       b;
    reg             pass;
    reg             add;
    reg [7:0]       alu_out;
    reg [7:0]       expected_out;
    reg [7:0]       actual_out;
    initial begin
    $display("a   b   pass  add    alu_out  expected");
    a = 0; b = 0; pass = 0; add = 0;
    #10;
    write_row();
    a = 0; b = 1; pass = 0; add = 0;
    #10;
    write_row();
    a = 1; b = 0; pass = 0; add = 0;
    #10;
    write_row();
    a = 1; b = 1; pass = 0; add = 0;
    #10;
    write_row();
    a = 0; b = 0; pass = 0; add = 1;
    #10;
    write_row();
    a = 0; b = 1; pass = 0; add = 1;
    #10;
    write_row();
    a = 1; b = 0; pass = 0; add = 1;
    #10;
    write_row();
    a = 1; b = 1; pass = 0; add = 1;
    #10;
    write_row();
    a = 0; b = 0; pass