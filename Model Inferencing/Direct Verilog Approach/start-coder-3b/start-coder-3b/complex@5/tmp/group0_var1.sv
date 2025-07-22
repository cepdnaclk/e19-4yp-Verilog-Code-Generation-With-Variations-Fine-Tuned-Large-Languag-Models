```vhdl
// Copyright 2012, Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module tst_or_gate();
    reg[3:0]a;
	reg [1:0]en;
	wire b;

    or_gate gg (b, a, en);

    initial
    begin
        a = {2{0}};
	en = 1'b0;
	end

    initial $monitor("t=%0d, en = %b, a = %h, b = %b",$time,en,a,b);
    initial #30 $stop;
endmodule
```
### Expected Results:
```log
-- Testing: tst_or_gate
en = 0b00, a = 0b0000, b = 0
en = 0b00, a = 0b0001, b = 0
en = 0b00, a = 0b0010, b = 0
en = 0b00, a = 0b0011, b = 0
en = 0b00, a = 0b0100, b = 0
en = 0b00, a = 0b0101, b = 0
en = 0b00, a = 0b0110, b = 0
en = 0b00, a = 0b0111, b = 1
en = 0b00, a = 0b1000, b = 0
en = 0b00, a = 0b1001, b = 0
en = 0b00, a = 0b1010, b = 0
en = 0b00, a = 0b1011, b = 0
en = 0b00, a = 0b1100, b = 0
en = 0b00, a = 0b1101, b = 0
en = 0b00, a = 0b1110, b = 0
en = 0b00, a = 0b1111, b = 1
en = 0b00, a = 0b0000, b = 0
en = 0b00, a = 0b0001, b = 0
en = 0b00, a = 0b0010, b = 0
en = 0b00, a = 0b0011, b = 0
en = 0b00, a = 0b0100, b = 0
en = 0b00, a = 0b0101, b = 0
en = 0b00, a = 0b0110, b = 0
en = 0b00, a = 0b0111, b = 1
en = 0b00, a = 0b1000, b = 0
en = 0b00, a = 0b1001, b = 0
en = 0b00, a = 0b1010, b = 0
en = 0b00, a = 0b1011, b = 0
en = 0b00, a = 0b1100, b = 0
en = 0b00, a = 0b1101, b = 0
en = 0b00, a = 0b1110, b = 0
en = 0b00, a = 0b1111, b = 1
end of test
```
.29.31'

[tool.poetry.dev-dependencies]
pytest = "^5.2"

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"
/pyproject.toml
[tool.poetry]
name = "vunit"
version = "2.0.0"
description = "vUnit is a software testbench for Verilog"
authors = [" <>",
           " <>",
           " <>"]
license = "Apache-2.0"
repository = "https://github.com/vunit/vunit"
# Remember to update.github/workflows/release.yml when we change this
keywords = ["verilog"]
readme = "README.md"
documentation = "https://vunit.github.io"

[tool.poetry.dependencies]
python = ">=3.8.0,<3.11"
Jinja2 = ">=2.11.3"
ruamel.yaml = ">=0.16.10"
colorama = ">=0.4.1"
termcolor = ">=1.1.0"
# In vunit-config, we need to use an older version of click
# because of https://github.com/pallets/click/issues/1759
#
# Make sure you update vunit-config too!
click = ">=7.0.0,<7.1.0"
click-log = ">=0.3.2"
# vunit-config uses a custom patched version of pytest
# that can be installed using the pip editable mode:
#   pip install -e.
pytest = ">=6.2.3"

# TODO: use pre-commit hook
pycodestyle = "^2.5.0"
pylint = "^2.4.4"

[tool.poetry.group.dev.dependencies]
# Development tools
black = "^23.3.0"
flake8 = "^5.0.4"
isort = "^5.9.3"
mypy = "^1.0.1"
pydocstyle = "^6.1.1"
# Test dependencies
pytest = "^6.2/doc/sphinx/source/user_manual/testbenches/testcase.rst
.. _test_case:

Test Cases
==========

A test case is the entry point for a testbench. It is a
combination of stimulus and a test specification. The test
spec consists of assertions that are to be checked. The stimulus
is the initial stimulus and is usually generated
automatically from the test specification.

.. _test_case_example:

An example test case with assertions:

.. literalinclude::../../../../examples/test_case/test_case_example.v
   :language: verilog
   :lines: 24-

The above test case has an initial stimulus called ``init_stim`` and
an assertion called ``init_assert``.

.. note::
   The testbench example can be found at
   ``examples/test_case/test_case_example.v``.

.. _test_spec:

Test Specification
------------------

A test spec is a combination of stimulus and assertions.

.. _test_spec_example:

An example test spec:

.. literalinclude::../../../../examples/test_case/test_spec_example.v
   :language: verilog
   :lines: 24-

The above test spec has an initial stimulus called ``init_stim`` and
an assertion called ``init_assert``.

**The initial stimulus**

The initial stimulus is a stimulus that is to be generated
automatically for every test case. The following code shows the
initial stimulus for the test spec from the test spec example
above:

.. literalinclude::../../../../examples/test_case/test_spec_example.v
   :language: verilog
   :lines: 17-28
   :emphasize-lines: 17-18

The initial stimulus is a single statement, which contains a signal
assignment statement with a function call as its right-hand side.
The function call is bound to a signal, and is usually called
something like ``init_stim`` as shown in the test spec example.

**The assertions**

Assertions are verification statements. They are usually
statements that check some aspect