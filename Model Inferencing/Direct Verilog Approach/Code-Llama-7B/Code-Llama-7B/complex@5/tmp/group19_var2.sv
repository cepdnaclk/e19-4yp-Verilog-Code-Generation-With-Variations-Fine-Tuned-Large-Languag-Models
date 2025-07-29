```
interface interface_data;
    logic [7:0] data[7:0];
endinterface

module top(output logic [7:0] data[7:0]);
    interface_data interface_data1;

    genvar i;
    for (i = 0; i < 8; i = i + 1) begin: block_gen
        addern #(.n(8)) addern_inst(
           .carryin(1'b0),
           .X(interface_data1.data[i]),
           .Y(interface_data1.data[i]),
           .S(data[i]),
           .carryout()
        );
    end

    initial begin
        interface_data1.data[7] = 8'b0011_1000;
        interface_data1.data[6] = 8'b0011_1000;
        interface_data1.data[5] = 8'b0011_1000;
        interface_data1.data[4] = 8'b0011_1000;
        interface_data1.data[3] = 8'b0011_1000;
        interface_data1.data[2] = 8'b0011_1000;
        interface_data1.data[1] = 8'b0011_1000;
        interface_data1.data[0] = 8'b0011_1000;
    end

    initial #1 $finish;
endmodule
```
### Result:
```
ghdl -a top.vhdl  --std=08
ghdl -a interface_data.vhdl
ghdl -e top
ghdl -r top --vcd=top.v