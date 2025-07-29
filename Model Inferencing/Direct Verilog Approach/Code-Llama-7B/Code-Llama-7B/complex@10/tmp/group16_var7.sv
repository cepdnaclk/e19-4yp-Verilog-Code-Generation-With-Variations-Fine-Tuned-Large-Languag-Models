```
module TOP1(
input logic CLK,
input logic RST_X,
output logic signed [31:0] Y[4]
);

import package::*;

logic signed [31:0] x, y;

always_ff @(posedge CLK)
begin
    if (RST_X == 0) begin
        for (int i = 0; i < 4; i = i + 1) Y[i] = x;
        x = 0;
    end
    else begin
        x = x + 1;
        for (int i = 0; i < 4; i = i + 1) Y[i] = x;
    end
end

comparator comp1(
.x(x),
.y(y)
);

always_comb
begin
    if (y inside {ARRAY}) begin
        Y[0] = 1;
    end
    else begin
        Y[0] = 0;
    end
    if (y inside {ARRAY}) begin
        Y[1] = y;
    end
    else begin
        Y[1] = y;
    end
    if (y inside {ARRAY}) begin
        Y[2] = y;
    end
    else begin
        Y[2] = y;
    end
    if (y inside {ARRAY}) begin
        Y[3] = y;
    end
    else begin
        Y[3] = y;
    end
end
endmodule
```