module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [3:0] memory [3:0];
always @(posedge Clock)
begin
    for(int i = 0; i < 3; i++)
    begin
        memory[i] = D;
    end
    Q1 <= memory[0];
    Q2 <= memory[1];
```
### Output Code:
```
# *******************************************
# Start module: example7_4
# *******************************************
# Add ports
  add_port "D" INPUT "D"
  add_port "Clock" INPUT "Clock"
  add_port "Q1" OUTPUT "Q1"
  add_port "Q2" OUTPUT "Q2"
# Add reg_array memory
  reg_array memory "memory" "3:0" "3:0"
# Add block:
  add_block "example7_4_loop"
  set_block_attribute "example7_4_loop" "loop_variable" "i"
  set_block_attribute "example7_4_loop" "loop_condition" "i < 3"
  add_block_alias "example7_4_loop" "loop_invar_0" "memory[i]"
  add_block_alias "example7_4_loop" "memory[i]" "memory[i]"
  add_block_alias "example7_4_loop" "memory[i]" "D"
  add_block_alias "example7_4_loop" "memory[i]" "Q1"
  add_block_alias "example7_4_loop" "Q2" "memory[i]"
# Add instruction:
  add_instruction "example7_4_loop" "memory[i]" "memory[i]" "memory[i] <= D"
# Add output:
  add_output "Q1" "memory[0]" "Q1"
  add_output "Q2" "memory[1]" "Q2"
# *******************************************
# End module: example7_4
# *******************************************
```
### Verification:
```
* Regression test
>./main.py -v../testcase/example7_4.ysv -o 1
** Execute the original verilog code and the output verilog code **
* Verilog file used
> example7_4.ysv
> orig.ysv
* Synthesis results
> ----------------------------------------------------------------------------
> ----------
> Synthesis results for../testcase/example7_4.ysv
> ----------
> ----------------------------------------------------------------------------
> Synthesis result: 
> ----------------------------------------------------------------------------
> Memory Name       :  memory
> Size              :  4 bits
> ----------------------------------------------------------------------------
> Memory Instance   :  
> memory_instance_1
> ----------------------------------------------------------------------------
> SRAM Size         :  4
> ----------------------------------------------------------------------------
> SRAM Instance   :  
> memory_instance_1_instance_1
> ----------------------------------------------------------------------------
> Memory Type       :  SRAM
> Width             :  4
> Depth             :  4
> Write Address     :  D[3:0]
> Write Data        :  D[3:0]
> Write Enable      :  Clock
> Output 1          :  Q1
> Output 2          :  Q2
> ----------------------------------------------------------------------------
> Total Memory Size :  32
> ----------------------------------------------------------------------------
* Synthesis results
> ----------------------------------------------------------------------------
> ----------
> Synthesis results for 1_example7_4.ysv
> ----------
> ----------------------------------------------------------------------------
> Synthesis result: 
> ----------------------------------------------------------------------------
> Memory Name       :  memory
> Size              :  4 bits
> ----------------------------------------------------------------------------
> Memory Instance   :  
> memory_instance_1
> ----------------------------------------------------------------------------
> SRAM Size         :  4
> ----------------------------------------------------------------------------
> SRAM Instance   :  
> memory_instance_1_instance_1