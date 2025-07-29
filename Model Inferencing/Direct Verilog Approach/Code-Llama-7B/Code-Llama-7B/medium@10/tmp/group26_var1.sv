module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
reg [3:0] x [ 3:0];
always @(x1 or x2 or x3)
    if (x2 == 1)
        f = x1;
    else
    begin
        if (x3[1:0] >= 2'b01)
            f = 1'b1;
        else
            f = x3;
    end
endmodule
### Test code:
import gscl45_examples_pkg::*;
class gscl45_examples_test extends gscl45_examples_test_base_class;
function new(string name, uvm_component parent = null);
    super.new(name, parent);
endfunction
task run_test();
    `uvm_info("gscl45_examples_test", "start", UVM_LOW)
    begin
        gscl45_examples_sequencer sqr = gscl45_examples_sequencer::type_id::create("sqr", this);
        gscl45_examples_driver drv = gscl45_examples_driver::type_id::create("drv", this);
        gscl45_examples_monitor mon = gscl45_examples_monitor::type_id::create("mon", this);
        gscl45_examples_agent  agt = gscl45_examples_agent::type_id::create("agt", this);
        uvm_config_db#(virtual gscl45_examples_if)::set(this, "*", "vif", agt.vif);
        agt.sqr = sqr;
        agt.drv = drv;
        agt.mon = mon;
        sqr.agt = agt;
        mon.agt = agt;
        repeat(2) begin
            drv.reset();
            @(posedge agt.vif.clk);
            drv.start_item(agt.rqst);
            agt.rqst.f = 0;
            agt.rqst.x1 = 1;
            agt.rqst.x2 = 0;
            agt.rqst.x3 = 1;
            drv.finish_item(agt.rqst);
            @(posedge agt.vif.clk);
            drv.start_item(agt.rqst);
            agt.rqst.f = 0;
            agt.rqst.x1 = 1;
            agt.rqst.x2 = 1;
            agt.rqst.x3 = 0;
            drv.finish_item(agt.rqst);
            @(posedge agt.vif.clk);
            drv.start_item(agt.rqst);
            agt.rqst.f = 0;
            agt.rqst.x1 = 1;
            agt.rqst.x2 = 1;
            agt.rqst.x3 = 1;
            drv.finish_item(agt.rqst);
            @(posedge agt.vif.clk);
            drv.start_item(agt.rqst);
            agt.rqst.f = 0;
            agt.rqst.x1 = 0;
            agt.rqst.x2 = 0;
            agt.rqst.x3 = 0;
            drv.finish_item(agt.rqst);
            @(posedge agt.vif.clk);
            drv.start_item(agt.rqst);
            agt.rqst.f = 0;
            agt.rqst.x1 = 0;
            agt.rqst.x2 = 0;
            agt.rqst.x3 = 1;
            drv.finish_item(agt.rqst);
            @(posedge agt.vif.clk);
            drv.start_item(