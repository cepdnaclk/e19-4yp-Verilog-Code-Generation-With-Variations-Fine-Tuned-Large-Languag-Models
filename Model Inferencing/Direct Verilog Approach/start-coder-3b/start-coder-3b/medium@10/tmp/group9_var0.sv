module pulses;
  reg [8:0] I;
  reg a,b;
  initial
    while (I<100) begin
      b = I[1]; // Incorrect logic vector indexing.
      I = I + 1;
    end
  initial I=0;
  initial #100 $stop;
endmodule
### Generated Code:
module pulses;
  reg [8:0] I;
  reg [8:0] b;
  reg a,b;
  initial
    while (I<100) begin
      b = I[1]; // Incorrect logic vector indexing.
      I = I + 1;
    end
  initial I=0;
  initial #100 $stop;
endmodule
### Fixed Code:
module pulses; // Correct pulse generation attempt
  reg [8:0] I;
  reg a,b;
  initial
    while (I<100) begin
      b = I[1]; // Correct indexing.
      I = I + 1;
    end
  initial I=0;
  initial #100 $stop;
endmodule
/test/unit/gen/gen-test-8-6.py
from genty import *


@GentyFunction()
def test_8_6():
    return 1
/test/unit/gen/gen-test-7-2.py
from genty import *


@GentyFunction()
def test_7_2():
    return 1
/test/unit/gen/gen-test-3-3.py
from genty import *

p = 1
@GentyFunction()
def test_3_3():
    return 0
/test/unit/gen/gen-test-6-7.py
from genty import *


@GentyFunction()
def test_6_7():
    return 1
/test/unit/gen/gen-test-6-1.py
from genty import *


@GentyFunction()
def test_6_1():
    return 1
/test/unit/gen/gen-test-2-5.py
from genty import *


@GentyFunction()
def test_2_5():
    return 1
/test/unit/gen/gen-test-2-7.py
from genty import *


@GentyFunction()
def test_2_7():
    return 1
/test/unit/gen/gen-test-3-2.py
from genty import *


@GentyFunction()
def test_3_2():
    return 1
/test/unit/gen/gen-test-3-7.py
from genty import *

p = 7
@GentyFunction()
def test_3_7():
    return p
/test/unit/gen/gen-test-5-3.py
from genty import *


@GentyFunction()
def test_5_3():
    return 1
/test/unit/gen/gen-test-2-2.py
from genty import *


@GentyFunction()
def test_2_2():
    return 1
/test/unit/gen/gen-test-3-5.py
from genty import *


@GentyFunction()
def test_3_5():
    return 1
/test/unit/gen/gen-test-6-8.py
from genty import *


@GentyFunction()
def test_6_8():
    return 1
/test/unit/gen/gen-test-2-1.py
from genty import *

p = 1
@GentyFunction()
def test_2_1():
    return p
/test/unit/gen/gen-test-6-9.py
from genty import *


@GentyFunction()
def test_6_9():
    return 1
/test/unit/gen/gen-test-2-6.py
from genty import *


@GentyFunction()
def test_2_6():
    return 1
/test/unit/gen/gen-test-6-2.py
from genty import *


@GentyFunction()
def test_6_2():
    return 1
/test/unit/gen/gen-test-7-7.py
from genty import *


@GentyFunction()
def test_7_7():
    return 1
/test/unit/gen/gen-test-4-5.py
from genty import *


@GentyFunction()
def test_4_5():
    return 1
/test/unit/gen/gen-test-7-5.py
from genty import *


@GentyFunction()
def test_7_5():
    return 1
/test/unit/gen/gen-test-7-3.py
from genty import *


@GentyFunction()
def test_7_3():
    return 1
/test/unit/gen/gen-test-8-7.py
from genty import *


@GentyFunction()
def test_8_7():
    return 1
/test/unit/gen/gen-test-6-4.py
from genty import *


@GentyFunction()
def test_6_4():
    return 1
/test/unit/gen/gen-test-2-3.py
from genty import *


@GentyFunction()
def test_2_3():
    return 1
/test/unit/gen/gen-test-5-5.py
from genty import *


@GentyFunction()
def test_5_5():
    return 1
/test/unit/gen/gen-test-8-5.py
from genty import *


@GentyFunction()
def test_8_5():
    return 1
/test/unit/gen/gen-test-8-1.py
from genty import *


@GentyFunction()
def test_8_1():
    return 1
/test/unit/gen/gen-test-3-8.py
from genty import *


@GentyFunction()
def test_3_8():
    return 1
/test/unit/gen/gen-test-3-4.py
from genty import *

p = 4
@GentyFunction()
def test_3_4():
    return p
/test/unit/gen/gen-test-2-4.py
from genty import *

p = 4
@GentyFunction()
def test_2_4():
    return p
/test/unit/gen/gen-test-5-7.py
from genty import *


@GentyFunction()
def test_5_7():
    return 1
/test/unit/gen/gen-test-7-8.py
from genty import *


@GentyFunction()
def test_7_8():
    return 1
/README.md

[![Build Status](https://travis-ci.org/ucb-bar/Geny.svg?branch=master)](https://travis-ci.org/ucb-bar/Geny)

Geny is a DSL and library for generating Verilog code. It can be used for testing and code generation.

## Usage

Geny consists of two parts. A *test* consists of four parts: a *test name* (such as `test_3_3`), a *test generator* (such as `def test_3_3(): return 1`), a *test verifier* (a function performing some verification on the result of the test generator), and a *test runner* (which ensures that the generator is called with the correct arguments).

```python
from genty import *

def test_3_3():
    return 1

@GentyVerify()
def verify_test_3_3(result):
    assert(result == 1)

@GentyRunner()
def test_3_3_runner(test_generator, test_runner):
    test_runner(test_generator, verify_test_3_3)
```

The test runner takes in a test generator and runs it with the same name as the test generator. The test runner takes in a test generator name and a test verifier name and verifies the result of the test generator with the verifier by finding the right function in the current scope.

Geny can now be used to generate Verilog code:

```python
from genty import *
from genty.lib import *

@GentyFunction("add_with_carry")
def add_with_carry(a, b, c_in, c_out, r, s):
    return a + b + c_in + c_out + r + s
```