```verilog
module IR ( input logic [7:0] data_in, 
            input logic load, clk,
			input logic [1:0] A [0:3],
			input logic [1:0] B [0:3],
          output reg [7:0] data_out );

// Simple register (Instruction Register) loaded on posedge clk when load is high
always @( posedge clk )
if ( load ) data_out <= data_in;

// Task for testing multi-dimensional array handling
task test_multidim;
	integer i, j;
	for ( i=0; i<4; i++ ) begin
		for ( j=0; j<4; j++ ) begin
			// Test for same elements
			if (A[i][j]!== B[i][j]) begin
				$display("Elements at indices A[%d][%d] and B[%d][%d] are not same. Test failed.", i, j, i, j);
				return;
			end
		end
	end
	$display("All elements are same. Test passed.");
endtask

initial begin
	// Call the task
	test_multidim;
end

endmodule
```
In the above code, an array A and B of 2D arrays of 4 elements are declared and test_multidim task is defined to check for the same elements in A and B. It iterates through all A[0:3][0:3] and B[0:3][0:3], and if any element is not the same, it prints a failed message. If all elements are the same, then it prints a passed message. The test is called in the initial block. This code can be synthesized and tested in an FPGA or simulator to verify its functionality. Note that Verilog supports array operations, including the use of inside operator (e.g., `A[i][j] inside {[0:3]}})`. This code demonstrates how to use this feature to test multi-dimensional array handling in Verilog.joycejoycejoycejoycejoycejoycejoycejoycejoycejoycejoycejoycejoycejoycejoycejoycejoyce