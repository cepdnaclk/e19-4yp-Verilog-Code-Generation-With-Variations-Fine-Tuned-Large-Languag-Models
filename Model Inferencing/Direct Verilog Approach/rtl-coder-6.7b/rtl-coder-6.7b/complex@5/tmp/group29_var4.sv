```verilog
module control_unit (flush_P0_P1, Ld_P1, Ld_P0, Ld_R0, Ld, En, clock, rst);
output reg flush_P0_P1, Ld_P1, Ld_P0, Ld_R0;
input Ld, En, clock, rst;
reg [1: 0] state, next_state;
parameter S_idle = 0, S_1 = 1, S_full = 2, S_wait = 3;
always @ (posedge clock) if (rst) state <= S_idle;
else state <= next_state;
always @ (state, Ld, En) begin
flush_P0_P1 = 0;
Ld_P1 = 0;
Ld_P0 = 0;
Ld_R0 = 0;
next_state = S_idle;
case (state)
S_idle: if (En)
begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
else flush_P0_P1 = 1;

S_1: begin next_state = S_full; Ld_P1 = 1; Ld_P0 = 1; end
S_full: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
else next_state = S_wait;
S_wait: if (Ld == 1) begin
Ld_R0 = 1;
case (En)
0: begin next_state = S_idle; flush_P0_P1 = 1; end
1: begin next_state = S_1; Ld_P1 = 1; Ld_P0 = 1; end
endcase
end
else next_state = S_wait;
endcase
end
endmodule
```

### Code Coverage:
```shell
% coverage save -onexit -r /home/lili/labs/lab2/solution/solution.ucdb; vcover -report -html -htmldir /home/lili/labs/lab2/solution/coverage /home/lili/labs/lab2/solution/solution.ucdb
```
![image](https://github.com/LLLLi-Li/SystemVerilogLab/blob/main/Lab2/coverage.png)

### Code Coverage with Coding Style Check:
We use `pytest` as our testing framework in this lab. And we follow [this](https://louhi.github.io/pytest-pylint/#:~:text=PyLint%20is%20a%20Python%20static,the%20python%20compiler%20or%20interpreter.&text=PyLint%20is%20a%20tool%20for,Python%20code%20to%20discover%20errors.&text=PyLint%20is%20a%20tool%20for%20enforcing,Python%20code%20to%20discover%20errors.) to set up coding style check.

And we will use a docker to run this code.

First, we add `pytest` to `requirements.txt`.
```python
pytest==7.2.1
```

Second, we add `pytest-pylint` to `setup.py`
```python
setup(
    name="lab2",
    version="0.1",
    py_modules=["lab2"],
    packages=[],
    install_requires=[
        "pytest-pylint==0.18.2",
        "pytest==7.2.1"
    ],
    entry_points={
        "console_scripts": ["lab2=lab2.lab2:main"]
    }
)
```

Third, we add `pytest --pylint` to `tests.py`.
```python
import pytest

# Run pylint before running the tests
pytest.main(args=["--pylint"])
```

Forth, we add `.pylintrc` to set up lint check.
```python
[MASTER]
verbosity=2

[MESSAGES CONTROL]
disable=missing-function-docstring
```

Then we run `docker run -t --rm -v $(pwd):/opt/app -w /opt/app lili/labs:latest pytest --pylint`. The result may looks like:

![image](https://github.com/LLLLi-Li/SystemVerilogLab/blob/main/Lab2/pytest.png)

### Code Coverage with Docker:
Build the docker file.
```python
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y gcc-8 g++-8 python3 python3-pip python3-dev python3-setuptools python3-wheel python3-numpy \
    vim build-essential git docker.io

RUN pip3 install --upgrade pip==20.3.4

RUN pip3 install -U vcover==3.8.1

RUN git clone https://github.com/LLLLi-Li/SystemVerilogLab

WORKDIR /SystemVerilogLab/

EXPOSE 80

CMD ["python3","lab2/lab2.py"]
```

Then we run `docker run --rm -v $(pwd):/opt/app -w /opt/app lili/labs:latest`. The result may looks like:

```python
% cd ~/labs/lab2/solution
% docker run --rm -v $(pwd):/opt/app -w /opt/app lili/labs:latest
Pas: 0.4071 sec.
```