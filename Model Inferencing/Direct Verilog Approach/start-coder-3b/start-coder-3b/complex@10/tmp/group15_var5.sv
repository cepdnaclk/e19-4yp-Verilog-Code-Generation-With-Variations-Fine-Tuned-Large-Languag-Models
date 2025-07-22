module tst_updcounter();
reg clk,u_d;
reg[3:0]N,a;
reg[3:0]d;
reg[3:0]i;
reg[3:0]n;
initial
begin
#10 clk = 0;
#10 clk = 1;
d = 1'b1;
N = 4'b0111;
i = 4'b0111;
u_d = 1'b1;
a = 4'b0000;
#10 $finish;
end
#20 clk = ~clk;
#30 u_d = ~u_d;
initial $monitor($time,"clk=%b, d=%b, clk=%b,N=%d, a=%d, u_d=%b, i=%d",clk,d,~clk,N,a,u_d,i);
initial #64 $stop;
endmodule
## Results:
Run the modified version of the testbench with a scope. Observe the following:

<img src="https://user-images.githubusercontent.com/50626376/129643371-a2f6a200-4110-4447-8a74-0ec37c120e08.png" width="50%">

The above scope capture shows that the counter behaves correctly. Notice that the value of a is 0 when the signal is reset. 
#include "verilated.h"
#include "Vtst_updcounter.h"
#include <iostream>
#include <cstdint>


int main(int argc, char *argv[]) {
  // Instantiate Vtst_updcounter //
  Vtst_updcounter* tb = new Vtst_updcounter;

  // Set random values //
  tb->clk = 0; // Initialize clock
  tb->rst_n = 0; // Initialize reset

  // Set data values //
  tb->N = 7;
  tb->u_d = 0;
  tb->a = 0;

  std::cout << "Initializing: N=" << tb->N << ", u_d=" << tb->u_d << ", a=" << tb->a << std::endl;

  // Run simulation for 200 timesteps //
  for (int i = 0; i < 200; i++) {
    tb->eval();
    tb->clk =!tb->clk;
    tb->eval();
    tb->clk =!tb->clk;

    // Print values to monitor //
    std::cout << i << ": " << "clk=" << tb->clk << ", N=" << tb->N << ", u_d=" << tb->u_d << ", a=" << tb->a << std::endl;

  }

  std::cout << "Finishing simulation..." << std::endl;

  // Finish simulation //
  tb->final();
  delete tb;
};