module testbench ();
struct struct_random {
    rand bit [3:0] data;
};
bit [3:0] data;
initial begin
    data = 4'b0;
end
struct_random rand_data;
initial begin
    rand_data = '{data: data};
    initial begin
        repeat (50) begin
            @ (posedge clk);
            # 10;
            $display ("Rand Data: %b",rand_data.data);
        end
        $finish;
    end
end
endmodule
### Pass Criteria:
Error free.
### Comments:
This test has been verified on Altera Quartus II and Xilinx ISE 14.5.