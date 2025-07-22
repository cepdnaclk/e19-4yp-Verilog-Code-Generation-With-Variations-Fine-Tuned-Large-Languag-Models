module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
generate
if (0) begin
always @ (posedge clock, posedge reset) begin
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
end
end
endgenerate
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule
### Result:
#### Variation: `inside`
```scala
variations(
    V(
      S(
        S("1",
          S("count",
            V(
              V("inside", Arrays.of(N(4), N(0), N(1), N(0), N(0), N(1), N(1), N(1), N(1))))))),
      V(
        V("S",
          S("2",
            S("3",
              S("count",
                V(
                  V("inside", Arrays.of(N(4), N(0), N(1), N(0), N(0), N(1), N(1), N(1), N(1))))))),
        S("4",
          S("count",
            V(V("inside", Arrays.of(N(4), N(0), N(1), N(0),