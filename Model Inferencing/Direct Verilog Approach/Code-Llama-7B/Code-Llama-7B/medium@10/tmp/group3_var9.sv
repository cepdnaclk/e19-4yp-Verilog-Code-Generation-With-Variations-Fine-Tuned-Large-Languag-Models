```verilog
module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    reg [7:0] fa0_data;
    reg [7:0] fa1_data;
    reg [7:0] fa2_data;
    reg [7:0] fa3_data;
    always @ * begin
        fa1_data = fa0.out[1:0];
    end
    always @ * begin
        fa2_data = fa1.out[1:0];
    end
    always @ * begin
        fa3_data = fa2.out[1:0];
    end
    always @ * begin
        fa0_data = fa3.out[1:0];
    end
    assign fa0.in = fa0_data;
    assign fa1.in = fa1_data;
    assign fa2.in = fa2_data;
    assign fa3.in = fa3_data;
endmodule
```
### Result:
![ripple_add](./images/ripple_add.png)

### Combination of Variations:
module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    reg [7:0] fa0_data;
    reg [7:0] fa1_data;
    reg [7:0] fa2_data;
    reg [7:0] fa3_data;
    always @ * begin
        fa1_data = fa0.out[3:0];
    end
    always @ * begin
        fa2_data = fa1.out[2:0];
    end
    always @ * begin
        fa3_data = fa2.out[1:0];
    end
    always @ * begin
        fa0_data = fa3.out[1:0];
    end
    assign fa0.in = fa0_data;
    assign fa1.in = fa1_data;
    assign fa2.in = fa2_data;
    assign fa3.in = fa3_data;
endmodule

![ripple_add](./images/ripple_add_p6.png)

### Combination of Variations:
module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    reg [7:0] fa0_data;
    reg [7:0] fa1_data;
    reg [7:0] fa2_data;
    reg [7:0] fa3_data;
    always @ * begin
        fa1_data = fa0.out[7:4];
    end
    always @ * begin
        fa2_data = fa1.out[7:4];
    end
    always @ * begin
        fa3_data = fa2.out[7:4];
    end
    always @ * begin
        fa0_data = fa3.out[7:4];
    end
    assign fa0.in = fa0_data;
    assign fa1.in = fa1_data;
    assign fa2.in = fa2_data;
    assign fa3.in = fa3_data;
endmodule

![ripple_add](./images/ripple_add_p7.png)

### Combination of Variations:
module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    reg [7:0] fa0_data;
    reg [7:0] fa1_data;
    reg [7:0] fa2_data;
    reg [7:0] fa3_data;
    always @ * begin
        fa1_data = fa0.out[7:4] & fa0.out[3:0];
    end
    always @ * begin
        fa2_data = fa1.out[7:4] & fa1.out[3:0];
    end
    always @ * begin
        fa3_data = fa2.out[7:4