// Create a module with three inputs and one output that behaves like a MUX
// Add select signal to output
module mux( input [2:0] sel, input [3:0] in[3], output out );
    // use if-else statements to determine what input to route to output
    // if sel[0] == 1
    //   if sel[1] == 1
    //     if sel[2] == 1
    //       out = in[2]
    //     else
    //       out = in[1]
    //   else
    //     out = in[0]
    // else
    //   if sel[1] == 1
    //     out = in[1]
    //   else
    //     out = in[0]
endmodule

### Simulation Results:
![result](https://github.com/AlejandroRuizr/Digital-Logic/blob/main/src/lab-05