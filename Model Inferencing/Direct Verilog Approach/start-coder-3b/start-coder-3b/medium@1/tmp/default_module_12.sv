#### a.
```
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity maj3 is
port (
a, b, c : in std_logic;
y         : out std_logic
);
end entity;
architecture beh of maj3 is
signal im1, im2, im3 : std_logic;
begin
and #(2, 4) (im1, a, b)
and #(2, 4) (im2, b, c)
and #(2, 4) (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
end architecture;
```
#### b.
```
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity maj3 is
port (
a, b, c : in std_logic;
y         : out std_logic
);
end entity;
architecture beh of maj3 is
signal im1, im2, im3, imx : std_logic;
begin
and #(2, 4) (im1, a, b)
and #(2, 4) (im2, b, c)
and #(2, 4) (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
end architecture;
```

# 3rd Year

## 1. C to Verilog

### Base C Code:
int main(int argc, char *argv[])
{
    int a = 2;
    int b = 0;
    int c = 0;
    int y, im1, im2, im3;
    for (int i = 0; i < 3; i++)