module Cout0Cout1Test (input a, b, output y, output cout0, output cout1);
reg q1;
reg q2;
and (y, q1, a);
and (cout0, q1, b);
and (cout1, q2, a);
and (cout1, q2, b);
endmodule

### Run Code:
[Test](https://github.com/MatsRut/COVID-19-Simulation/blob/master/tests/test_cout0cout1test.py)
[Source](https://github.com/MatsRut/COVID-19-Simulation/blob/master/src/test_cout0cout1test.v)

### Expected results:
Expected that test was successful.

### Results:
Test failed
```
    Traceback (most recent call last):
      File "tests\test_cout0cout1test.py", line 22, in test_cout0cout1test
        assert test_result.ok
    AttributeError: 'TestResults' object has no attribute 'ok'
```

## AndOrTest Test
### Base Verilog Code:
module AndOrTest (input a