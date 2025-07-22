module tstha_9();
  wire [1:0] clk;
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  initial begin clk=3'b100; end
  always begin #5 clk=3'b110; #5 clk=3'b011; #5 clk=3'b111; #5 clk=3'b010; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule/labs/lab6/lab6/lab6/lab6/ha_12.h
// ha_12.h
// Header for 12 bit half adder

// Verilog module ha_12
// using systemverilog logic types

// Original author  - 2007-01-06

// This file is part of 'Verilog code generation using SystemVerilog'.
// Copyright (c) 2007, 
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the copyright holder nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL  BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

module ha_12
#(
    parameter WIDTH=4
)
(
    input  clk,
    input  a,
    input  b,
    input  carry_in,
    output sum,
    output carry_out
);
    // assign carry_out = {carry_in, sum[WIDTH-1:0], carry_in, sum[WIDTH-1:0]};
    assign carry_out = {carry_in, sum[WIDTH-1:0], carry_in, sum[WIDTH-1:0]};

    ha_12_inst#(
       .WIDTH(WIDTH)
    ) ha_inst(
       .inclk(clk),
       .ina(a),
       .inb(b),
       .inci(carry_in),
       .sum(sum),
       .carry_out(carry_out)
    );
endmodule
/labs/lab12/lab12/lab12/lab12/tstha_1.h
// tstha_1.h
// Header for testbench for half adder

// Verilog module tstha_1

// Original author  - 2007-01-06

// This file is part of 'Verilog code generation using SystemVerilog'.
// Copyright (c) 2007, 
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the copyright holder nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL  BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

`timescale 1ns / 1ps

module tstha_1();
  reg a,b; wire s,ci;
  ha_1 hh(s,ci,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  initial begin #5 a=1;b=0; end
  initial begin #5 a=0;b=1; end
  initial begin $monitor(a,b,ci,s); $stop; end
endmodule
/labs/lab11/lab11/lab11/lab11/ha_12.h
// ha_12.h
// Header for 12 bit half adder

// Verilog module ha_12
// using systemverilog logic types

// Original author  - 2007-01-06

// This file is part of 'Verilog code generation using SystemVerilog'.
// Copyright (c) 2007, 
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the copyright holder nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL  BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

module ha_12
#(
    parameter WIDTH=4,
    parameter DELAY=100
)
(
    input  clk,
    input  a,
    input  b,
    input  carry_in,
    output sum,
    output carry_out
);
    wire clk0, clk1;
    assign clk0 = clk & ~clk1;
    assign clk1 = ~clk & clk1;

    ha_12_inst#(
       .WIDTH(WIDTH),
       .DELAY(DELAY)
    ) ha_inst(
       .inclk(clk0),
       .ina(a),
       .inb(b),
       .inci(carry_in),
       .sum(sum),
       .carry_out(carry_out)
    );
endmodule
/labs/lab12/lab12/lab12/lab12/ha_12_inst.h
// ha_12_inst.h
// Header for 12 bit half adder

// Verilog module ha_12
// using systemverilog logic types

// Original author  - 2007-01-06

// This file is part of 'Verilog code generation using SystemVerilog'.
// Copyright (c) 2007, 
// All rights reserved.

// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions