module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
struct { byte rand Member; } Data;
endmodule
### Verification Code:
#include "uvm.sv"

module DataComponent_test ();
import uvm_pkg::*;

class DataComponent_test extends uvm_test;
    `uvm_component_utils(DataComponent_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        DataComponent_transaction t = DataComponent_transaction::type_id::create("t");
        t.randomize();
        phase.drop_objection(this);
    endtask
endclass

class DataComponent_transaction extends uvm_sequence_item;
    `uvm_object_utils(DataComponent_transaction)

    struct { byte rand Member; } Data;

    function new(string name="");
        super.new(name);
    endfunction
endclass

// Run the test
initial begin
    run_test();
end
endmodule