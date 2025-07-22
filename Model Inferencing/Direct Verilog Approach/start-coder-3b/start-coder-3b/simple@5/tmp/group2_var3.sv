module test;
wire a;
reg packed [3:0] x, y, z;
assign #25 a = 1;
always begin
    x[0] = #10 a;
end
endmodule
# 611. Design Search Autocomplete System

## Problem
Design a search autocomplete system for a search engine. Users may input a sentence (at least one word and end with a special character '#'). For each character they type except '#', you need to return the top 3 historical hot sentences that have prefix the same as the part of sentence already typed. Here are the specific rules:

The hot degree for a sentence is defined as the number of times a user typed the exactly same sentence before.
The returned top 3 hot sentences should be sorted by hot degree (The first is the hottest one). If several sentences have the same degree of hot, you need to use ASCII-code order (smaller one appears first).
If less than 3 hot sentences exist, then just return as many as you can.
When the input is a special character, it means the sentence ends, and in this case, you need to return an empty list.
Your job is to implement the following functions:

The constructor function:

```
AutocompleteSystem(String[] sentences, int[] times): This is the constructor. The input is historical data. Sentences is a string array consists of previously typed sentences. Times is the corresponding times a sentence has been typed. Your system should record these historical data.
```

```
 now(): Return the top 3 historical hot sentences that have prefix the same as the part of sentence already typed. 
```

```
input(char c): This corresponds to one character typed by user in the input. The character will only match the most recent three characters typed. The returned result should be in the same format as input.
```


## Solution 
```python
class AutocompleteSystem(object):
    def __init__(self, sentences, times):
        self.root = {}
        self.cur = self.root
        self.s = ''
        for s, t in zip(sentences, times):
            self.insert(s, t)

    def insert(self, s, t):
        node = self.root
        for c in s:
            if c not in node:
                node[c] = {}
            node = node[c]
        node['#'] = node.get('#', 0) + t
        self.sorted = list(self.root.items())
        self.sorted.sort(key=lambda x: (-x[1]['#'], x[0]))

    def input(self, c):
        if c == '#':
            self.insert(self.s, 1)
            self.s = ''
            self.cur = self.root
            return []
        self.s += c
        node = self.cur
        while node and c not in node:
            node = self.next(node)
        if not node:
            return []
        self.cur = node
        node = node[c]
        self.sorted = list(node.items())
        self.sorted.sort(key=lambda x: (-x[1], x[0]))
        result = []
        for _, v in self.sorted[:3]:
            result += [self.s + c for c in v]
        return result

    def next(self, node):
        sorted = list(node.items())
        sorted.sort(key=lambda x: (-x[1], x[0]))
        for c, v in sorted:
            return v
```

# 941. Valid Mountain Array

## Problem
Given an array A of integers, return true if and only if it is a valid mountain array.

Recall that A is a mountain array if and only if:

A.length >= 3
There exists some i with 0 < i < A.length - 1 such that:
A[0] < A[1] <... A[i-1] < A[i]
A[i] > A[i+1] >... > A[A.length - 1]

## Solution
```python
class Solution(object):
    def validMountainArray(self, A):
        if not A or len(A) < 3:
            return False
        peak = -1
        for i in range(1, len(A)):
            if A[i] < A[i - 1]:
                peak = i
                break
            if A[i] == A[i - 1]:
                return False
        if peak == -1 or peak == 0 or peak == len(A) - 1:
            return False
        for i in range(peak + 1, len(A)):
            if A[i] <= A[i - 1]:
                return False
        return True
```

# 12. Integer to Roman

## Problem
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

```
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
```

For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

```
I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
```
Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.

## Solution
```python
class Solution(object):
    def intToRoman(self, num):
        """
        :type num: int
        :rtype: str
        """
        v = [1000, 500, 100, 50, 10, 5, 1]
        s = ["M", "D", "C", "L", "X", "V", "I"]
        result = []
        for i in range(len(v)):
            while num >= v[i]:
                num -= v[i]
                result.append(s[i])
        return "".join(result)
```# 717. 1-bit and 2-bit Characters

## Problem
We have two special characters. The first character can be represented by one bit 0. The second character can be represented by two bits (10 or 11).

Now given a string represented by several bits. Return whether the last character must be a one-bit character or not. The given string will always end with a zero.

## Solution
```python
class Solution(object):
    def isOneBitCharacter(self, bits):
        """
        :type bits: List[int]
        :rtype: bool
        """
        n = len(bits)
        i = 0
        while i < n - 1:
            i += 1 + bits[i]
        return i == n - 1
```# 1051. Height Checker

## Problem
Students are asked to stand in non-decreasing order of heights for an annual photo.

Return the minimum number of students not standing in the right positions.  (This is the number of students that must move in order for all students to be standing in non-decreasing order of height.)

## Solution
```python
class Solution(object):
    def heightChecker(self, heights):
        """
        :type heights: List[int]
        :rtype: int
        """
        if not heights:
            return 0
        sorted = list(heights)
        sorted.sort()
        return sum(h1!= h2 for h1, h2 in zip(heights, sorted))
```# 581. Shortest Subarray with Sum at Least K

## Problem
Return the length of the shortest, non-empty, contiguous subarray of A with sum at least K.

If there is no non-empty subarray with sum at least K, return -1.

## Solution
```python
class Solution(object):
    def shortestSubarray(self, A, K):
        """
        :type A: List[int]
        :type K: int
        :rtype: int
        """
        if len(A) == 0:
            return -1
        result = len(A) + 1
        sums = [0] * (len(A) + 1)