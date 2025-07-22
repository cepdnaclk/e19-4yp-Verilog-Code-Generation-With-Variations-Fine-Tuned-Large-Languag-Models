This code will create 2-bit Johnson Counters, each with its own logic.
```Verilog
module Johnson_Counter_2bit (count, enable, clock, reset);
output [1: 0] count;
input enable;
input clock, reset;
reg [1: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1)
begin
    count[0] <= 1'b0;
    count[1] <= 1'b1;
end
else if (enable)
begin
    count[0] <= count[1];
    count[1] <= ~(count[1] ^ count[0]);
end
endmodule

module Johnson_Counter_4bit (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1)
begin
    count[0] <= 1'b0;
    count[1] <= 1'b1;
    count[2] <= 1'b1;
    count[3] <= 1'b0;
end
else if (enable)
begin
    count[0] <= count[1];
    count[1] <= count[2];
    count[2] <= count[3];
    count[3] <= ~(count[3] ^ count[2]);
end
endmodule

module t_Johnson_Counter ();
wire [3: 0] count_4bit;
wire [1: 0] count_2bit;
reg enable;
reg clock, reset;
Johnson_Counter_4bit M0 (count_4bit, enable, clock, reset);
Johnson_Counter_2bit M1 (count_2bit, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule
```
This will create two 4-bit and 2-bit Johnson counters, but their logic will be the same. The only difference is in the output size. To create more Johnson counters, just