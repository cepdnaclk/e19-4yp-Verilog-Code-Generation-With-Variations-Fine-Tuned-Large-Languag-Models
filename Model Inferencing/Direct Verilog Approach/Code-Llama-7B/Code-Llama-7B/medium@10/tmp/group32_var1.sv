module mux2(out,data,sel);
input [1:0] data;
input [0:1] sel;
output out;
initial begin : init_mux
 out = data[sel] == 1'b0;
end
always @(sel) begin : mux
 out = data[sel] == 1'b0;
end
endmodule
### Task:
Modify the following Verilog code by inserting an always block that assigns the output of this module (out) to 
the input array (data) based on the current value of the control (sel). The "data[sel]" must be the LHS of
the assignment. Also change the "data[sel