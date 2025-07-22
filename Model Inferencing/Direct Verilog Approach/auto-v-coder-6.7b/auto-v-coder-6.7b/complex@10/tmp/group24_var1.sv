```python
# import necessary modules
import random

# define constants
consts = {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}

# define function to simulate the microprocessor, used to test XMR
def simulate_mup(BCD_in):
    # check if BCD_in is valid
    if BCD_in not in consts:
        raise ValueError("Invalid BCD_in: must be 0-9")
    # simulate internal MUP registers (pc, ir, dcop)
    pc = 0
    ir = 0
    dcop = 0
    # simulate XMR usage
    XMR_used = consts[BCD_in]
    print(f"XMR_used: {XMR_used}")
    return XMR_used

# test the function with random valid BCD_in
BCD_in = random.choice(list(consts.keys()))
print(f"Testing with BCD_in: {BCD_in}")
simulate_mup(BCD_in)
```

This variation code will test XMR usage by randomly selecting a valid BCD_in (0-9) and then simulate the microprocessor using this input. The simulated XMR usage should be printed out for verification. This code does not require any Verilog or any specific FPGA tool. It is purely Python based.

The function `simulate_mup` simulates the microprocessor and the XMR usage with the given BCD_in. The function returns the simulated XMR usage. 

Note that the actual microprocessor verification will depend on the specific microprocessor design and requirements. The code presented here is a simplified model of how this could be done.
In actual implementation, you would need to include the microprocessor module and its interaction with the clock, enable, and interrupt signals. You would also need to define the expected behaviour of the microprocessor with respect to XMR usage based on the test case. 

This code is just a basic example and may need to be adapted according to the specific microprocessor design and requirements. For