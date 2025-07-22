module testbench ();
struct {
bit a;} data;
covergroup cg_data_a @(posedge clk);
coverpoint data.a;
endgroup
endmodule
### Expected Output:
randomization test:
0% (0/0) covered
### Variable Parameters:
- **`name`**: Specifies the name of the covergroup
- **`options`**: Specifies options to the covergroup
### Covergroup Syntax:
```systemverilog
covergroup <name> [options];
    [coverpoint]
    [cross]
    [coverpoint]
   ...
    <coverpoint>::[sample]
   ...
endgroup
```
### Covergroup Options:
- `option.per_instance`: The covergroup is created per instance of the variable
- `option.weight(<expression>)`: Adds an expression for weighting the coverage
- `option.option()`: Options to the covergroup
### Covergroup Example:
```systemverilog
covergroup cg_data_a with function sample(int i);
coverpoint data.a with
    bins a_0_1 = {[0:1]};
coverpoint data.b with
    bins b_0_1 = {[0:1]};
coverpoint data.c with
    bins c_0_1 = {[0:1]};
coverpoint data.d with
    bins d_0_1 = {[0:1]};
coverpoint data.e with
    bins e_0_1 = {[0:1]};
coverpoint data.f with
    bins f_0_1 = {[0:1]};
endgroup
```