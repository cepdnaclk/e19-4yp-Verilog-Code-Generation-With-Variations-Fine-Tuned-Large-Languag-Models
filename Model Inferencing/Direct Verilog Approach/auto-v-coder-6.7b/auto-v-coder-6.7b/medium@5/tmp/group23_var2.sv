```Verilog
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
integer i;
initial begin
    i = 0;
    while(i<16) begin
        Storage[i] <= 0;
        i = i + 1;
    end
end
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
endmodule
```

In this modification, storage array is automatically initialized by 0 using an initial block within the module, it helps to avoid any unknown values. The while loop is used to initialize the whole array with 0. The constant `16` is used because the array size is `16`. If the size of array changes, you should change the value `16` as per the new array size. The `i` variable is used to increment from `0` to `15`.
The `initial` block ensures that the initialization happens only once during simulation, not every time the code is executed inside the always block. 

Please note that initialization of registers in Verilog is not a recommended practice as it can potentially cause timing issues. It's important to avoid this if possible and initialize signals/registers with known values or in a separate process that runs before the main logic. In real hardware, initialization is typically done by the hardware/firmware design. However, it's helpful for simulation and verification.

Also, the `always` block is not required if `Storage[Adr]` is never modified. In this case, the assignment to `Storage[Adr]` should be moved to the initial block.

This code has no timing guarantees, as it does not follow any established coding standards. It's primarily intended for educational purposes. For a real system, initialization of signals/registers should be handled by the hardware/firmware design, not in the Verilog/SystemVerilog code.

Also, this code should be used in synthesis only as it might not work