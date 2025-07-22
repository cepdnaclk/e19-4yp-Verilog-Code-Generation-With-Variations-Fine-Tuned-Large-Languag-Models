module t_Clock_Prog ();
wire clock;
#100 $finish;
Clock_Prog M1 (clk);
Clock_Prog #(.Resetn(0)) M2 (clk);
Clock_Prog #(.Resetn(1)) M3 (clk);
endmodule
### Testbenches:
#### 1. Testbenches for the original code:
```
##########################################################################
#
# Clock_Prog.v - clock and reset synchronizer for FPGA design
#
# Description: This module is used to implement a reset generator and a clock generator
#              for ASIC and FPGA design. The clock and reset signal must be generated
#              before any other circuitry. This module is available under BSD 2-Clause
#              license.
#
# Copyright (c) 2009-2017, Siarhei Siamashka <siarhei@hotmail.com>
# All rights reserved.
#
##########################################################################

// Clock and Reset generator module
module Clock_Prog #( parameter Resetn = 1 ) (
	output reg clk
);

initial begin
	clk = 0;
end
always begin
	#50 clk = ~clk;
end

endmodule
```
#### 2. Testbenches for variation instruction:
```
##########################################################################
#
# Clock_Prog.v - clock and reset synchronizer for FPGA design
#
# Description: This module is used to implement a reset generator and a clock generator
#              for ASIC and FPGA design. The clock and reset signal must be generated
#              before any other circuitry. This module is available under BSD 2-Clause
#              license.
#
# Copyright (c) 2009-2017, Siarhei Siamashka <siarhei@hotmail.com>
# All rights reserved.
#
##########################################################################

// Clock and Reset generator module
module Clock_Prog #( parameter Resetn = 1 ) (
	output reg clk
);


initial begin
	clk = 0;
end
always begin
	#50 clk = ~clk;
end
endmodule
```
#### 3. Testbenches for variation instruction:
```
##########################################################################
#
# Clock_Prog.v - clock and reset synchronizer for FPGA design
#
# Description: This module is used to implement a reset generator and a clock generator
#              for ASIC and FPGA design. The clock and reset signal must be generated
#              before any other circuitry. This module is available under BSD 2-Clause
#              license.
#
# Copyright (c) 2009-2017, Siarhei Siamashka <siarhei@hotmail.com>
# All rights reserved.
#
##########################################################################

// Clock and Reset generator module
module Clock_Prog #( parameter Resetn = 1 ) (
	output reg clk
);


initial begin
	clk = 0;
end
always begin
	#50 clk = ~clk;
end
endmodule
```