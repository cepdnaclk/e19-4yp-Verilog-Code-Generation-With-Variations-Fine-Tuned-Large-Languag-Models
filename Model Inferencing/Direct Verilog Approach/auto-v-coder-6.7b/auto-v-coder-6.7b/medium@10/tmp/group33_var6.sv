```Verilog
module tst_CMOSsw1();
  reg [3:0] in; wire [3:0] out;
  reg [1:0] con;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=4'b0000; con=2'b11; end // Start enabled
  always #5 in =~{in[0],in[1],in[2],in[3]}; // Toggle data
  always #3 con=~{con[0],con[1]}; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
```
In this code, instead of using 1 bit data and 1 bit control signal, I used 4 bit data and 2 bit control signal.

Please note that for the CMOS switch to work properly, the control and data signals should be of the same size. If not, you may need to extend or truncate the signals to match the size of the switch. This code is a basic example of using a 4-bit data and 2-bit control input for a 4-bit control output. Modify according to your requirements.

Also, the CMOSsw1 module and its behavior is not defined in the above code, hence it is assumed to be available in the same Verilog file. If the module does not exist, you need to define it. In Verilog, you can use the CMOS switch in the following way:

```Verilog
module CMOSsw1(
    output wire [3:0] out,
    input wire [3:0] in,
    input wire [1:0] con
);

assign out = in[con];

endmodule
```
This module takes 4-bit input `in`, 2-bit control `con` and gives 4-bit output `out`. The output is assigned according to the control. For example, if `con` is `2'b00`, the output is `in[0]`; if `con` is `2'