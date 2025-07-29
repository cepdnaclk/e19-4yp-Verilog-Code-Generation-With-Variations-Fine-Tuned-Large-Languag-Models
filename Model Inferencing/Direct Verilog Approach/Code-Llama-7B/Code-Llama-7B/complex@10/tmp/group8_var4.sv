module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
genvar i;
generate
for (i = 0; i < 4; i++) begin : Johnson_Counter
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
if (count[3: 0] === 4'b????)
count <= {count[2: 0], 1'b1};
else if (count[3: 0] === 4'b0000)
count <= {count[2: 0], 1'b0};
end
endgenerate
endmodule