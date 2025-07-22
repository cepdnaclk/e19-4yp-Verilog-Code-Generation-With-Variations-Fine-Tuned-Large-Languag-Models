```verilog
module comp
#(parameter N = 8) // Parameterized for flexibility
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
genvar i;
generate
for(i=0; i<N; i=i+1) begin: flag_setting_loop
always @(*) begin
flag_setting_logic(x[i], y[i], gt, eq, lt);
end
end
endgenerate
endmodule

// Function for flag setting
module flag_setting_logic (input wire [N-1:0] x,
                           input wire [N-1:0] y,
                           output reg gt,
                           output reg eq,
                           output reg lt);
always @(*) begin
// Default outputs to 0
gt = 1'b0;
eq = 1'b0;
lt = 1'b0;
// Set flags based on comparison results
if(x > y)
gt = 1'b1;
if(x == y)
eq = 1'b1;
if(x < y)
lt = 1'b1;
end
endmodule
```
This code creates a parameterized module `comp` with a flag setting loop, where each bit of the input vector is compared with the corresponding bit of the other input vector. The result of each comparison (whether x is greater than y, equal to y, or less than y) determines whether the respective flag is set to 1 or 0.
The flag_setting_logic module is used to encapsulate the logic for setting the flags within the generate block. This makes the main module compact and easier to read/understand. The generate block will instantiate the same flag_setting_logic module for each bit in the vectors, making the overall solution more flexible and scalable if necessary.
Please note that you need to compile and evaluate the design to make sure it's working as expected. Also, in a real-world scenario, you would probably want to add functionality for handling edge cases and more granular flag settings (like for every bit position separately).### That's it. That's how you can build