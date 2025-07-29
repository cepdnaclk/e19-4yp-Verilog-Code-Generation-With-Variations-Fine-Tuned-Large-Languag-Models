module Johnson_Counter_Mod (count, enable, clock, reset);
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
default: count <= 0;
endcase
endmodule
module t_Johnson_Counter_Mod ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter_Mod M0 (count, enable, clock, reset);
wire [3: 0] counter_array [0: 15];
initial begin
counter_array[0] = 0;
counter_array[1] = 1;
counter_array[2] = 2;
counter_array[3] = 3;
counter_array[4] = 4;
counter_array[5] = 5;
counter_array[6] = 6;
counter_array[7] = 7;
counter_array[8] = 8;
counter_array[9] = 9;
counter_array[10] = 10;
counter_array[11] = 11;
counter_array[12] = 12;
counter_array[13] = 13;
counter_array[14] = 14;
counter_array[15] = 15;

end
always @ (posedge clock, posedge reset)
if (reset == 1) begin
enable = 0;
counter_array[0] = 0;
counter_array[1] = 1;
counter_array[2] = 2;
counter_array[3] = 3;
counter_array[4] = 4;
counter_array[5] = 5;
counter_array[6] = 6;
counter_array[7] = 7;
counter_array[8] = 8;
counter_array[9] = 9;
counter_array[10] = 10;
counter_array[11] = 11;
counter_array[12] = 12;
counter_array[13] = 13;
counter_array[14] = 14;
counter_array[15] = 15;

end
generate
for(i = 0; i < 16; i = i + 1)
begin: Johnson_Counter_Mod_i
Johnson_Counter_Mod M0 (count, enable, clock, reset);
assign counter_array[i] = count;
end
endgenerate
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork