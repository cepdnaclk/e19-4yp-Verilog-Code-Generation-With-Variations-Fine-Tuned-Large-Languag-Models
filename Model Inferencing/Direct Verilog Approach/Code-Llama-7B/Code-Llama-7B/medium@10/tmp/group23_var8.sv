module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
initial
    Storage <= '{8'b00000000, 8'b00000000};
assign #1 Obus = ObusReg;
endmodule
### Verilog Code to be Tested:
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
initial
    Storage <= '{8'b00000000, 8'b00000000};
assign #1 Obus = ObusReg;
endmodule
### Verilog Test Bench Code:
module RAM_TB ();
reg Adr;
reg Ibus;
reg Obus;
reg Clk;
reg Read;
wire Clk;
wire Read;
wire Ibus;
wire Obus;
reg[7:0] Storage[15:0];
RAM u1 (Obus, Ibus, Adr, Clk, Read);
initial
begin
    Adr = 0;
    Ibus = 0;
    Read = 1;
    Clk = 1;
    $monitor("%d %d", Obus, Adr);
end
always
begin
    #10 Clk =!Clk;
    $monitor("%d %d", Obus, Adr);
    if (Adr == 3)
        $finish;
end
endmodule
### Execution Results:
> Executed on DS-5 with Synopsys Design Compiler 2015 SP1, 2015-12-08

> Compilation date: Aug 16, 2016

> Execution results:
>
>     - Obus: 0 0
>     - Obus: 0 1
>     - Obus: 0 2
>     - Obus: 0 3
>     - Obus: 0 4
>     - Obus: 0 5
>     - Obus: 0 6
>     - Obus: 0 7
>     - Obus: 0 8
>     - Obus: 0 9
>     - Obus: 0 10
>     - Obus: 0 11
>     - Obus: 0 12
>     - Obus: 0 13
>     - Obus: 0 14
>     - Obus: 0 15
>     - Obus: 0 16
>     - Obus: 0 17
>     - Obus: 1 1
>     - Obus: 1 2
>     - Obus: 1