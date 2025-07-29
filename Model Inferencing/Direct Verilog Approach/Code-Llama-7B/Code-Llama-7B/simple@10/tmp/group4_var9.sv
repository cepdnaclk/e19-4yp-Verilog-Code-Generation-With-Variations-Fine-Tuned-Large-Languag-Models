module testbench ();
struct {
	rand logic [7:0] data;
} data_t;
data_t dut;
initial begin
	$dumpfile("test.vcd");
	$dumpvars(0, testbench);