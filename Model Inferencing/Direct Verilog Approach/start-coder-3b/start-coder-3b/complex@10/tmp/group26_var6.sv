```
module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);

reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;

// Interface Scope
int i; // Declare array size here
int A[8] = {
    i == 0: 'b1,1,3,9,15,16,16,16,
    i == 1: 11,17,20,31,31,31,31,31,
    i == 2: 31,31,31,31,31,31,31,31,
    i == 3: 31,31,31,31,31,31,31,31
};

always @(ClockIn, Reset)
if (Reset==1'b1)
begin
    Adjr = 2'b01;
    HiCount = 2'b0;
end
else if (PLLClock==1'b1)
    HiCount = HiCount + 2'b01;
else begin
    case (HiCount)
        A[i]: Adjr = 2'b11;
        A[i]: Adjr = 2'b01;
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
end

endmodule
```
### Expected Output:
```
[Info] 1:01:31 [JerkyComparator] Checking for Jerky Comparator
[Info] 1:01:31 [JerkyComparator] Found Jerky Comparator
[Info] 1:01:31 [JerkyComparator] Testing Jerky Comparator
[Info] 1:01:31 [JerkyComparator] Test passed
```
/testbench/Testbench.py
# -*- coding: utf-8 -*-
################################################################################
#
# Copyright 2017 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

"""
Test Benches
"""

import os
import sys

from jinja2 import Template

def createFile(path, name, directory, parameters, outputParameters, output=None, data=None):
    """
    Create a testBench file
    """
    # Create path and directory
    if not os.path.exists(path):
        os.makedirs(path)
    if not os.path.exists(directory):
        os.makedirs(directory)
        
    # Create Test File
    testFile = os.path.join(directory, name)
    try:
        if outputParameters:
            # Create test bench template
            template = Template(open(testFile+'.j2', 'r').read())
            print("Creating "+testFile+".v files.")
            # Create test bench files
            with open(testFile+'.v', 'w') as f:
                f.write(template.render(parameters=parameters, outputParameters=outputParameters, data=data))
            print("  - "+testFile+".v File Created")
        else:
            # Create test bench template
            template = Template(open(testFile+'.j2', 'r').read())
            with open(testFile+'.v', 'w') as f:
                print("Creating "+testFile+".v file.")
                # Create test bench file
                f.write(template.render(parameters=parameters, data=data))
                print("  - "+testFile+".v File Created")
    except Exception as e:
        print('ERROR:',e)
        sys.exit(1)
/requirements.txt
wheel
verilogparse
jinja2
/testbench/PllFrequencyComparator.py
# -*- coding: utf-8 -*-
################################################################################
#
# Copyright 2017 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

"""
Pll Frequency Comparator Test
"""

import os

from Verilated import Verilated
from jinja2 import Template

from Testbench import createFile
from Test import test

def create(directory, parameters, outputParameters, data):
    """
    Create a PLL Frequency Comparator test bench
    """
    # Create verilog test bench file
    
    # Create parameters
    template = Template(open('testbench/PLLFrequencyComparator.j2', 'r').read())
    parameters['module'] = 'PLLFrequencyComparator'
    parameters['template'] = template.render(parameters=parameters, outputParameters=outputParameters, data=data)
    # Create test bench file
    createFile(directory, 'PLLFrequencyComparator', 'testbench', parameters, outputParameters)
    
    # Check if Verilog Test bench is correct
    if Verilated(parameters['module']+'.v'):
        print("  - "+parameters['module']+'.v File Created")
    else:
        print("    ERROR: "+parameters['module']+'.v File Failed Verification')
        return False
    
    # Create test command
    testCommand =''.join(['vvp','-N','testbench/'+parameters['module']+'.v','+'.join(['+{0}={1}'.format(k, v) for k, v in parameters.items()])])
    parameters['testCommand'] = testCommand
    # Create test bench file
    createFile('test', 'Test.log', 'testbench', parameters)
    
    # Create test file
    testFile = os.path.join('testbench', parameters['module'])
    result = test(testFile, parameters['testCommand'])
    return result
/testbench/JerkyComparator.py
# -*- coding: utf-8 -*-
################################################################################
#
# Copyright 2017 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

"""
Jerky Comparator Test
"""

import os

from Verilated import Verilated
from jinja2 import Template

from Testbench import createFile
from Test import test

def create(directory, parameters, outputParameters, data):
    """
    Create a Jerky Comparator test bench
    """
    # Create verilog test bench file
    
    # Create parameters
    template = Template(open('testbench/JerkyComparator.j2', 'r').read())
    parameters['module'] = 'JerkyComparator'
    parameters['template'] = template.render(parameters=parameters, outputParameters=outputParameters, data=data)
    # Create test bench file
    createFile(directory, 'JerkyComparator', 'testbench', parameters, outputParameters)
    
    # Check if Verilog Test bench is correct
    if Verilated(parameters['module']+'.v'):
        print("  - "+parameters['module']+'.v File Created')
    else:
        print("    ERROR: "+parameters['module']+'.v File Failed Verification')
        return False
    
    # Create test command
    testCommand =''.join(['vvp','-N','testbench/'+parameters['module']+'.v','+'.join(['+{0}={1}'.format(k, v) for k, v in parameters.items()])])
    parameters['testCommand'] = testCommand
    # Create test bench file
    createFile('test', 'Test.log', 'testbench', parameters)
    
    # Create test file
    testFile = os.path.join('testbench', parameters['module'])
    result = test(testFile, parameters['testCommand'])
    return result
/testbench/Comparator.py
# -*- coding: utf-8 -*-
################################################################################
#
# Copyright 2017 
#
# Licensed