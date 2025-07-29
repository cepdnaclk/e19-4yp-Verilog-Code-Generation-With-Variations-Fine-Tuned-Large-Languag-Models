``` Verilog
/*... Figure 8.11... */
// Apply the operation to the data bus.
always @(posedge clk) begin
	if (start) begin
		opnd1 <= mem1[2];
		opnd2 <= mem2[2];
	end
end
// --- Placeholder blocks referenced by Figure numbers ---
// Apply the Multiply operation to the data bus.
generate
for ( indx = 0; indx < 3; indx = indx + 1 ) begin: inside_loop
	if ( indx inside {[0:1]}) begin: inside_generate
		always @(posedge clk) begin: inside_operation
			if (start) begin
				opnd1 <= mem1[indx];
				opnd2 <= mem2[indx];
			end
		end
	end
end
endgenerate
initial begin: Apply_Data_in_Generate_B1
	for (indx = 0; indx < 3; indx = indx + 1) begin: Apply_Data_in_Generate_A1
		mem1[indx] = 8'h01;
		mem2[indx] = 8'h02;
	end
end
initial begin: Apply_Data_in_Generate_B2
	for (indx = 0; indx < 3; indx = indx + 1) begin: Apply_Data_in_Generate_A2
		mem1[indx] = 8'h01;
		mem2[indx] = 8'h04;
	end
end
initial begin: Apply_Data_in_Generate_B3
	for (indx = 0; indx < 3; indx = indx + 1) begin: Apply_Data_in_Generate_A3
		mem1[indx] = 8'h01;
		mem2[indx] = 8'h08;
	end
end
/*... Figure 8.12... */
// Begin multiplier operation.
initial begin: Start_Operation_in_Generate_B1
	for (indx = 0; indx < 3; indx = indx + 1) begin: Start_Operation_in_Generate_A1
		@(posedge clk);
		start <= 1;
		@(posedge clk);
		start <= 0;
	end
end
initial begin: Start_Operation_in_Generate_B2
	for (indx = 0; indx < 3; indx = indx + 1) begin: Start_Operation_in_Generate_A2
		@(posedge clk);
		start <= 1;
		@(posedge clk);
		start <= 0;
	end
end
initial begin: Start_Operation_in_Generate_B3
	for (indx = 0; indx < 3; indx = indx + 1) begin: Start_Operation_in_Generate_A3
		@(posedge clk);
		start <= 1;
		@(posedge clk);
		start <= 0;
	end
end
/*... Figure 8.13... */
// Provide the expected result.
initial begin: Provide_Result_in_Generate_B1
	for (indx = 0; indx < 3; indx = indx + 1) begin: Provide_Result_in_Generate_A1
		@(posedge clk);
		expected_result <= 17'h00010002;
	end
end
initial begin: Provide_Result_in_Generate_B2
	for (indx = 0; indx < 3; indx = indx + 1) begin: Provide_Result_in_Generate_A2
		@(posedge clk);
		expected_result <= 17'h00010008;
	end
end
initial begin: Provide_Result_in_Generate_B3
	for (indx =