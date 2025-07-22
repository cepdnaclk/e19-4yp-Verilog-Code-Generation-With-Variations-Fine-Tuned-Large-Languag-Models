module Problem8(input [3:0] a, b, output [3:0] diff);
  //reg [2:0] x, y, z;
  struct packed { reg x; reg y; reg z; } myStruct;
  assign diff = {myStruct.x, myStruct.y, myStruct.z};
endmodule
### Instructions:
1) Compile the Verilog source file problem8.v on your computer using the Yosys synthesis tool.
2) Open the generated Verilog source file problem8_synth.v with a text editor and observe the changes made to the code.
3) Generate an executable file from the modified Verilog source file using the Icarus Verilog simulator.
4) Run the executable file and observe the results.
### Conclusion:
Reg packed structures are more performant than reg declarations when it comes to hardware synthesis.

<details>
    <summary>👋🏾 What's your favorite Verilog code?</summary>
    Share your favorite Verilog code in the comments below.
</details>