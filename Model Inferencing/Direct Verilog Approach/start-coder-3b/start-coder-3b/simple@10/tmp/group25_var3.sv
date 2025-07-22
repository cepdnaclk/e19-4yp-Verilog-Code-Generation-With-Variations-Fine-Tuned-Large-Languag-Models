import enum
class Strength(enum.Enum):
S0  = 0
S1  = 1
Z   = 2
def __and__(self, other: Strength):
if self == Strength.S1:
return Strength.S1
if other == Strength.S1:
return Strength.S1
return Strength.S0
def __xor__(self, other: Strength):
if self == Strength.S0:
return other
if other == Strength.S0:
return self
return Strength.Z
### Enum Tests:
assert Strength.S0 & Strength.S0 == Strength.S0
assert Strength.S1 & Strength.S1 == Strength.S1
assert Strength.Z ^ Strength.S1 == Strength.S0
assert Strength.S1 ^ Strength.S1 == Strength.Z

The output is as expected.

### Base Verilog Code:
module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c