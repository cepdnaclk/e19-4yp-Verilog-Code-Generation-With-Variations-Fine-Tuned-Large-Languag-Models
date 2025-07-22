module Problem10(input [10:0] x, input [9:0] y, output [3:0] z);
  wire d10, d9, d6[4];
  assign d10 = x[10];
  assign d9 = y[9];
  assign d6[4] = x[6:0];
  assign d6[0] = d6[1] & d6[2] & d6[3];
  assign z[0] = d10;
  assign z[1] = d9;
  assign z[2] = d6[3];
  assign z[3] = d6[0];
endmodule
# 
# 9/10/2018
# CS 465: Computer Organization and Architecture
# HW2: Sampling and Arithmetic

import math
import numpy as np
import random
import matplotlib.pyplot as plt 

def generateData(N):
    return np.random.uniform(0,1,N)

def plotData(y):
    plt.hist(y)
    plt.show()

def filterData(x, p):
    y = np.zeros(len(x))
    for i in range(len(y)):
        if i - 2 > 0:
            y[i] = p * x[i] + (1 - p) * y[i-1]
        else:
            y[i] = x[i]
    return y

def filterData2(x, p):
    y = np.zeros(len(x))
    for i in range(len(y)):
        if i - 2 > 0:
            y[i] = p * x[i] + (1 - p) * y[i-1]
        else:
            y[i] = x[i]
    return y

N = 10000
for p in [0.1, 0.3, 0.5, 0.7, 0.9]:
    x = generateData(N)
    y = filterData(x, p)
    plotData(y)

N = 10000
for p in [0.1, 0.3, 0.5, 0.7, 0.9]:
    x = generateData(N)
    y = filterData2(x, p)
    plotData(y)

N = 10000
for p in [0.1, 0.3, 0.5, 0.7, 0.9]:
    x = generateData(N)
    y = filterData2(x, p)
    plotData(y)
# 
# 9/10/2018
# CS 465: Computer Organization and Architecture
# HW2: Sampling and Arithmetic

import math
import numpy as np
import random
import matplotlib.pyplot as plt

N = 10000
x = np.zeros(N)
y = np.zeros(N)
for i in range(N):
    x[i] = random.random()
    y[i] = np.random.poisson(x[i])

plt.hist(y)
plt.show()
n-1):
    x[i] = i

n = 10
p = 0.35
y = np.zeros(n)
for i in range(n):
    y[i] = x[i] * p + (1 - p) * y[i-1]

for i in range(n):
    print("x[{}] = {}".format(i, x[i]))
    print("y[{}] = {}".format(i, y[i]))

print("")

print("Original Signal:")
plt.plot(x)
plt.show()

print("")

print("Filtered Signal:")
plt.plot(y)
plt.show()
# 
# 9/10/2018
# CS 465: Computer Organization and Architecture
# HW2: Sampling and Arithmetic

import math
import numpy as np
import random
import matplotlib.pyplot as plt

n = 100
x = np.zeros(n)
for i in range(# 
# 9/10/2018
# CS 465: Computer Organization and Architecture
# HW2: Sampling and Arithmetic


N = 10000
x = [1,2,3,4,5,6,7,8,9,10]
y = [0.0] * N
for i in range(N):
    y[i] = x[i]
    if i > 2:
        y[i] = y[i] + y[] * p + (1 - p) * y[i-1]

for i in range(N):
    print("x[{}] = {}".format(i, x[i]))
    print("y[{}] = {}".format(i, y[i]))
i-1] + y[i-2]

n = 10
p = 0.35
y = [0.0] * n
for i in range(n):
    y[i] = x[i  x_s[i] = x[i] * s[i] + (1 - s[i]) * y[i-1]

for i in range(N):
    print("x[{}] = {}".format(i, x[i]))
    print("y[{}] = {}".format(i, y[i]))
    print("s[{}] = {}".format(i, s[i]))
    print("x_s[{}] = {}".format(i, x_s[i]))

print("")

print("Original Signal:")
plt.plot(x)
plt.show()

print("")

print("Sampled Signal:")
plt.plot(s)
plt.show()

print("")

print("Filtered Signal:")
plt.plot(y)
plt.show()

print("")

print("Sampled and Filtered Signal:")
plt.plot(x_s)
plt.show()
# 
# 9/10/2018
# CS 465: Computer Organization and Architecture
# HW