always @(posedge clk or posedge rst)
begin
if (rst)
out = 0;
else
out = data[2:0] inside {0, 1, 2};
end