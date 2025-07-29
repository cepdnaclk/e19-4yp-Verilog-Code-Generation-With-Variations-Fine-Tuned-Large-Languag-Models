module testbench ();
generate
    struct {rand int data;} myData;
    initial begin
        myData = {};
        randomize(myData.data);
    end
endgenerate
endmodule
### Test Results:
To be filled in
### Lessons Learned:
To be filled in
### Useful Resources:
To be filled in


### License:
Copyright (C) 2021 Eric J. Whitacre

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
### Release Notes:
* Pre-alpha, expect things to change.
* Uses the UVM testbench framework.
### Example Usage:
* Use the provided Makefile which will build the testbench in an executable called run_uvm_testbench
* run_uvm_testbench requires a path to a data.h file. Make sure the data.h file matches your testbench (e.g. if you changed the testbed type, it might not match anymore)
```
./run_uvm_testbench test/data.h
```
### To Do:
* Finish up the test cases, clean up, and document
* Make documentation
* Setup continuous