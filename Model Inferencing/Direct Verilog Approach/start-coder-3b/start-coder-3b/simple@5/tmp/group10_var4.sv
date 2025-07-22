```
module tst_alu4_wire2logic();
  logic [3:0]a,b; logic[1:0] f; logic cci; reg [3:0]d; reg co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
```
/src/main/java/com/mycompany/test/ALU_4_Controller_TB.java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.test;

import alu_4.ALU_4;

/**
 *
 * @author Shruti
 */
public class ALU_4_Controller_TB {

    public static void main(String[] args) {
        ALU_4 alu4 = new ALU_4();
        for (int i = 0; i < 8; i++) {
            alu4.a = i;
            alu4.b = i;
            System.out.println("a="+alu4.a);
            System.out.println("b="+alu4.b);
            alu4.f = i;
            System.out.println("f="+alu4.f);
            System.out.println("d="+alu4.d);
            alu4.cci = 0;
            System.out.println("cci="+alu4.cci);
            System.out.println("co="+alu4.co);
        }
    }
}
/doc/README.txt
# ALU4
The module alu_4.v is a 3-bit ALU with the following functionalities:

a.  Addition of two 3-bit values of two inputs.
b.  Subtraction of two 3-bit values of two inputs and then the 3-bit result is complemented.
c.  Shift of the input value.
d.  Shift of the input value and complement the input after shifting.


## Inputs

![image] (https://github.com/ShrutiBajpai/ALU4/blob/master/doc/Inputs.png)

## Outputs
![image] (https://github.com/ShrutiBajpai/ALU4/blob/master/doc/Outputs.png)
/src/main/java/com/mycompany/test/ALU_4_Controller_TB_logic2wire.java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.test;

import alu_4.ALU_4;

/**
 *
 * @author Shruti
 */
public class ALU_4_Controller_TB_logic2wire {

    public static void main(String[] args) {
        ALU_4 alu4 = new ALU_4();
        for (int i = 0; i < 8; i++) {
            alu4.a = i;
            alu4.b = i;
            System.out.println("a="+alu4.a);
            System.out.println("b="+alu4.b);
            alu4.f = i;
            System.out.println("f="+alu4.f);
            alu4.cci = 0;
            System.out.println("cci="+alu4.cci);
            System.out.println("co="+alu4.co);
        }
    }
}
/doc/alu_4_wire2logic/README.md
# TestBench of ALU_4 with wire as output for logic

## Base Verilog Code:
```
module tst_alu4_wire2logic();
  logic [3:0]a,b; logic[1:0] f; logic cci; reg [3:0]d; reg co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
```
## Variation Instruction: 
Change the type of the output cout from wire to logic to test logic-vector compatibility.