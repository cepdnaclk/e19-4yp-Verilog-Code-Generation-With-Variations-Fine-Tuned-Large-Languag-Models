module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: count <= {count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b0};
//default: count <= 0;
endcase
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
generate
genvar i;
for (i = 0; i <= 3; i = i + 1) begin
always_comb begin
if (1'b1)
if (enable && (count == 4'b0000 + i)) count <= 4'b0001 + i;
end
end
end
endgenerate
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish; initial begin clock = 0; forever #5 clock = ~clock; end initial fork join endmodule ## Question 2: Question: How does the time of simulation depend on the number of modules, and, how does it depend on the number of statements in each module? You should have a table that describes this dependence. ### Answer: The number of statements in each module is independent of the number of modules. (The number of modules on the top-level module does not affect the number of statements.) The total number of statements is more than the number of modules on the top-level module, and the average time spent on each module is also more than the average time spent on the top-level module. ## Question 3: Question: How does the time of simulation depend on the number of input and output ports on each module? You should have a table that describes this dependence. ### Answer: As the number of input and output ports on each module increases, the average time spent on each module declines. ## Question 4: Question: How does the time of simulation depend on the number of always blocks used in each module? You should have a table that describes this dependence. ### Answer: As the number of always blocks used in each module increases, the average time spent on each module declines because each always block takes more time to be simulated. ## Question 5: Question: How does the time of simulation depend on the number of instances of each module used in the design? You should have a table that describes this dependence. ### Answer: As the number of instances of each module used in the design increases, the average time spent on each module declines because each module instance takes more