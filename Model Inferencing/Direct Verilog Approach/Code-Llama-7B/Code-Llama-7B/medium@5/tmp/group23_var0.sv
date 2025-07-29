module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else begin
    while (Adr<16) begin
        ObusReg <= Storage[Adr];
        Adr <= Adr + 1;
    end
end
endmodule
### Simulation Setup

1. Compile it,
2. Open simulation,
3. Simulate it,
4. Verify that it works,
5. Repeat

<img src="https://raw.githubusercontent.com/EckoTan0804/upic-repo/master/uPic/20210221225254.png" alt="20210221225254" style="zoom:50%;" />

### 解析

这一节的目标是使得循环中的输入总线（`Ibus`）能够映射到循环中的存储单元。这一节的主要任务在于处理循环体的条件。

**我们可以用一个循环来做这个事情**

这里，我们在 `while` 循环的末尾重置输入总线，从而可以从存储器获取数据。

为了这样做，我们需要考虑当循环的条件变量为 True 时进入循环，以及当循环的条件变量变为 False 时退出循环。

在 Verilog HDL 中，我们可以用下面的语法来表示循环条件：

```verilog
while (<cond> == 1)
    <body>
```

为了正确地检查栅栏状态，循环必须在循环开始时进入，并在循环结束时退出。

我们这里不能使用 `if` 语句，因为那不会使我们得到想要的结果。因为，如果我们使用 `if` 语句，我们只能检查条件是否为真，但**不知道条件是否为真的时候进入**循环。

这里，我们使用 `while` 语句。在循环体内，我们检查条件，如果满足条件就进入循环。如果没有满足条件，循环将终止，循环退出。

为了退出循环，我们需要在循环体中更新 `Adr` 变量，在这里它增加 1。

```verilog
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else begin
    while (Adr<16) begin
        ObusReg <= Storage[Adr];
        Adr <= Adr + 1;
    end
end
```

### 更多信息

**更多信息**

1. 更多信息，请参阅 [while loop example](https://verilog.renerta.com/source/vrg00026.htm)。

2. 更多详细信息，请参阅 **[5.4.3.3.1