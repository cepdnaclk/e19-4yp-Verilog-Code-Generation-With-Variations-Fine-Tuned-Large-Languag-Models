module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
wire [3:0] Count_n;
always @(posedge Clk) begin
    if(Reset) Count_n = 0;
    else Count_n = Count + 1;
end

initial begin
    Count = {0, 0, 0, 0};
end

assign Count = Count_n;
endmodule

### Simulation Result:
```
vcd_startup();
vcd_dumpfile("Chap1Counter.vcd");
vcd_dumpvars(0,Chap1Counter);
#1000;
$finish;
```

/Chap6/README.md
# Chap6 
## 1. Module Instances
It has 7 modules:
+ Chap1Counter
+ Chap2Counter
+ Chap3Counter
+ Chap4AndGate
+ Chap5OrGate
+ Chap6NandGate
+ Chap7NorGate

### 1.1. Chap1Counter
![Chap1Counter](./Chap1Counter.png)

### 1.2. Chap2Counter
![Chap2Counter](./Chap2Counter.png)

### 1.3. Chap3Counter
![Chap3Counter](./Chap3Counter.png)

### 1.4. Chap4AndGate
![Chap4AndGate](./Chap4AndGate.png)

### 1.5. Chap5OrGate
![Chap5OrGate](./Chap5OrGate.png)

### 1.6. Chap6NandGate
![Chap6NandGate](./Chap6NandGate.png)

### 1.7. Chap7NorGate
![Chap7NorGate](./Chap7NorGate.png)

## 2. Instantiation
### 2.1. VHDL code for Chap2Counter
```vhdl=
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Chap2Counter is
    generic (
        N_BIT : integer := 4
        );
    port (
        Clk : in std_logic;
        Reset : in std_logic;
        Count : out std_logic_vector(N_BIT - 1 downto 0)
        );

end Chap2Counter;

architecture Behav of Chap2Counter is

begin

    process (Clk)
    begin
        if rising_edge(Clk) then
            Count <= (others => '0');
            if Reset = '1' then
                Count <= (others => '0');
            else
                Count <= Count+1;
            end if;
        end if;
    end process;

end Behav;
```
### 2.2. VHDL code for Chap3Counter
```vhdl=
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Chap3Counter is
    generic (
        N_BIT : integer := 4
        );
    port (
        Clk : in std_logic;
        Reset : in std_logic;
        Count : out std_logic_vector(N_BIT - 1 downto 0)
        );

end Chap3Counter;

architecture Behav of Chap3Counter is

signal Count_n : std_logic_vector(N_BIT - 1 downto 0);

begin

    process (Clk)
    begin
        if rising_edge(Clk) then
            if Reset = '1' then
                Count_n <= (others => '0');
            else
                Count_n <= Count+1;
            end if;
        end if;
    end process;
    
    assign Count = Count_n;

end Behav;
```
### 2.3. VHDL code for Chap4AndGate
```vhdl=
library ieee;
use ieee.std_logic_1164.all;

entity Chap4AndGate is
    port (
        A : in std_logic;
        B : in std_logic;
        Y : out std_logic
        );

end Chap4AndGate;

architecture Behav of Chap4AndGate is

begin

    Y <= A and B;

end Behav;
```
### 2.4. VHDL code for Chap5OrGate
```vhdl=
library ieee;
use ieee.std_logic_1164.all;

entity Chap5OrGate is
    port (
        A : in std_logic;
        B : in std_logic;
        Y : out std_logic
        );

end Chap5OrGate;

architecture Behav of Chap5OrGate is

begin

    Y <= A or B;

end Behav;
```
### 2.5. VHDL code for Chap6NandGate
```vhdl=
library ieee;
use ieee.std_logic_1164.all;

entity Chap6NandGate is
    port (
        A : in std_logic;
        B : in std_logic;
        Y : out std_logic
        );

end Chap6NandGate;

architecture Behav of Chap6NandGate is

begin

    Y <= not (A and B);

end Behav;
```
### 2.6. VHDL code for Chap7NorGate
```vhdl=
library ieee;
use ieee.std_logic_1164.all;

entity Chap7NorGate is
    port (
        A : in std_logic;
        B : in std_logic;
        Y : out std_logic
        );

end Chap7NorGate;

architecture Behav of Chap7NorGate is

begin

    Y <= not (A or B);

end Behav;
```
## 3. Simulation
### 3.1. Simulation Result for Chap2Counter
```
vcd_startup();
vcd_dumpfile("Chap2Counter.vcd");
vcd_dumpvars(0,Chap2Counter);
#1000;
$finish;
```
#### 3.1.1. Simulation Result of Chap2Counter
![Chap2Counter](./Chap2Counter_Simulation.png)
### 3.2. Simulation Result for Chap3Counter
```
vcd_startup();
vcd_dumpfile("Chap3Counter.vcd");
vcd_dumpvars(0,Chap3Counter);
#1000;
$finish;
```
#### 3.2.1. Simulation Result of Chap3Counter
![Chap3Counter](./Chap3Counter_Simulation.png)
### 3.3. Simulation Result for Chap4AndGate
```
vcd_startup();
vcd_dumpfile("Chap4AndGate.vcd");
vcd_dumpvars(0,Chap4AndGate);
#1000;
$finish;
```
#### 3.3.1. Simulation Result of Chap4AndGate
![Chap4AndGate](./Chap4AndGate_Simulation.png)
### 3.4. Simulation Result for Chap5OrGate
```
vcd_startup();
vcd_dumpfile("Chap5OrGate.vcd");
vcd_dumpvars(0,Chap5OrGate);
#1000;
$finish;
```
#### 3.4.1. Simulation Result of Chap5OrGate
![Chap5OrGate](./Chap5OrGate_Simulation.png)
### 3.5. Simulation Result