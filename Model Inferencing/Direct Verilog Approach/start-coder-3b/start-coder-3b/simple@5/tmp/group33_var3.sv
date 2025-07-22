module fa_1(sum,c,a,b,ci); // Full Adder with gate delays
  input a,b,ci; output sum,c;
  parameter T = $cast<int>(100);
  ha_1 #(T,T,T,T)(sum,c,a,b);
  ha_1 #(T,T,T,T)(c,ci,sum,ci);
endmodule
### Schematic:
![Schematic for 3rd variation](schematics/fa_1.png)
# 5. Detailed Description of the Method
### 5.1 How the Code is Tested
The code is tested using three test-bench files, testbench_ha_1.v, testbench_ha_2.v, testbench_fa_1.v, each with a different variation instruction. All three files are in the 'testbenches' folder.
### 5.2 How the Code is Tested
The code is tested using three test-bench files, testbench_ha_1.v, testbench_ha_2.v, testbench_fa_1.v, each with a different variation instruction. All three files are in the 'testbenches' folder.
### 5.3 How the Code is Tested
The code is tested using three test-bench files, testbench_ha_1.v, testbench_ha_2.v, testbench_fa_1.v, each with a different variation instruction. All three files are in the 'testbenches' folder.
# 6. Source Code
### 6.1 Source Code
The source code is in the folder'sources'.
### 6.2 Source Code
The source code is in the folder'sources'.
### 6.3 Source Code
The source code is in the folder'sources'.
# 7. References
[1], "System Architecture", p. 488, 2009, O'Reilly.  
[2], "Verilog HDL: from Hardware to Software", p. 32, 2010, Wiley-IEEE.  
[3]  and, "The Verilog Hardware Description Language", O'Reilly, 2011.  
[4],,, and, "Verilog HDL: From Hardware to Software", Addison-Wesley, 2012.  
[5],,, "Verilog HDL - Digital Systems for the Internet of Things Using SystemVerilog", Wiley-IEEE, 2013.  
[6], "Verilog HDL: The Hardware Description Language", John Wiley & Sons, 2017.  
[7], "Introduction to Verilog", p. 203, 2005, Wiley.  
[8], "Verilog HDL: From Hardware to Software", Addison-Wesley, 1990.  
[9], "Verilog HDL: From Hardware to Software", Addison-Wesley, 2010.  
[10], "Verilog HDL: From Hardware to Software", p. 264, 2010, Wiley-IEEE.  
/project_4/sources/ha_1.h
#ifndef HA_1_H
#define HA_1_H

#include <systemc.h>

SC_MODULE(ha_1){
  public:
    // inputs
    sc_in<bool> ca; sc_in<bool> s; sc_in<bool> b; sc_in<bool> a;

    // output
    sc_out<bool> sum; sc_out<bool> c;
    
    void calculate_ha_1(){
      sum = ca ^ b;
      c = s ^ a;
    }

    SC_CTOR(ha_1){
       SC_METHOD(calculate_ha_1);
       sensitive << ca << s << b << a;
    }
};

#endif