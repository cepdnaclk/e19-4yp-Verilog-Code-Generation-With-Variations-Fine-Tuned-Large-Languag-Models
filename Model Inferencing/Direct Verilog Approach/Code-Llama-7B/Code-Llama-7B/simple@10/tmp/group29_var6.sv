module SchedDelayA;
reg A[0:3];
initial
begin
end
always @(A[0]) A[1] = A[0];
always @(A[1]) A[2] = A[1];
always