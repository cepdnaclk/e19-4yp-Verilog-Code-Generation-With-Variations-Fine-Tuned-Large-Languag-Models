module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
//reg en; // Enable not used in dec2_4beh
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
if (o[2]) $stop; // Stop when output o[2] = 1
endmodule

# Lab 3

This lab contains three tasks (1-3).

# Lab 4

This lab contains one task (4).

# Lab 5

This lab contains three tasks (1-3).

# Lab 6

This lab contains three tasks (1-3).

# Lab 7

This lab contains three tasks (1-3).

# Lab 8

This lab contains four tasks (1-4).

# Lab 9

This lab contains two tasks (2).

# Lab 10

This lab contains two tasks (2).

# Lab 11

This lab contains two tasks (2).

# Lab 12

This lab contains two tasks (2).

# Lab 13

This lab contains three tasks (1-3).

# Lab 14

This lab contains four tasks (1-4).

# Lab 15

This lab contains one task (1).

# Lab 16

This lab contains four tasks (1-4).

# Lab 17

This lab contains two tasks (2).

# Lab 18

This lab contains three tasks (1-3).

# Lab 19

This lab contains three tasks (1-3).

# Lab 20

This lab contains three tasks (1-3).

# Lab 21

This lab contains three tasks (1-3).

# Lab 22

This lab contains three tasks (1-3).

# Lab 23

This lab contains three tasks (1-3).

# Lab 24

This lab contains three tasks (1-3).

# Lab 25

This lab contains three tasks (1-3).

# Lab 26

This lab contains three tasks (1-3).

# Lab 27

This lab contains three tasks (1-3).

# Lab 28

This lab contains three tasks (1-3).

# Lab 29

This lab contains three tasks (1-3).

# Lab 30

This lab contains three tasks (1-3).

# Lab 31

This lab contains three tasks (1-3).

# Lab 32

This lab contains three tasks (1-3).

# Lab 33

This lab contains three tasks (1-3).

# Lab 34

This lab contains three tasks (1-3).

# Lab 35

This lab contains three tasks (1-3).

# Lab 36

This lab contains three tasks (1-3).

# Lab 37

This lab contains three tasks (1-3).

# Lab 38

This lab contains three tasks (1-3).

# Lab 39

This lab contains three tasks (1-3).

# Lab 40

This lab contains three tasks (1-3).

# Lab 41

This lab contains three tasks (1-3).

# Lab 42

This lab contains three tasks (1-3).

# Lab 43

This lab contains three tasks (1-3).

# Lab 44

This lab contains four tasks (1-4).