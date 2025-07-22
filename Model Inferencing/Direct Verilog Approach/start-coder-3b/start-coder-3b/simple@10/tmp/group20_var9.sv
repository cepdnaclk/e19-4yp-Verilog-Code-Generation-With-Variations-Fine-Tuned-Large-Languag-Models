module latch (input d, c, output union {
packed reg [7:0] q, q_b;
}
q_out );
always begin
wait ( c );
end
endmodule
### Testbench:
#include <systemc.h>
SC_MODULE(test) {
// Inputs
sc_in <bool> d, c;
// Outputs
sc_out <unsigned int> q_out;
// SystemC process
SC_CTOR(test) {
SC_THREAD(test_proc);
}
void test_proc() {

while(1)
{
q_out.write(0);
wait();
}
// Test-Case 1
q_out.write(1);
q_out.write(2);
wait();
q_out.write(3);
wait();
q_out.write(4);
wait();
q_out.write(5);
wait();
q_out.write(6);
wait();
q_out.write(7);
wait();
q_out.write(8);
wait();
q_out.write(9);
wait();
q_out.write(10);
wait();
q_out.write(11);
wait();
q_out.write(12);
wait();
q_out.write(13);
wait();
q_out.write(14);
wait();
q_out.write(15);
wait();
q_out.write(16);
wait();
q_out.write(17);
wait();
q_out.write(18);
wait();
q_out.write(19);
wait();
q_out.write(20);
wait();
q_out.write(21);
wait();
q_out.write(22);
wait();
q_out.write(23);
wait();
q_out.write(24);
wait();
q_out.write(25);
wait();
q_out.write(26);
wait();
q_out.write(27);
wait();
q_out.write(28);
wait();
q_out.write(29);
wait();
q_out.write(30);
wait();
q_out.write(31);
wait();
q_out.write(32);
wait();
q_out.write(33);
wait();
q_out.write(34);
wait();
q_out.write(35);
wait();
q_out.write(36);
wait();
q_out.write(37);
wait();
q_out.write(38);
wait();
q_out.write(39);
wait();
q_out.write(40);
wait();
q_out.write(41);
wait();
q_out.write(42);
wait();
q_out.write(43);
wait();
q_out.write(44);
wait();
q_out.write(45);
wait();
q_out.write(46);
wait();
q_out.write(47);
wait();
q_out.write(48);
wait();
q_out.write(49);
wait();
q_out.write(50);
wait();
q_out.write(51);
wait();
q_out.write(52);
wait();
q_out.write(53);
wait();
q_out.write(54);
wait();
q_out.write(55);
wait();
q_out.write(56);
wait();
q_out.write(57);
wait();
q_out.write(58);
wait();
q_out.write(59);
wait();
q_out.write(60);
wait();
q_out.write(61);
wait();
q_out.write(62);
wait();
q_out.write(63);
wait();
// Test-Case 2
q_out.write(0);
q_out.write(0);
q_out.write(0);
q_out.write(0);
wait();
q_out.write(0);
q_out.write(0);
q_out.write(0);
wait();
q_out.write(0);
q_out.write(0);
q_out.write(0);
wait();
q_out.write(0);
q_out.write(0);
q_out.write(0);
wait();
q_out.write(0);
q_out.write(0);
q_out.write(0);
wait();
q_out.write(0);
wait();
q_out.write(0);
q_out.write(0);
q_out.write(0);
wait();
q_out.write(0);
q_out.write(0);
q_out.write(0);
wait();
}
}
SC_CTOR(test) {
SC_THREAD(test_proc2);
}
void test_proc2() {
q_out.write(0);
wait();
}
void test_proc3() {
q_out.write(0);
wait();
}
void test_proc4() {
q_out.write(0);
wait();
}
};
int sc_main(int argc, char *argv[]) {
test tb("tb");
tb.d(d_in);
tb.c(c_in);
tb.q_out(q_out);
sc_start(SC_ZERO_TIME);
return 0;
}

I used SystemC 2.3.1, and the compiler is "C:\Program Files\Synopsys\HDL Tools\vHDL\2014.1.0.0\bin\vcom.exe"

When I run the testbench using vsim, I get the following error.

Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out must be an array
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out cannot be output, it is not writable
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out must be an array
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out cannot be output, it is not writable
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out must be an array
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out cannot be output, it is not writable
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out must be an array
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out cannot be output, it is not writable
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out must be an array
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out cannot be output, it is not writable
Error (1005): VerilogNet: vcom: file C:\Users\hitesh\Desktop\Testbench\testbench/test.v: (23, 23): variable q_out must be an array
Error (1005): VerilogNet: vcom: file C:\Users\hitesh