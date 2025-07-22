#### C++ Code:
class SchedDelayA
{
public:
bool a, b;
SchedDelayA();
virtual void update();
};
SchedDelayA::SchedDelayA()
{
}

void SchedDelayA::update()
{
if (b) {
}

b? a : 0;
}
#### Verilog Code:
module SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule

### References:

Module-level parameters and interfaces