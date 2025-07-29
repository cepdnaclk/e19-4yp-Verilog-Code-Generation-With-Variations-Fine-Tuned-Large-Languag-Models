```verilog
// --- Apply Data... ---
initial begin: Apply_Data
	$display("Testing for 3 operands:");
	for (indx=0; indx<3; indx=indx+1) begin
		$display("Operand %d:", indx+1);
		multiplier_result = 0;
		for (multiplier_result=0; multiplier_result<256; multiplier_result=multiplier_result + 1) begin
			im_data = multiplier_result;
			if (inside(multiplier_result, mem1)) begin
				opnd1 = multiplier_result;
				$display(" %d", multiplier_result);
			end
			if (inside(multiplier_result, mem2)) begin
				opnd2 = multiplier_result;
				$display(" %d", multiplier_result);
			end
			#1 start = 1;
			#1 start = 0;
		end
		$display("");
	end
end
```
### Example Output:
![Multiplier Variation