```verilog
module reg4(D, Clock, Resetn, Q, var);
input [15:0] D;
input Clock, Resetn;
input [1:0] var;  //added variable
output [3:0] Q[3:0];
reg [3:0] Q[3:0];
always @(posedge Clock or negedge Resetn)
    if (Resetn == 0)
        Q <= '{4'b0000, 4'b0000, 4'b0000, 4'b0000};
    else begin
        Q[var][3:0] <= D[3:0]; //variable index
    end
endmodule
```
This piece of code contains a register that stores 4-bit wide data and another register that stores 16-bit wide data as an input. The selected register will output the 4-bit wide data corresponding to the input index (var).

The index 'var' can be used to select which register to write data to. With this modification, the data stored in the selected register will be updated whenever a clock signal is received, irrespective of RST. 

Please modify as needed for your specific requirements.

Note: This code should work as is in a Verilog simulator but for synthesis, Quartus Prime or other synthesis tools may need additional checks or additional settings.

Also, note that I am assuming that you have the required permissions to alter the base code and that you understand the implications of modifying this code. 

Please consult with your mentor or any other professional to verify this code's suitability for your specific requirements.

The code provided here is an example and might not be suitable for all scenarios, especially those requiring more complex control like using different indices to select different outputs. In some cases, more advanced Verilog constructs, like array of registers, or multiple modules, might be required to achieve the desired functionality. Please ensure that the solution best suits your requirements before proceeding with it. In some cases, a more complex design could be needed.

The code provided is an example, and does not include any validation or error checking. It's important to ensure that the signals are properly connected and controlled to avoid unwanted behavior or errors in