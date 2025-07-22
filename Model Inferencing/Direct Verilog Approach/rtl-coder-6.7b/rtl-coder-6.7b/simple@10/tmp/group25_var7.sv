module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule

### Results:
![image](https://user-images.githubusercontent.com/101461801/200813383-51332138-cfa9-4b30-b691-ec73331ab364.png)
![image](https://user-images.githubusercontent.com/101461801/200813391-e84f3e78-e943-4e6f-a9d2-7a0e06265c62.png)
![image](https://user-images.githubusercontent.com/101461801/200813398-46b57de0-7c20-41ad-a697-5e1c56c01a65.png)