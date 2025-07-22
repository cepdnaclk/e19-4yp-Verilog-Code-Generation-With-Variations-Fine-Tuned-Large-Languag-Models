* Line 45
```verilog
always_comb begin
 if(state inside {IDLE, P0, P1})
```
### Modified Code (Package Version):
* Line 45
```verilog
always_comb begin
 if(state inside {IDLE, P0, P1})
```
### Source:
* [C:\Users\harris\Desktop\GitHub\Digital Logic\Verilog\Lab3/tstdlatch.v](C:\Users\harris\Desktop\GitHub\Digital Logic\Verilog\Lab3/tstdlatch.v)
/Lab5/src/testbench.h
#ifndef TEST_BENCH
#define TEST_BENCH

#include "hdl_util.h"
#include <vector>
#include <map>
#include <set>

// The testbench class
class Testbench
{
private:
    std::set<std::string> modules;
    std::map<std::string, std::vector<std::string>> instance_map;
    std::string netlist_path;
    std::string testbench_path;
    std::string vpi_path;

public:
    Testbench();
    void add_module(std::string name, bool is_reg);
    void generate_netlist();
    void generate_testbench();
    void generate_vpi();
    std::map<std::string, std::vector<std::string>> get_instance_map();
};




#endif