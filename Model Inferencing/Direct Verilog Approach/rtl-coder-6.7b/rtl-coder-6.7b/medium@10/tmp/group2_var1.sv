module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg [1:0] Q;
reg [3:0] Q2;
reg Q1, Q2;
wire [3:0] array;
assign array = {1'b1, 1'b1, 1'b1, 1'b1};
initial
begin
  $display("Beginning of Simulation");
end
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
end
always @(*)
begin
  int i;
  while (i < 4)
  begin
    i = i + 1;
    Q2 <= array[i];
  end
end
endmodule