module tst_dff_p_b();
  reg di,clk; wire do;
  dff d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," dff_p_b=%b",(do[1]));
endmodule
```


---
## 7.24. Timing Analysis - DFF
### 7.24.1. Verilog Code:
```
// DFF module
module dff (output do,input di,input clk);
  wire q;
  always @(posedge clk) q<=di;
  assign do = q;
endmodule
```

### 7.24.2. VPI Instruction List

|Instruction | Instruction Format |
|---|---|
|vpi_get            |vpi_get(vpiHandle,vpiExprHandle,ref_obj)   |
|vpi_handle_by_name |vpi_handle_by_name(vpiNameHandle,vpiSysTfCall,ref_obj)   |
|vpi_get_value      |vpi_get_value(vpiHandle,ref_obj_1,ref_obj_2)   |
|vpi_get_str        |vpi_get_str(vpiHandle,ref_obj)   |
|vpi_put_value      |vpi_put_value(vpiHandle)   |
|vpi_put_str        |vpi_put_str(vpiHandle)   |
|vpi_put_array      |vpi_put_array(vpiHandle,ref_obj)   |
|vpi_put_array_item|vpi_put_array_item(vpiHandle,ref_obj)   |
|vpi_put_scalar     |vpi_put_scalar(vpiHandle,ref_obj)   |
|vpi_put_sys_func   |vpi_put_sys_func(vpiHandle,ref_obj)   |
|vpi_get_array      |vpi_get_array(vpiHandle,ref_obj)   |
|vpi_get_array_item|vpi_get_array_item(vpiHandle,ref_obj)   |
|vpi_get_scalar     |vpi_get_scalar(vpiHandle,ref_obj)   |
|vpi_get_sys_func   |vpi_get_sys_func(vpiHandle,ref_obj)   |
|vpi_get_index      |vpi_get_index(vpiHandle,ref_obj)   |
|vpi_get_next       |vpi_get_next(vpiHandle)
|vpi_get_element    |vpi_get_element(vpiHandle,ref_obj)   |
|vpi_get_str        |vpi_get_str(vpiHandle,ref_obj)   |
|vpi_get_index      |vpi_get_index(vpiHandle,ref_obj)   |
|vpi_iterate        |vpi_iterate(vpiVectorHandle,ref_obj)   |
|vpi_scan           |vpi_scan(vpiVectorHandle,ref_obj)   |
|vpi_get_next       |vpi_get_next(vpiHandle)   |
|vpi_get_index      |vpi_get_index(vpiHandle,ref_obj)   |


### 7.24.3. Reference Guide:
#### Module/Function Call
|Description | Syntax |
|---|---|
|Module Call | Module_Name (port_value1 [, port_value2])  |
|Function Call| Function_Name (value1 [, value2]) |

#### Data Types
|Name |Description |
|---|---|
|integer |32-bit signed integer. |
|real_time|32-bit real time. |
|time|64-bit time. |
|string |8-bit character string. |
|bits |array of bits. |
|bit_vector |array of bits. |
|byte |array of 8-bit characters. |
|byte_vector |array of 8-bit characters. |
|enum |enumeration type. |
|real |64-bit fixed-point real number. |
|bit_string |bit_vector. |
|byte_string |byte_vector. |
|signed |signed integer. |
|unsigned |unsigned integer. |
|integer_vector |array of signed or unsigned integers. |
|real_vector |array of 64-bit fixed-point real numbers. |
|time_vector |array of 64-bit time. |
#### Data Type Conversion
|Name |Description |
|---|---|
|int_to_time |Convert integer time to time data type.|
|real_to_time |Convert real number to time data type.|
|time_to_real |Convert time to real number data type.|
|real_to_int |Convert real number to integer data type.|
|int_to_real |Convert integer time to real number data type.|
|time_to_int |Convert time to integer data type.|

#### System Functions
|Name |Description |
|---|---|
|time |Return the current time.|
|time_plus |Return the sum of two times.|
|time_minus |Return the difference of two times.|
|time_mult |Return the product of two times.|
|time_div |Return the quotient of two times.|
|time_scale |Return scale factor for time.|
|time_to_string |Return a time as a string.|
|string_to_time |Return a string as a time.|
|string_to_int |Return a string as an integer.|
|int_to_string |Return an integer as a string.|

#### Verilog-A Functions
|Name |Description |
|---|---|
|rand |Return a random real number between 0 and 1.|
|randc |Return a random real number between 0 and 1.|
|min_time |Return the minimum time among the arguments.|
|max_time |Return the maximum time among the arguments.|
|start_of_falling_edge |Return the start of a falling edge.|
|start_of_rising_edge |Return the start of a rising edge.|

#### Verilog-A Operators
|Name |Description |
|---|---|
|delay_ctrl |Evaluate the delay of a system function.|
|delay |Evaluate the delay of a system function.|

#### Verilog-A Constructs
|Name |Description |
|---|---|
|always_comb |Define a combinational always block.|
|always_latch |Define a latched always block.|
|always_ff |Define a synchronous always block.|
|always_latch_reset_ff |Define a latched always block with a reset.|
|always_comb_if_else |Define a combinational always block with if-else.|
|always_latch_if_else |Define a latched always block with if-else.|
|always_ff_if_else |Define a synchronous always block with if-else.|
|always_comb_if |Define a combinational always block with if.|
|always_latch_if |Define a latched always block with if.|
|always_ff_if |Define a synchronous always block with if.|
|for_loop |Define a for loop construct.|
|case |Define a case statement.|
|if_else |Define an if-else statement.|
|while_do |Define a while construct.|

##### 1. always

 - **Description:**
    - Define a synchronous always block
    - Syntax:
        ```
        always #(time_condition) sensitivity_list block
        ```
 - **Parameters:**
    1. **#time_condition:** If a delay is inserted in the sensitivity list, a delay is inserted before the sensitivity list.
    2. **sensitivity_list:** A list of signal names that affect the block.
    3. **block:** The block statement.
 - **Example:**
    ```
    // Clocked inverter with synchronous reset.
    module inv (output, input clk, reset);
        reg output;

        always @ (posedge clk, negedge reset) begin
            output =!output;
        end
    endmodule

    // Clocked inverter with synchronous reset and register output.
    module inv (output, input clk, reset);
        reg output;

        always @ (posedge clk, negedge reset) begin
            output <=!output;
        end
    endmodule
    ```
- **Note:**
    - The sensitivity list must be enclosed in parentheses and