```verilog
module tst_alu4();
  reg [3:0]a,b; reg[1:0] f; reg cci; logic[3:0]d; logic co;
  alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin // Apply stimulus with #3 delay
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule
```

#### Testbench
![Testbench Screenshot](./Images/Testbench_Screenshot.png)

#### Compile and Run

```shell
$ g++../TUTORIALS/TUTORIAL_01_VLOG_Basics/testbench.cpp -I $HOME/workspace/fpga/verilog-tut-repo/src/ -L $HOME/workspace/fpga/verilog-tut-repo/src/ -lalumod -o tst_tut2
$./tst_tut2
```

#### Rtlview:

![Rtlview_Screenshot01](./Images/Rtlview01.png)

![Rtlview_Screenshot02](./Images/Rtlview02.png)

![Rtlview_Screenshot03](./Images/Rtlview03.png)

![Rtlview_Screenshot04](./Images/Rtlview04.png)

![Rtlview_Screenshot05](./Images/Rtlview05.png)

![Rtlview_Screenshot06](./Images/Rtlview06.png)

![Rtlview_Screenshot07](./Images/Rtlview07.png)

![R