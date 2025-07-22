```
module addern_param(carryin, X, Y, S, carryout);
parameter n = 16;
input carryin;
input [n-1:0] X, Y;
output [n-1:0] S;
output carryout;
reg [n-1:0] S;
reg [n:0] C;
reg carryout;
integer k;
always @(X or Y or carryin)
begin
    C[0] = carryin;
    for (k = 0; k <= n-1; k = k + 1)
    begin
        S[k] = X[k] ^ Y[k] ^ C[k];
        C[k+1] = (X[k] & Y[k]) | (C[k] & X[k]) | (C[k] & Y[k]);
    end
    carryout = C[n];
end
endmodule
```
### Testbench Source:
```
module addernt_param();
parameter n = 16;
reg carryin;
reg [n-1:0] X;
reg [n-1:0] Y;
reg [n-1:0] S;
wire carryout;
integer i;
initial
begin
    for (i = 0; i < 2; i = i + 1)
    begin
        X[i] = $urandom;
        Y[i] = $urandom;
    end
    carryin = 1'b1;
    while(1)
    begin
        #25
        S = X ^ Y ^ carryin;
        #25
        if (S!= X ^ Y ^ carryin)
            $fatal(1, "S (%b)!= expected (%b) at %b", S, X ^ Y ^ carryin, $time);
    end
end
endmodule
```%cat addern_param_tb.sv
from vunit import VUnit
from vunit.utils import quickfix
from vunit.compat import HDLSource

vunit.setup()
vhdl = HDLSource('''
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity addern is
    generic (
        n : positive := 16
    );
    port (
        carryin : in  STD_LOGIC;
        X       : in  STD_LOGIC_VECTOR(n-1 downto 0);
        Y       : in  STD