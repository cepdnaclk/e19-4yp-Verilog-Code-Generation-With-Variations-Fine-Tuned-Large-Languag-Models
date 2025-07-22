module tstdlatch; //test-bench
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0;
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time units
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule

## 3.11. Exercises

### Exercise 3.11.1

### Exercise 3.11.2

### Exercise 3.11.3

### Exercise 3.11.4

### Exercise 3.11.5

### Exercise 3.11.6

### Exercise 3.11.7

## 3.12. Lab 4 (T1, T2)

Design a circuit to convert from the decimal number system to the binary number system.

### Exercise 3.12.1

### Exercise 3.12.2

### Exercise 3.12.3

### Exercise 3.12.4

### Exercise 3.12.5

### Exercise 3.12.6

### Exercise 3.12.7

### Exercise 3.12.8

### Exercise 3.12.9

### Exercise 3.12.10

### Exercise 3.12.11

### Exercise 3.12.12

### Exercise 3.12.13

### Exercise 3.12.14

### Exercise 3.12.15

### Exercise 3.12.16

### Exercise 3.12.17

### Exercise 3.12.18

### Exercise 3.12.19

### Exercise 3.12.20

### Exercise 3.12.21

### Exercise 3.12.22

### Exercise 3.12.23

### Exercise 3.12.24

### Exercise 3.12.25

### Exercise 3.12.26

### Exercise 3.12.27

### Exercise 3.12.28

### Exercise 3.12.29

### Exercise 3.12.30

### Exercise 3.12.31

### Exercise 3.12.32

### Exercise 3.12.33

### Exercise 3.12.34

### Exercise 3.12.35

### Exercise 3.12.36

### Exercise 3.12.37

### Exercise 3.12.38

Design a 4-bit adder.

### Exercise 3.12.39

### Exercise 3.12.40

### Exercise 3.12.41

### Exercise 3.12.42

### Exercise 3.12.43

### Exercise 3.12.44

### Exercise 3.12.45

### Exercise 3.12.46

### Exercise 3.12.47

### Exercise 3.12.48

### Exercise 3.12.49

### Exercise 3.12.50

### Exercise 3.12.51

### Exercise 3.12.52

### Exercise 3.12.53

### Exercise 3.12.54

### Exercise 3.12.55

### Exercise 3.12.56

### Exercise 3.12.57

### Exercise 3.12.58

### Exercise 3.12.59

### Exercise 3.12.60

### Exercise 3.12.61

### Exercise 3.12.62

### Exercise 3.12.63

### Exercise 3.12.64

### Exercise 3.12.65

### Exercise 3.12.66

### Exercise 3.12.67

### Exercise 3.12.68

### Exercise 3.12.69

### Exercise 3.12.70

### Exercise 3.12.71

### Exercise 3.12.72

### Exercise 3.12.73

### Exercise 3.12.74

### Exercise 3.12.75

### Exercise 3.12.76

### Exercise 3.12.77

### Exercise 3.12.78

### Exercise 3.12.79

### Exercise 3.12.80

### Exercise 3.12.81

### Exercise 3.12.82

## 3.13. Lab 5 (T1)

Design a 4-bit add/subtract circuit.

### Exercise 3.13.1

### Exercise 3.13.2

### Exercise 3.13.3

### Exercise 3.13.4

### Exercise 3.13.5

### Exercise 3.13.6

### Exercise 3.13.7

### Exercise 3.13.8

### Exercise 3.13.9

### Exercise 3.13.10

### Exercise 3.13.11

### Exercise 3.13.12

### Exercise 3.13.13

### Exercise 3.13.14

### Exercise 3.13.15

### Exercise 3.13.16

### Exercise 3.13.17

### Exercise 3.13.18

### Exercise 3.13.19

### Exercise 3.13.20

### Exercise 3.13.21

### Exercise 3.13.22

### Exercise 3.13.23

### Exercise 3.13.24

### Exercise 3.13.25

### Exercise 3.13.26

### Exercise 3.13.27

### Exercise 3.13.28

### Exercise 3.13.29

### Exercise 3.13.30

### Exercise 3.13.31

### Exercise 3.13.32

### Exercise 3.13.33

### Exercise 3.13.34

### Exercise 3.13.35

### Exercise 3.13.36

### Exercise 3.13.37

### Exercise 3.13.38

### Exercise 3.13.39

### Exercise 3.13.40

### Exercise 3.13.41

### Exercise 3.13.42

### Exercise 3.13.43

### Exercise 3.13.44

### Exercise 3.13.45

### Exercise 3.13.46

### Exercise 3.13.47

### Exercise 3.13.48

### Exercise 3.13.49

### Exercise 3.13.50

### Exercise 3.13.51

### Exercise 3.13.52

### Exercise 3.13.53

### Exercise 3.13.54

### Exercise 3.13.55

### Exercise 3.13.56

### Exercise 3.13.57

### Exercise 3.13.58

### Exercise 3.13.59

### Exercise 3.13.60

### Exercise 3.13.61

### Exercise 3.13.62

### Exercise 3.13.63

### Exercise