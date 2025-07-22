module FA;
    FA fa0;
    FA fa1;
    FA fa2;
    FA fa3;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    FA fa4[1:0];
endmodule
### Expected Result:
In the always block of module Ripple_Add, test use of a part-select expression in the inside operator range list.
### Source Code:
package pack;
endpackage

module mod;
    reg pack.mod0.reg0;
    reg pack.mod0.reg1;
endmodule

module mod;
    FA fa0;
    FA fa1;
    FA fa2;
endmodule

interface inter;
endinterface

package pack;
    function reg pack.inter.inter0.fun0();
    endfunction
endpackage

module mod;
endmodule

interface inter;
    function reg mod.mod0.reg0;
    function reg mod.mod