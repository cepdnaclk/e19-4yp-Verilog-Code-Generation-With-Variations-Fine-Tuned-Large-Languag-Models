module latch (input d, c, output reg [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Commands:
vlog vlog.v
vsim -gfileName=test_file.txt test
### Expected Test Output:
### Commands:
vlog vlog.v
vsim -gfileName=test_file.txt tb_test
### Expected Test Output:
### Commands:
vlog vlog.v
vsim -gfileName=test_file.txt tb_test
### Expected Test Output: