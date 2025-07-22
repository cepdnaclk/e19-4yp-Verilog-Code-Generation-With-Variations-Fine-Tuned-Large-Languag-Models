#module testbench ();
#generate data;
#process data;
#endmodule
#
```

* The test bench is generated from the top module from which the data will be extracted.

## Test Case Generation

### Command:
```
./make_test_cases.sh <Test bench file> <number of test cases>
```

### Example:
```
./make_test_cases.sh testbench 10
```

### Variation:

The test case generation is based on the following assumptions:

* Each function input is used once.
* The test cases are generated randomly and uniformly.

## Test Bench Generation

### Command:
```
./make_test_bench.sh <Test bench file> <Test case file> <number of test cases>
```

### Example:
```
./make_test_bench.sh testbench testcases 10
```

### Variation:

The test bench is generated from the top module from which the data will be extracted.

## Test Case and Test Bench Correlation

### Command:
```
./correlate.sh <Test bench file> <Test case file> <number of test cases>
```

### Example:
```
./correlate.sh testbench testcases 10
```

### Variation:

The test bench and test case files must be generated using the same number of test cases.

* The first parameter is the test bench file.
* The second parameter is the test case file.
* The third parameter is the number of test cases.

## Run Test Bench

### Command:
```
./run_test_bench.sh <Test bench file>
```

### Example:
```
./run_test_bench.sh testbench
```

### Variation:

The test bench file must be used as the test bench.

## Run Test Case

### Command:
```
./run_test_case.sh <Test case file> <number of test cases>
```

### Example:
```
./run_test_case.sh testcases 10
```

### Variation:

The test case must be run with the number of test cases specified as the third parameter.

* The first parameter is the test case file.
* The second parameter is the number of test cases.

## Test Case Correlation

### Command:
```
./correlation.sh <Test case file>
```

### Example:
```
./correlation.sh testcases
```

### Variation:

The test case file must be used as the test case.

## Run Test Bench and Test Case

### Command:
```
./run.sh <Test bench file> <Test case file>
```

### Example:
```
./run.sh testbench testcase
```

### Variation:

The test bench and test case must be used as the test bench and test case.
/run.sh
#!/bin/bash

#./run.sh <Test bench file> <Test case file>

./run_test_bench.sh $1
./run_test_case.sh $2