// Create a module with one input and one output that behaves like a wire
module wire_assign( input in[*], output out[*] );
    // assign out to in
    initial begin
        $display("Assigning in to out.");
        out = in;
        $display("in = %p", in);
        $display("out = %p", out);
    end
endmodule
### Testbench:
// Testbench code for the module above
module testbench;
    // Declare the inputs and outputs of the module
    logic in[*];
    logic out[*];
    // Instantiate the module
    wire_assign uut(.in(in),.out(out) );
    // Define a clock
    logic clk;
    // Generate the clock
    initial begin
        // Initialize the clock to 0
        clk <= 0;
        forever begin
            // Wait for a 10ns delay
            #10;
            // Toggle the clock
            clk <= ~clk;
        end
    end
    // Test the module
    initial begin
        // Wait for 10ns for the clock to settle
        #10;
        // Set the input to 1
        in[clk] <= 1'b1;
        // Wait for 10ns for the clock to change
        #10;
        // Check that the output is also 1
        $display("out[clk] = %b", out[clk]);
        $display("in[clk] = %b", in[clk]);
        // Set the input to 0
        in[clk] <= 1'b0;
        // Wait for 10ns for the clock to change
        #10;
        // Check that the output is also 0
        $display("out[clk] = %b", out[clk]);
        $display("in[clk] = %b", in[clk]);
        // Test a wildcard index
        $display("Setting in[*] = 10");
        in[*] = 10;
        $display("in[*] = %b", in[*]);
        $display("out[*] = %b", out