```
import veriloggen.core.vlog as vlog

class generator(vlog.Module):
    def __init__(self, data_width=1, depth=4, init=0):
        self.data_width = data_width
        self.depth = depth
        self.init = init
        self.S_packed_array = [self.init] * self.depth
        self