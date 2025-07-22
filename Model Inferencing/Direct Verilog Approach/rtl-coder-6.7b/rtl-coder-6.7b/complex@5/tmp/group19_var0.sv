`inside` operator is applied to signal `data` using constant index.
`carry_in` is set to the constant value of 0.
`carry_out` is set to the value of the index-0 of `data`.
### Portmap:
- `carry_in` 	: data[0]
- `X` 	: data[1]
- `Y` 	: data[2]
- `R` 	: data[-1]
- `carry_out` 	: data[-2]
### Expected Signal
- `carry_in` 	: 0000_0000_0000_0001
- `X` 	: 0000_0000_0000_0011
- `Y` 	: 0000_0000_0000_0110
- `R` 	: 0000_0000_0000_1010
- `carry_out` 	: 0000_0000_0001_0000
### Testbench:
Testbench is defined to test the modified code.
The testbench has a clock called `clk`.
The clock is driven by forever loop with 10 iterations.
After every iteration the testbench waits for 10 time units by calling `#10`.
The testbench calls the interface method `write_data` to write data.
The testbench also calls the interface method `read_result` to read the result.
The testbench then compares the result with the expected signal and raises an error if they don't match.
### Testbench Output:
The testbench outputs the data and the result of the modified code.
### Testbench Passed:
The testbench passes the test and the result matches the expected signal.