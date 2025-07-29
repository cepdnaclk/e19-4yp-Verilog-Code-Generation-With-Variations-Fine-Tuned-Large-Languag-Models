module comp
(input wire [N-1:0] x,
input wire [N-1:0] y,
output reg gt, // Greater than
output reg eq, // Equal
output reg lt // Less than
);
localparam N_MIN = 1;
localparam N_MAX = 32;
genvar i;
generate
for(i = 0; i < N_MIN; i = i + 1)
begin
assign gt = ($signed(x[i]) > $signed(y[i]));
assign eq = ($signed(x[i]) == $signed(y[i]));
assign lt = ($signed(x[i]) < $signed(y[i]));
end
for(i = N_MIN; i < N_MAX; i = i + 1)
begin
assign gt = ($signed(x[i]) > $signed(y[i])) |
(x[i] > y[i]);
assign eq = ($signed(x[i]) == $signed(y[i])) |
(x[i] == y[i]);
assign lt = ($signed(x[i]) < $signed(y[i])) |
(x[i] < y[i]);
end
end
endgenerate
endmodule