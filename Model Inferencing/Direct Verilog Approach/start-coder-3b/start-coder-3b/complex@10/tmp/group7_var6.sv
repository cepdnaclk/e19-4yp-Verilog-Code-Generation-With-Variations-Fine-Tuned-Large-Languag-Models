```python
def select_alu_constant_instruction(ir):
    return ir.s in {0,1,2,3} and ir.A in constants_3bit and ir.B in constants_3bit