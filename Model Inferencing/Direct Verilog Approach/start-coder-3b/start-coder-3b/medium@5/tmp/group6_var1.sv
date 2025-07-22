module ram_2rw_1r1w_2k2k; // Renamed module for clarity
  reg [9:0] i, r, w, d;
  reg [9:0] ram1[127:0], ram2[127:0];
  // Register based DRAM
  always @(i or r or w)
    d = ram1[i];
  always @(w)
    ram1[i] = w;
  initial
  begin
    // Initialize input, output and random
    i = 9'b0;
    r = 1'b0;
    w = 1'b0;
    d = 9'b0;
    // Initialize RAM
    for (genvar j = 0; j < 128; j = gen_index1(j))
    begin : init_ram
      ram1[j] = 10'b0;
    end
    i = 9'b0;
    w = 1'b0;
    // Initialize RAM
    for (genvar j = 0; j < 128; j = gen_index2(j))
    begin : init_ram
      ram2[j] = 10'b0;
    end
    $monitor("i=%b, r=%b, d=%b, w=%b ", i,r,d,w);
  end
  function unsigned int gen_index1(j)
    gen_index1 = j+1;
  endfunction
  function unsigned int gen_index2(j)
    gen_index2 = j+2;
  endfunction
endmodule
### Compared Result:
![alt text](https://github.com/hari-k/Digital_System_Verification_with_Verilog/blob/master/Images/Clock_Generation/ram_2rw_1r1w_2k2k.PNG)

# 4. Clock Tree
A clock tree is a collection of clocks that are derived from other clocks. The Verilog code for clock trees is a bit more confusing than the clock generators because it is not as straight forward as an assignment statement of a register. The Verilog code for clock tree generators is a bit more complicated than clock generators because it includes the use of the function $root(clk) which returns the root clock of clk.

## 4.1. Base Verilog Code:
module clk_tree1; // Renamed module for clarity
  initial begin
    $monitor("clk_tree1=%b ", clk_tree1(clk));
  end
  function clk_tree1(clk) 
    clk_tree1 = $root(clk);
  endfunction
endmodule

## 4.2. Variation Instruction:
The variation instruction for this verilog code is to use a function that includes an inside expression that uses the built-in function $root(clk) to return the root clock of clk.

## 4.3. Modified Code:
module clk_tree1; // Renamed module for clarity
  initial begin
    $monitor("clk_tree1=%b ",clk_tree1(clk));
  end
  function clk_tree1(clk) 
    clk_tree1 = $root(clk);
  endfunction
  function clk_tree1(clk)
    clk_tree1 = $root(clk);
  endfunction
endmodule

## 4.4. Compared Result:
![alt text](https://github.com/hari-k/Digital_System_Verification_with_Verilog/blob/master/Images/Clock_Generation/clk_tree1.PNG)

## 4.5. Base Verilog Code:
module clk_tree2; // Renamed module for clarity
  initial begin
    $monitor("clk_tree2=%b ", clk_tree2(clk_tree1(clk)));
  end
  function clk_tree2(clk) 
    clk_tree2 = $root(clk);
  endfunction
endmodule

## 4.6. Variation Instruction:
The variation instruction for this verilog code is to use a function that includes an inside expression that uses a function call that includes an inside expression