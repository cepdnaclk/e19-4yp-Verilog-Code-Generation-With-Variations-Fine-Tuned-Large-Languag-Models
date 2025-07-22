module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
`inside`

always @(w0 or w1 or w2 or w3 or S)
    if (S == 2'b00)
        f = w0;
    else if (S == 2'b01)
        f = w1;
    else if (S == 2'b10)
        f = w2;
    else if (S == 2'b11)
        f = w3;
endmodule

### After Synthesis:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    if (S == 2'b00)
        f = w0;
    else if (S == 2'b01)
        f = w1;
    else if (S == 2'b10)
        f = w2;
    else if (S == 2'b11)
        f = w3;
endmodule

### After Mapping:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    if (S == 2'b00)
        f = w0;
    else if (S == 2'b01)
        f = w1;
    else if (S == 2'b10)
        f = w2;
    else if (S == 2'b11)
        f = w3;
endmodule

### After Simulation:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    if (S == 2'b00)
        f = w0;
    else if (S == 2'b01)
        f = w1;
    else if (S == 2'b10)
        f = w2;
    else if (S == 2'b11)
        f = w3;
endmodule

### After Pipelining:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    if (S == 2'b00)
        f = w0;
    else if (S == 2'b01)
        f = w1;
    else if (S == 2'b10)
        f = w2;
    else if (S == 2'b11)
        f = w3;
endmodule

### After Optimization:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Optimization II:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Synthesis:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Mapping:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Simulation:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Pipelining:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Optimization:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Optimization II:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Synthesis:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Mapping:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Simulation:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Pipelining:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Optimization:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Optimization II:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg f;
always @(w0 or w1 or w2 or w3 or S)
    f = w0;
endmodule

### After Synthesis:
module mux4to1(w0, w1, w2, w3, S, f);
input w0, w1, w2, w3;
input [1:0] S;
output f;
reg