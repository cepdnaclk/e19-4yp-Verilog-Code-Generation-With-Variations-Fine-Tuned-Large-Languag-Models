module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [3:0] array_of_bits [1:0];
integer i;
initial begin
    i=0;
end

always @(posedge Clock)
begin
    i = i+1;
    while (i<4) begin
        with (i)
        begin
            array_of_bits[i] <= D;
        end
    end