module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule
### Modified Verilog Testbench:
module ALU_TB ();

    // Declare instance of ALU
    reg [7:0] a;
    reg [7:0] b;
    reg pass;
    reg add;
    wire [7:0] alu_out;
    ALU alu_i (.a (a),.b (b),.pass (pass),.add (add),.alu_out (alu_out));

    // Stimulus for ALU
    initial begin
        $display("Test1: Output should be 13");
        a = 10;
        b =  3;
        pass = 0;
        add = 1;
        #1;
        $display("%d + %d = %d", a, b, alu_out);
        #1;
        $display("Test2: Output should be 9");
        a = 7;
        b = 2;
        pass = 0;
        add = 1;
        #1;
        $display("%d + %d = %d", a, b, alu_out);
        #1;
        $display("Test3: Output should be 7");
        a = 7;
        b = 0;
        pass = 0;
        add = 1;
        #1;
        $display("%d + %d = %d", a, b, alu_out);
        #1;
        $display("Test4: Output should be 9");
        a = 7;
        b = 2;
        pass = 0;
        add = 0;
        #1;
        $display