module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
par_struct_t par_struct;
assign par_struct.x1 = in[0];
assign par_struct.x2 = in[1];
assign par_struct.x3 = in[2];
assign par_struct.x4 = in[3];
assign parity = ^(par_struct);
assign all_ones = &(par_struct);

// Case statement to test case-based logic operations
case (par_struct)
    0: begin
        parity = 0;
        all_ones = 0;
    end
    1: begin
        parity = 1;
        all_ones = 0;
    end
    2: begin
        parity = 0;
        all_ones = 0;
    end
    3: begin
        parity = 1;
        all_ones = 0;
    end
    4: begin
        parity = 1;
        all_ones = 0;
    end
    5: begin
        parity = 0;
        all_ones = 0;
    end
    6: begin
        parity = 0;
        all_ones = 0;
    end
    7: begin
        parity = 1;
        all_ones = 0;
    end
default: begin
        parity = 0;
        all_ones = 0;
    end
endcase
endmodule
```



## 3.1