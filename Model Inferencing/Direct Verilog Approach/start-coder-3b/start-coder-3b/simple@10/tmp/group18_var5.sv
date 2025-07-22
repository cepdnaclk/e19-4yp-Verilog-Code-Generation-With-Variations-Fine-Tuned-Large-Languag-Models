module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai;
  not #1 packed (ao,ai);
endmodule
### Expected Results:
Error: (verilog-vpi) "not#" statement: the first input is not named and it is not a packed array.
### Expected Explanations:
verilator-vpi does not support mixed-mode enums (i.e. non-packed arrays) as the first input.
The second input should be a valid packed array of one or more bool values.
### User Action:
The user should change the implementation of the show_aa module in order to support the mixed-mode enums.
For example, convert to a single-bit enum, or use an actual packed array of one or more bool values.
In the case above, the user may decide that the packed array of bits is the correct implementation.
### Additional Resources:
None


/vpi-verilator/README.md
# VPI Verilator
This is a VPI-based implementation of the Verilator simulator using the generic VPI interface.

## Requirements:
In order to run this VPI, a verilator installation including verilator-vpi should be present.
Installation instructions for verilator-vpi can be found here: https://github.com/verilator/verilator-vpi

## Running the VPI:
To run the VPI, simply run the following command from the root directory of the VPI-Verilator repository:
```
python3 vpi.py
```

## Supported Verilator Features:
The following features are supported by the current implementation:

| Feature | Supported | Notes |
| ------- | --------- | ----- |
| Module Instantiation | ✅ | Module instances are supported for the most part, however, the verilator language does not support the `parameter` keyword. Instead, the parameter definitions are embedded directly into the module instance. |
| Module Ports | ✅ | Input and output ports are treated as ports to the module. In the case of modules that are instantiated inside of other modules, the ports are bound to the module instance, rather than the module itself. |
| Module Parameters | ✅ | Parameter definitions are embedded directly into the module definition. |
| Module Local Parameter | ✅ | Local parameters are supported, but not as part of the Verilog specification. Rather, they are used to represent module ports that are internally used by the module. The behavior of these parameters is undefined. |
| Module Variable | ✅ | The `wire` and `reg` keywords are supported. |
| Module Combinational | ✅ | All module statements (other than `initial`, `always`, and `always_comb`) are supported. |
| Module Verilog Task | ✅ | Tasks are supported. |
| Module Verilog Module | ✅ | Modules are supported. |
| Module Verilog Function | ❌ | Functions are not supported. |
| Module Verilog If-Else | ❌ | Verilog `if` and `else` statements are not supported. |
| Module Verilog Case | ❌ | Verilog `case` statements are not supported. |
| Module Verilog For-Each | ✅ | `for` and `foreach` statements are supported. |
| Module Verilog Foreach-Select | ✅ | `foreach` statements that contain a `select` statement are supported. |
| Module Verilog Foreach-Default | ❌ | `foreach` statements that do not contain a `select` statement are not supported. |
| Module Verilog Foreach-Default-Always | ❌ | `foreach` statements that contain a `default` statement are not supported. |
| Module Verilog Foreach-Default-Case | ❌ | `foreach` statements that contain a `default` statement are not supported. |
| Module Verilog Foreach-Parallel | ❌ | `foreach` statements that contain a `parallel` statement are not supported. |
| Module Verilog Foreach-Sequential | ❌ | `foreach` statements that contain a `sequential` statement are not supported. |
| Module Verilog Foreach-Sequential-If | ❌ | `foreach` statements that contain a `sequential` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Sequential-If-Else | ❌ | `foreach` statements that contain a `sequential` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Sequential-If-Case | ❌ | `foreach` statements that contain a `sequential` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Sequential-Case | ❌ | `foreach` statements that contain a `sequential` statement and a `case` statement are not supported. |
| Module Verilog Foreach-Case-If | ❌ | `foreach` statements that contain a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-If-Else | ❌ | `foreach` statements that contain a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case | ❌ | `foreach` statements that contain a `case` statement and a `case` statement are not supported. |
| Module Verilog Foreach-Case-Case-If | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case-If-Else | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-If | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-If-Else | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-Case | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement and a `case` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-Case-If | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement and a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-Case-If-Else | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement and a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-Case-Case | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement and a `case` statement and a `case` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-Case-Case-If | ❌ | `foreach` statements that contain a `case` statement and a `case` statement and a `case` statement and a `case` statement and a `case` statement and an `if` statement are not supported. |
| Module Verilog Foreach-Case-Case-Case-Case-Case-If-Else | ❌ | `foreach` statements that contain a `case` statement and