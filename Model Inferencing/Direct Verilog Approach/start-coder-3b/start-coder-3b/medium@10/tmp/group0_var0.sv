import org.cadence.design.util;

module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;

  specparam dl1 = 1;
  specparam dl2 = dl1 + 1;

  /* Assign path delays using slice expressions */
  (a, b *> s) = dl1;
  (a, b *> ca) = dl2;

  /* New if condition to check if a is in [2,3] */
  if (a in [2,3])
    (a, b *> s) = 2;
  else
    (a, b *> s) = dl1;

  if (a in [2,3])
    (a, b *> ca) = 2;
  else
    (a, b *> ca) = dl2;

  xor (s,a,b);
  and (ca,a,b);
endmodule
### Result:

![Result](/Result_P1_017.png?raw=true "Result")<center>
<h1>
CADE2021
</h1>
</center>

## Authors:
- 
- 
- 

## Task 1:
1. Create a new design using the same IP cores from the last lab (you can reuse the code)
2. Add a 4-bit counter called "counter" at the top of the design. Its initial value should be 0.
3. Add a 4-bit full adder called "adder" at the top of the design.
4. Change the top module to connect the 4-bit counter with the 4-bit full adder.

### Solution:
[P1.v](P1.v)

## Task 2:
1. Create a new design using the same IP cores from the last lab (you can reuse the code)
2. Add a 4-bit full adder circuit (ha_8) at the top of the design.
3. Add a 2-bit register to the design.
4. Change the top module to connect the 4-bit full adder with the 2-bit register.
5. Add a 4-bit counter circuit (counter_4) at the bottom of the design.
6. Change the top module to connect the 4-bit counter with the 2-bit register.

### Solution:
[P2.v](P2.v)

## Task 3:
Create a new design using the same IP cores from the last lab (you can reuse the code)
1. Add a 4-bit full adder circuit (ha_8) at the top of the design.
2. Add a 2-bit register to the design.
3. Change the top module to connect the 4-bit full adder with the 2-bit register.
4. Add a counter (counter_4) at the bottom of the design.
5. Change the top module to connect the 4-bit counter with the 2-bit register.

### Solution:
[P3.v](P3.v)

## Task 4:
Create a new design using the same IP cores from the last lab (you can reuse the code)
1. Add a 4-bit full adder circuit (ha_8) at the top of the design.
2. Design a shift register and connect it with the 4-bit full adder.
3. Create a sequence of 4 values (0, 1, 1, 0) and connect the shift register with it.

### Solution:
[P4.v](P4.v)

## Task 5:
Create a new design using the same IP cores from the last lab (you can reuse the code)
1. Add a 4-bit full adder circuit (ha_8) at the top of the design.
2. Design a shift register and connect it with the 4-bit full adder.
3. Create a sequence of 4 values (0, 1, 1, 0) and connect the shift register with it.
4. Add a counter (counter_4) at the bottom of the design.
5. Change the top module to connect the 4-bit counter with the 2-bit register.
6. Add a register to the design and connect it with the 4-bit counter.

### Solution:
[P5.v](P5.v)

## Task 6:
Create a new design using the same IP cores from the last lab (you can reuse the code)
1. Add a 4-bit full adder circuit (ha_8) at the top of the design.
2. Design a shift register and connect it with the 4-bit full adder.
3. Create a sequence of 4 values (0, 1, 1, 0) and connect the shift register with it.
4. Add a counter (counter_4) at the bottom of the design.
5. Change the top module to connect the 4-bit counter with the 2-bit register.
6. Add a register to the design and connect it with the 4-bit counter.
7. Add a 4-bit full adder circuit (ha_8) at the top of the design.
8. Design a shift register and connect it with the 4-bit full adder.
9. Create a sequence of 4 values (0, 1, 1, 0) and connect the shift register with it.
10. Change the top module to connect the 4-bit full adder with the shift register.
11. Add a counter (counter_4) at the bottom of the design.
12. Change the top module to connect the 4-bit counter with the 4-bit full adder.
13. Add a register to the design and connect it with the 4-bit counter.

### Solution:
[P6.v](P6.v)

## Task 7:
1. Create a new design using the same IP cores from the last lab (you can reuse the code)
2. Design an ALU (4-bit 8-bit adder) at the top of the design.
3. Design an ALU (4-bit 8-bit adder) at the bottom of the design.
4. Connect the left ALU with the right ALU.

### Solution:
[P7.v](P7.v)

## Task 8:
1. Create a new design using the same IP cores from the last lab (you can reuse the code)
2. Design a multiplier (4-bit 4-bit multiplier) at the top of the design.
3. Add a 4-bit register to the design.
4. Connect the multiplier with the register.
5. Connect the 4-bit register with the multiplier.
6. Add a counter (counter_4) at the bottom of the design.
7. Change the top module to connect the 4-bit counter with the 4-bit register.
8. Add a register to the design and connect it with the 4-bit counter.

### Solution:
[P8.v](P8.v)

## Task 9:
1. Create a new design using the same IP cores from the last lab (you can reuse the code)
2. Design a multiplier (4-bit 4-bit multiplier) at the top of the design.
3. Add a 4-bit register to the design.
4. Connect the multiplier with the register.
5. Connect the 4-bit register with the multiplier.
6. Add a counter (counter_4) at the bottom of the design.
7. Change the top module to connect the 4-bit counter with the 4-bit register.
8. Add a register to the design and connect it with the 4-bit counter.
9. Add a multiplier (4-bit 4-bit multiplier) at the top of the design.
10. Add a 4-bit register to the design.
11. Connect the multiplier with the register.
12. Connect the 4-bit register with the multiplier.
13. Change the top module to connect the 4-bit counter with the 4-bit register.
14. Add a register to the design and connect it with the 4-bit counter.

### Solution:
[P9.v](P9.v)// Copyright 2019 
#ifndef __COUNTER_4_H__
#define __COUNTER_4_H__

void counter_4();

#endif// Copyright 2019 
#ifndef __HA_8_H__
#define __HA_8_H__

void ha_8();

#endif#include "counter_4.h"

void counter_4() {
    // Initial values
    wire [3:0] a