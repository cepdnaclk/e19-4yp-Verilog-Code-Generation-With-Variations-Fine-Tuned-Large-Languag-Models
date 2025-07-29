module DataComponent (DataIn, DataOut, ControlSignals, RandVar);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
RandVar randMember;
endmodule
### Example of RTL usage:
DataComponent dc (
   .DataIn ( DataIn ),
   .DataOut ( DataOut ),
   .ControlSignals ( ControlSignals )
);
### Example of UVM usage
// Setup the struct fields.
dc.randMember.randField1 = rand_field1;
dc.randMember.randField2 = rand_field2;
// Generate the object.
DataComponent dc = new("dc");
### Explanation:
As there is no special logic related to generation of rand inside an object we use an abstract class as the base that will be extended by the component to generate the object. 
The struct contains a field with a rand (inside it) and the rand member is initialized in the setup code and the rand member is generated in the body of the test.
### Example Code:
```SystemVerilog
package DataComponent_pkg;

class DataComponent;
    rand int randField1;
    rand int randField2;
    rand int randField3;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
    endfunction
endclass

class DataComponent_extended_class extends DataComponent;

    rand int randField4;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void connect_phase(