module Problem13(input [3:0] a, b, output [3:0] x);
  wire [3:0] ham;
  assign ham = 4'd0;
  assign ham = a ^ b;
  assign ham = ~ham;
  assign x = 4'd0;
  assign x = ham[3:0];
endmodule
### Output:
4'h1
### Test Input:
4'h3 4'h1
### Expected Output:
4'h2
"""


def problemDesc(pNum):
    if(pNum == 1):
        return PROBLEM_1_DESC
    elif(pNum == 2):
        return PROBLEM_2_DESC
    elif(pNum == 3):
        return PROBLEM_3_DESC
    elif(pNum == 4):
        return PROBLEM_4_DESC
    elif(pNum == 5):
        return PROBLEM_5_DESC
    elif(pNum == 6):
        return PROBLEM_6_DESC
    elif(pNum == 7):
        return PROBLEM_7_DESC
    elif(pNum == 8):
        return PROBLEM_8_DESC
    elif(pNum == 9):
        return PROBLEM_9_DESC
    elif(pNum == 10):
        return PROBLEM_10_DESC
    elif(pNum == 11):
        return PROBLEM_11_DESC
    elif(pNum == 12):
        return PROBLEM_12_DESC
    elif(pNum == 13):
        return PROBLEM_13_DESC
    else: return None


if __name__ == "__main__":
    start = time.time()
    print("Problem 1")
    print(problemDesc(1))
    print("Problem 2")
    print(problemDesc(2))
    print("Problem 3")
    print(problemDesc(3))
    print("Problem 4")
    print(problemDesc(4))
    print("Problem 5")
    print(problemDesc(5))
    print("Problem 6")
    print(problemDesc(6))
    print("Problem 7")
    print(problemDesc(7))
    print("Problem 8")
    print(problemDesc(8))
    print("Problem 9")
    print(problemDesc(9))
    print("Problem 10")
    print(problemDesc(10))
    print("Problem 11")
    print(problemDesc(11))
    print("Problem 12")
    print(problemDesc(12))
    print("Problem 13")
    print(problemDesc(13))
    print("Total Run time: ", time.time() - start)
/Problem_8/Problem8.py
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
@author: 

@description: Write a Verilog module to find the hamming distance between two 4-bit values and produce a 4-bit output value.

@input: 4'h3 4'h1
@output: 4'h2
"""
from __future__ import print_function

PROBLEM_DESC = """
@author: 

@description: Write a Verilog module to find the hamming distance between two 4-bit values and produce a 4-bit output value.

@input: 4'h3 4'h1
@output: 4'h2
"""