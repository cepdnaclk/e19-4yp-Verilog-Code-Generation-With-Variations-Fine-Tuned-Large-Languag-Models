module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di, clk;
  always @(posedge clk or negedge clk) begin
    if(clk == 1)
      sum <= a+b;
    else
      sum <= di;
  end
endmodule
### Test Case:
Test code:
```c
`include "VProblem1.cpp.vhi"
class Problem1Test : public CxxTest::TestSuite {
public:
  void testExample() {
    VProblem1 *uut;
    uut = (VProblem1 *) new VProblem1;
    uut->clk = 0;
    uut->di = 1;
    uut->eval();
    Assert::AreEqual(uut->clk, 0, "Clock not stable after reset.");
    uut->di = 2;
    uut->clk = 1;
    uut->eval();
    Assert::AreEqual(uut->clk, 1, "Clock not stable after reset.");
    uut->di = 4;
    uut->clk = 0;
    uut->eval();
    Assert::AreEqual(uut->clk, 0, "Clock not stable after reset.");
    uut->di = 3;
    uut->clk = 1;
    uut->eval();
    Assert::AreEqual(uut->clk, 1, "Clock not stable after reset.");
    uut->di = 0;
    uut->clk = 0;
    uut->eval();
    Assert::AreEqual(uut->clk, 0, "Clock not stable after reset.");
    Assert::AreEqual(uut->sum, 4, "Sum not correct.");
    delete uut;
  }
};
```
Test results:
| Test | Result |
|------|--------|
| Verilog (Verilator) | OK |
| SystemVerilog | OK |
| C# | OK |
###