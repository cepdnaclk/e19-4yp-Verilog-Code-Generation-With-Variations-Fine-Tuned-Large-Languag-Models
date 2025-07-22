module JerkyComparator (output[1:0] AdjustFreq, input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
always @(inside(0,1,2))
if (Reset==1'b1)
begin
    Adjr = 2'b01;
    HiCount = 2'b0;
end
else if (PLLClock==1'b1)
    HiCount = HiCount + 2'b01;
else begin
    case (HiCount)
        2'b00: Adjr = 2'b11;
        2'b01: Adjr = 2'b01;
        default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
end
endmodule
#!/bin/sh

# Copyright 2018-2023  (https://barrgroup.org)
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
#
# This file is part of the 'vitis_proc' module of the Vitis software platform.
#
# Copyright (c) 2017-2023, Vitis Software Corporation.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
#


#
# This is an example script to run on all your vitis_proc applications
#
#
# This script will find the Vivado tool and run the "check_proc" command
# for all the vitis_proc projects in this directory.
#
#

# Define the Vivado command -- if you have multiple versions of Vivado
# installed, then you can add the path to your preferred Vivado to the
# PATH environment variable.  For example, on my Linux machine, the Vivado
# command is:
#
#    /opt/xilinx/Vitis/2021.2/bin/vivado
#   
# On Windows, it might be:
#
#    C:/Vitis/2021.2/x86_64/tools/bin/vivado.bat
#
# The script will automatically locate the Vitis version that is used
# in the current directory and run the check_proc script using that
# version of Vivado.
#
# This script is an example of running vitis_proc on multiple versions
# of Vitis.  One alternative approach would be to create a new script
# that is specific to each Vitis version.  Then you would change the
# "check_proc" command to use the Vitis version in the new script.
#
#

VITIS_TOOL_PATH=`dirname $0`/tools/VIRo

# Determine version of Vitis tool used in current directory
VITIS_VERSION=`$VITIS_TOOL_PATH $0 --getVitisVersion`
echo "Vitis version used in this directory is: $VITIS_VERSION"

# Determine version of Vitis tool that is used in this script
VITIS_VERSION=`$VITIS_TOOL_PATH --getVitisVersion`
echo "Detected Vitis version is: $VITIS_VERSION"

# Only run the command if the Vitis versions match
if [[ "$VITIS_VERSION" == "$VITIS_VERSION_REQUIRED" ]]
then
  VITIS_EXE_PATH=`$VITIS_TOOL_PATH --getVitisExePath`
  $VITIS_EXE_PATH -mode batch -source $0 --check_proc
else
  echo "Error: Vitis tool used in this directory is different than the one used in script"
fi
#!/bin/bash
#
# Copyright 2023 The Regents of the University of California
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


#
# This script will help to convert the vitis-impl files to Vivado source
#

#
# Copyright 2017-2023, Vitis Software Corporation.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
#

#
VITIS_HOME=/opt/Xilinx/Vitis

#
# Determine the version of the currently-installed Vitis tools.  We look at
# the path to $0 because it will be the script that is executed when 
# the user just types the command.  The script will be expanded to an
# absolute path that includes the directory where this script lives.
#
#
VITIS_VERSION=`dirname $0 | sed -n's:.*Vitis\\(\([0-9]\)\.\([0-9]\)\.[0-9]\).*:\\1.\\2.3:p' | sed's/\.//g'`

# Use 2021.2 to avoid error "vitis_proc does not support 2022.1" in "vitis_proc -mode batch"
VITIS_VERSION=2022.3

#
# Determine version of Python used. 
#
PYTHON_VERSION=`python -V 2>&1 | sed -n's:.* \([0-9]\)\.([0-9]\).*:\\1.\\2:p'`

#
# Determine the path to the 'vitis_proc' command.
# If you used different names in the installation, then you would
# need to put the path to your vitis_proc command here.
#
VITIS_PROC_PATH=$VITIS_HOME/Vitis/xilinx_${VITIS_VERSION}/bin/vitis_proc

#
# Run the 'vitis_proc' command to convert the vitis-impl files to
# Vivado source files.
#

#
# Note that this script uses two environment variables to help it run
# the 'vitis_proc' command.  By setting these environment variables,
# we help it know where to find the Vitis tools, and where to find
# Python.  The user does not need to set these variables, but then
# the script will not be able to find the Vitis tools and Python.
#
# The first environment variable is 'VITIS_HOME', and the second
# environment variable is 'PYTHONHOME'.  If VITIS_HOME is set,
# then it is used to find the 'vitis_proc' command.  If VITIS_HOME
# is not set, then it is assumed that the user has installed the 
# Vitis tools into the default directory:
#
#      /opt/Xilinx/Vitis/xilinx_Vitis<version>
#
# If the 'VITIS_HOME' environment variable is not set, then we will