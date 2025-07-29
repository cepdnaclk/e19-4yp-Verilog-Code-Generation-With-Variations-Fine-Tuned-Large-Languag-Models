input clk,
    input [7:0] data,
    input [7:0] data2,
    output out0,
    output wire out1,
    output wire out2,
    output [7:0] out3
    input [3:0] sel,
    input [3:0] sel2

wire_assign wl(clk[sel], out0);
wire_assign wl2(clk[sel2], out1);
wire_assign wl3(data[sel], out2);
wire_assign wl4(data2[sel2], out3);


// Create a module with one input and one output that behaves like a wire
module wire_assign( input clk, input data,  input data2, output out0, output out1, output out2, output [7:0] out3);
    // wire assignments
    // assign out to in
    assign out0 = clk;
    assign out1 = clk[sel];
    assign out2 = data[sel];
    assign out3 = data2[sel2];
endmodule
### Modified Testbench :
    // Set up clock
    initial begin
      clk = 0;