module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b[b.class_test()] <= a;
endmodule

// Original Code
module SchedTest;
reg [3:0] m[2:0];
reg [4:0] n;
for (i = 0; i < 2; i++) begin
    always @(m[i]) n <= m[i];
end
endmodule

// Variation Code
module SchedTest;
reg [3:0] m[2:0];
reg [4:0] n;
for (i = 0; i < 2; i++) begin
    always @(m[i]) n[m[i].class_test()] <= m[i];
end
endmodule

// Original Code
module SchedTest;
reg [3:0] m[2:0];
reg [4:0] n[2:0];
for (i = 0; i < 2; i++) begin
    always @(m[i]) n[i] <= m[i];
end
endmodule

// Variation Code
module SchedTest;
reg [3:0] m[2:0];
reg [4:0] n[2:0];
for (i = 0; i < 2; i++) begin
    always @(m[i]) n[i][m[i].class_test()] <= m[i];
end
endmodule

// Original Code
module SchedTest;
reg [3:0] m[2:0];
reg [4:0] n[2:0][1:0];
for (i = 0; i < 2; i++) begin
    always @(m[i]) n[i] <= m[i];
end
endmodule

// Variation Code
module SchedTest;
reg [3:0] m[2:0];
reg [4:0] n[2:0][1:0];
for (i = 0; i < 2; i++) begin
    always @(m[i]) n[i][m