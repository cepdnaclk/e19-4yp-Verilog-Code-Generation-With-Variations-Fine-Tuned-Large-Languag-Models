module example7_4(D, Clock, Q1, Q2);
parameter WIDTH=4;
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
integer i;
wire [WIDTH-1:0] D_array;
assign D_array[0] = D;
always @(posedge Clock)
begin
    Q1 <= D;
    i <= 0;
    while(i < WIDTH) begin
        Q2 <= D_array[i];
        i = i + 1;
    end
end
endmodule