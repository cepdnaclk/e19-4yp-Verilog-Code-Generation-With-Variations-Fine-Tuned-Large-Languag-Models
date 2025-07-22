module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
j = 0;
k = 1;
end
m555 timer(clock);
endmodule
### MDA Index Code:
jkEdgeFF jk(.q(mda[j][k]),.clock(clock),.j(j),.k(k),.preset(preset),.clear(clear));
m555 timer(.clock(clock));
### Original MDA Code:
jkEdgeFF jk(.q(mda[j][k]),.clock(clock),.j(j),.k(k),.preset(preset),.clear(clear));
m555 timer(.clock(clock));
### Original Testbench Code:
module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Testbench Results:
#### Testbench Setup
**Design Name:** test_k
**Source File:** C:/Users/username/Source/Repos/Verilog/M-D Flip-Flops/md_jkEdgeFF.v
**Test Results:** Pass
**Test Start Time:** 1/23/2021 11:20:11 AM
**Test End Time:** 1/23/2021 11:20:13 AM
**Elapsed Time:** 2 seconds
**Run Time Logs Directory:** C:/Users/username/Source/Repos/Verilog/M-D Flip-Flops/logs
```
#### Results
##### Test Pass
#### Log Files
**C:/Users/username/Source/Repos/Verilog/M-D Flip-Flops/logs/test_k.log**
```
[2021-01-23 11:20:11] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>

[2021-01-23 11:20:11] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>iverilog -o test_k.out test_k.v md_jkEdgeFF.v m555_timer.v

[2021-01-23 11:20:11] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>

[2021-01-23 11:20:12] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>vvp -M. test_k.out

[2021-01-23 11:20:12] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>

[2021-01-23 11:20:12] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>time -v test_k.out

Time statistics for test_k.v:
===============================================================================
Total        : 1000000
Average      : 1000000
Maximum      : 1000000
Minimum      : 1000000
Standard Deviation   : 0
Total list length: 1000000

[2021-01-23 11:20:13] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>

[2021-01-23 11:20:13] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>vvp -M. test_k.out

[2021-01-23 11:20:13] [INFO] --- C:\Users\username\Source\Repos\Verilog\M-D Flip-Flops\test_k>
```
#include "Arduino.h"
#include "LiquidCrystal_I2C.h"
#include "m555_timer.h"

LiquidCrystal_I2C lcd(0x27, 16, 2);
//LiquidCrystal_I2C lcd(0x3F, 16, 2);
//LiquidCrystal_I2C lcd(0x20, 16, 2);

m555_timer timer(1);

void setup() {
  Serial.begin(9600);
  Serial.println("starting lcd serial");
  lcd.begin(16, 2);
  Serial.println("lcd begin");
  lcd.init();
  Serial.println("lcd init");
  lcd.backlight();
  Serial.println("lcd backlight");
  lcd.setCursor(0, 1);
  lcd.print("starting lcd");
  delay(1000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("hello world");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("              3");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("              2");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("              1");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("0");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print(" 3 2 1 0 ");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print(" 2 1 0 ");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print(" 1 0 ");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd.setCursor(0, 1);
  lcd.print(" 0 ");
  Serial.println("lcd print");
  delay(3000);
  lcd.setCursor(0, 1);
  lcd.print("                 "); //wipe it away
  lcd