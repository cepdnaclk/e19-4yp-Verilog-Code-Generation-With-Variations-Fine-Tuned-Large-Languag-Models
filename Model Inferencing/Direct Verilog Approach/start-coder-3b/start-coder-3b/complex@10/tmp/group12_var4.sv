module dffalter_tst();
reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT
package dffalter_package;
// Dont use packed array for slice validation with testbench, use array
reg[3:0] di_array = 4'd0;
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di_array[0]=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 di_array[0] =~di_array[0]; // Toggle data
always #16 pr=1'b1; // Assert preset
always @(posedge pr) begin
// Di array index increment
if (di_array[3] == 1'b1) di_array[3] = 1'b0;
else di_array[3] =~ di_array[3];
// Di array index decrement
if (di_array[0] == 1'b1) di_array[0] = 1'b0;
else di_array[0] =~ di_array[0];
end
always #20 pr =1'b0; // Deassert preset
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);
initial #46 $stop; // Stop simulation
endmodule

## 7.3.1.3.2.4. Modifying an Unused Port in a Behavioral Model¶

### Base Verilog Code:
module dffalter_tst();
reg di,clk,clr,pr;
wire q, qb;
dffalter dff(q,qb,di,clk,clr,pr);
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0;
end
always
begin
clr=1'b0;
end
always # 4 di =~di;
always #16 pr=1'b1;
always #20 pr =1'b0;
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ",$time,clk,clr,pr,di,q);
initial #46 $stop; endmodule ### Variation Instruction: Replace the dffalter module instantiation in the testbench with a module instantiation of a behavioral model of the dffalter module. The behavioral model should have a wire named di that is driven by another wire which is controlled by the clk signal. The behavioral model should also have a wire clk_out that is driven by a clk input. Insert the $monitor $display statement and the $stop statement before the end of the testbench. ### Modified Code: module dffalter_tst(); reg di,clk,clk_out,clr,pr; wire q, qb; initial begin clr=1'b1;pr=1'b0;clk_out=1'b0;clk=1'b0,di=1'b0; end always begin clr=1'b0; end always # 4 di =~di; always #16 pr=1'b1; always #20 pr =1'b0; initial$monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ",$time,clk,clr,pr,di,q); initial #46 $stop;
endmodule

module dffalter_bmodel();
input clk;
wire clk_out;
wire [3:0] di;
reg [0:0] clr;
reg [0:0] pr;
reg [0:0] di_state;
reg [0:0] pr_state;
reg [0:0] di_out;
always @(posedge clk) begin
di_state[0] =~ di_state[0]; // Toggle data
di_out = di_state[0];
clr = 1'b1;
end
always @* begin
clr = 1'b0; // Deassert clear
end
always @(posedge pr) begin
pr_state[0] =~ pr_state[0]; // Toggle preset
end
always @* begin
pr_state = 1'b0; // Deassert preset
end
assign clk_out = clk;
assign di = di_out;
endmodule

## 7.3.1.3.2.5. Modifying an Unused Port in a Behavioral Model with a Single Clock¶

### Base Verilog Code:
module dffalter_tst();
reg di,clk,clr,pr;
wire q, qb;
dffalter dff(q,qb,di,clk,clr,pr);
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0;
end
always
begin
clr=1'b0;
end
always # 4 di =~di;
always #16 pr=1'b1;
always #20 pr =1'b0;
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ",$time,clk,clr,pr,di,q);
initial #46 $stop; endmodule ### Variation Instruction: Replace the dffalter module instantiation in the testbench with a module instantiation of a behavioral model that uses a single clock signal. The behavioral model should have a wire named di that is driven by another wire which is controlled by the clk signal. The behavioral model should also have a wire clk_out that is driven by a clk input. Insert the $monitor $display statement and the $stop statement before the end of the testbench. ### Modified Code: module dffalter_tst(); reg di,clk,clk_out,clr,pr; wire q, qb; initial begin clr=1'b1;pr=1'b0;clk_out=1'b0;clk=1'b0,di=1'b0; end always begin clr=1'b0; end always # 4 di =~di; always #16 pr=1'b1; always #20 pr =1'b0; initial$monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ",$time,clk,clr,pr,di,q); initial #46$stop;
endmodule

module dffalter_bmodel();
input clk;
wire clk_out;
wire [3:0] di;
reg [0:0] clr;
reg [0:0] pr;
reg [0:0] di_state;
reg [0:0] pr_state;
reg [0:0] di_out;
always @(posedge clk) begin
di_state[0] =~ di_state[0]; // Toggle data
di_out = di_state[0];
clr = 1'b1;
end
assign clk_out = clk;
assign di = di_out;
endmodule

## 7.3.1.3.2.6. Modifying a Port in a Behavioral Model¶

### Base Verilog Code:
module dffalter_tst();
reg di,clk,clr,pr;
wire q, qb;
dffalter dff(q,qb,di,clk,clr,pr);
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0;
end
always
begin
clr=1'b0;
end
always # 4 di =~di;
always #16 pr=1'b1;
always #20 pr =1'b0;
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ",$time,clk,clr,pr,di,q);
initial #46 $stop; endmodule ### Variation Instruction: Replace the dffalter module instantiation in the testbench with a module instantiation of a behavioral model that uses a single clock signal. The behavioral model should have a wire named di that is driven by another wire which is controlled by the clk signal. The behavioral model should also have a wire clk_out that is driven by a clk input. The behavioral model should also have a wire pr_out that is driven by another wire which is controlled by the pr signal. Insert the $monitor $display statement and the $stop statement before the end of the testbench. ### Modified Code: module dffalter_tst(); reg di