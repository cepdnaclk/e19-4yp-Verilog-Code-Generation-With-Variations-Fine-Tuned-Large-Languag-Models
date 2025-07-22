In `main.c`:
```cpp
int main(void) {
int i;
unsigned char a[4] = { 0x5, 0xA, 0xF, 0xFF};
// Add your code here
for (i = 0; i < 4; i++)
{
if ((a[i] > 0) && (a[i] < 3))
printf("a[%d] = %d\n", 3-i, a[3-i]);
}
return 0;
}
```
### Output:
```
[...]
a[0] = 0x2
a[1] = 0x8
a[2] = 0xE
a[3] = 0x1
[...]
```
### Base Verilog Code:
module tst_mux2_2_bsel();
reg[3:0]a;
wire b;
wire c;
mux2_2_bsel mux(a,a,b,c);
initial
begin
a = 4'h0; // Initialize input
end
initial begin // Stimulus