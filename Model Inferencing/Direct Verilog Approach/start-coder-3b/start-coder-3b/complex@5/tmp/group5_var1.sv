```python
class MyModule(sv.Module):
    def __init__(self, clk, rst):
        self.clk = clk
        self.rst = rst
        self.w = sv.Input(sv.Bit)
        self.z = sv.Output(sv.Bit)

        self.a = sv.Reg(sv.Bit)
        self.b = sv.Reg(sv.Bit)
        self.c = sv.Reg(sv.Bit)

        self.inside_slice = sv.Array(sv.Bit, 3)

        self.a_inside_0 = inside_slice[0]
        self.a_inside_1 = inside_slice[1]
        self.a_inside_2 = inside_slice[2]
        self.b_inside_0 = inside_slice[0]
        self.b_inside_1 = inside_slice[1]
        self.b_inside_2 = inside_slice[2]
        self.c_inside_0 = inside_slice[0]
        self.c_inside_1 = inside_slice[1]
        self.c_inside_2 = inside_slice[2]

        self.y = sv.Reg(sv.Bit