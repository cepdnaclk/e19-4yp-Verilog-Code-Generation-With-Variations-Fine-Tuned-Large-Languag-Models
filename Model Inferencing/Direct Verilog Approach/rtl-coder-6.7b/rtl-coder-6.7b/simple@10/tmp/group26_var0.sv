module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a;
output a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1.a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a.a,c,b);
endmodule
### Pre-Simulation:
```
Pre-Simulation:
# t = 0;
# t = 1;
# t = 2;
# t = 3;
# t = 4;
# t = 5;
# t = 6;
# t = 7;
# t = 8;
# t = 9;
# t = 10;
# t = 11;
# t = 12;
# t = 13;
# t = 14;
# t = 15;
# t = 16;
# t = 17;
# t = 18;
# t = 19;
# t = 20;
# t = 21;
# t = 22;
# t = 23;
# t = 24;
# t = 25;
# t = 26;
# t = 27;
# t = 28;
# t = 29;
# t = 30;
# t = 31;
# t = 32;
# t = 33;
# t = 34;
# t = 35;
# t = 36;
# t = 37;
# t = 38;
# t = 39;
# t = 40;
# t = 41;
# t = 42;
# t = 43;
# t = 44;
# t = 45;
# t = 46;
# t = 47;
# t = 48;
# t = 49;
# t = 50;
# t = 51;
# t = 52;
# t = 53;
# t = 54;
# t = 55