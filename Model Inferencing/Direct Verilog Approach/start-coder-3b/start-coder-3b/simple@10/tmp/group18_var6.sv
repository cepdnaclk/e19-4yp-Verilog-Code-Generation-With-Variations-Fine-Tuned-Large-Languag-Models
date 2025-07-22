```
module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; enum aa { A = 0, B, Default };
  wire ao, ai;
  not #2 (ao,ai);
endmodule
### Expected Result:
Show that the inputs are defaulted to 0 and non-default values are selected for the test.
"""

# Create the module instance
show_aa = top["show_aa"]

# Create the test instance
test_aa = show_aa.test

# Set the input
test_aa.ai = "Default"

# Run the test
test_aa()

# Check the result
assert show_aa.ao == 0
assert show_aa.trace.time == 2

# Verify that the module was called with the correct arguments
def check_show_aa_input(context, name, value):
    if name == "ai":
        assert value == "Default"
        return True

module_call_context.add_check(check_show_aa_input)

# Verify that the module was called with the correct arguments with default value
show_aa.ai = None
test_aa()
assert show_aa.trace.time == 0

# Set the input
test_aa.ai = "A"

# Run the test
test_aa()

# Check the result
assert show_aa.ao == 0
assert show_aa.trace.time == 2

# Verify that the module was called with the correct arguments
def check_show_aa_input(context, name, value):
    if name == "ai":
        assert value == "A"
        return True

module_call_context.add_check(check_show_aa_input)
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import math

n = 10
A = np.random.normal(0, 1, (n, n))
A = A @ A.T
plt.imshow(A)
plt.colorbar()
plt.show()

e, v = np.linalg.eig(A)

plt.hist(e) # plot the distribution of eigenvalues
plt.show()

e_sorted = sorted(e, reverse=True)
acc = 0
for i in e_sorted:
    acc += i
    print(acc)
    if acc > 0.99 * np.sum(e):
        break

# plot the top 10 eigenvalues to see the distribution
plt.hist(e[0:10])
plt.show()#include <stdio.h>

int main() {
  int i=0;

  for (; i<20; i++) {
    printf("Hello from process %d\n", i);
  }
  return 0;
}#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  if (argc!= 3) {
    printf("Usage: a.out <number of processes> <number of rounds>\n");
    exit(1);
  }

  int n = atoi(argv[1]);
  int r = atoi(argv[2]);

  int *arr = malloc(n * sizeof(int));

  for (int i=0; i<n; i++) {
    arr[i] = i;
  }

  int next = 1;
  int curr = 0;
  int i = 0;

  for (int j=0; j<r; j++) {
    int temp = arr[curr];
    arr[curr] = arr[next];
    next += 1;
    if (next >= n) {
      next = 0;
    }
    curr += 1;
    if (curr >= n) {
      curr = 0;
    }
    i += temp;
    i %= n;
  }

  printf("Result: %d\n", i);
  free(arr);
  return 0;
}#include <stdio.h>
#include <stdlib.h>

void merge(int *arr, int l, int m, int r) {
  int i, j, k;
  int n1 = m - l + 1;
  int n2 = r - m;
  int *L = malloc((n1) * sizeof(int));
  int *R = malloc((n2) * sizeof(int));

  for (i = 0; i < n1; i++)
    L[i] = arr[l + i];
  for (j = 0; j < n2; j++)
    R[j] = arr[m + 1 + j];

  i = 0;
  j = 0;
  k = l;
  while (i < n1 && j < n2) {
    if (L[i] < R[j]) {
      arr[k] = L[i];
      i += 1;
    }
    else {
      arr[k] = R[j];
      j += 1;
    }
    k += 1;
  }
  while (i < n1) {
    arr[k] = L[i];
    i += 1;
    k += 1;
  }
  while (j < n2) {
    arr[k] = R[j];
    j += 1;
    k += 1;
  }

  free(L);
  free(R);
}

void merge_sort(int *arr, int l, int r) {

  if (l < r) {
    int m = l + (r - l) / 2;

    merge_sort(arr, l, m);
    merge_sort(arr, m + 1, r);

    merge(arr, l, m, r);
  }
}

int main(int argc, char *argv[]) {
  if (argc!= 2) {
    printf("Usage: a.out <length>\n");
    return 1;
  }

  int n = atoi(argv[1]);
  int *arr = calloc(n, sizeof(int));
  for (int i=0; i<n; i++) {
    arr[i] = rand() % 1000;
  }

  printf("Input:\n");
  for (int i=0; i<n; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");

  merge_sort(arr, 0, n - 1);

  printf("Output:\n");
  for (int i=0; i<n; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");

  free(arr);
  return 0;
}#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  int fd = open("input.txt", O_RDONLY);
  char *buf = malloc(256);
  read(fd, buf, 256);
  printf("Input: %s\n", buf);
  free(buf);
  close(fd);
  return 0;
}## Project

The goal of the project is to create a C/Python tool that will automatically generate a test suite for a verilog or VHDL simulation. This tool should be capable of generating test sequences (either random or otherwise specified) that will be executed in succession and check the correctness of the simulation.

## Code

The following is a partial code coverage checker for VHDL. 

### Installation

* Requires Python 3.
* Requires the python-verilog library: `pip install python-verilog`
* Requires the networkx library: `pip install networkx`
* `python3 -m pip install -U pip` (if pip is outdated)

### Usage

* Run `python3 main.py -h` for help.
* Run `python3 main.py` for the default options.

### Examples

For the C-based [AES code](https://github.com/cs5490-19s/aes-c), run the following:

```
python3 main.py -m aes_test -i tests/aes_tests.json -v -o aes_coverge.html
```

## Description

The tool will generate a test suite for a Verilog module. The test suite will include a set of random inputs to the module and a set of test cases selected from a list of test cases.

The test cases are selected based on the module's inputs and outputs. Inputs are selected randomly, while outputs are selected from a set of test cases. The test cases are selected from a set of user-defined test cases.

To specify a set of test cases:

```
[
  {
    "name": "test case name",
    "inputs": {
      "input 1 name": "input 1 value",
      "input 2 name": "input 2 value"
    },
    "outputs": {
      "output 1 name": "output 1 value",
      "output