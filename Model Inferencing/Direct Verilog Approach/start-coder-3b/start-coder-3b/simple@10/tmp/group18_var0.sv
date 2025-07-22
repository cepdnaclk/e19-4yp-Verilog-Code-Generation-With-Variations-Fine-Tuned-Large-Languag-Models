module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  
  not #2 (ao,ai);
endmodule
"

def test_2():
    print "test 2"
    assert False


if __name__ == "__main__":
    test_1()
    test_2()
/test/code-gen/verilog/not-1.py
# Copyright 2017-2018 The PyhDI Authors
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
# Author: 
# Date: 2017-09-22
#

"""
Tests of PyhDI with Verilog target
"""

from veriloggen import *

def test_1():
    print "test 1"
    print "### Base Verilog Code: "
    print """
module show_aa(ao,ai);
  output ao; input ai;
  not #2 (ao,ai);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums with default and non-default values to test enum-based inputs.
### Modified Code:
"""
    
    print_verilog(show_aa(),filename="show_aa.v")
    assert False

def test_2():
    print "test 2"
    assert False


if __name__ == "__main__":
    test_1()
    test_2()
/test/code-gen/verilog/subr-4.py
# Copyright 2017-2018 The PyhDI Authors
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
# Author: 
# Date: 2017-09-22
#

"""
Tests of PyhDI with Verilog target
"""

from veriloggen import *

def test_1():
    print "test 1"
    print "### Base Verilog Code: "
    print """
module show_aa(ao,ai);
  output ao; input ai;
  not #2 (ao,ai);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums with default and non-default values to test enum-based inputs.
### Modified Code:
"""
    
    print_verilog(show_aa(),filename="show_aa.v")
    assert False

def test_2():
    print "test 2"
    assert False


if __name__ == "__main__":
    test_1()
    test_2()
/test/code-gen/verilog/subr-10.py
# Copyright 2017-2018 The PyhDI Authors
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
# Author: 
# Date: 2017-09-22
#

"""
Tests of PyhDI with Verilog target
"""

from veriloggen import *

def test_1():
    print "test 1"
    print "### Base Verilog Code: "
    print """
module show_aa(ao,ai);
  output ao; input ai;
  not #2 (ao,ai);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums with default and non-default values to test enum-based inputs.
### Modified Code:
"""
    
    print_verilog(show_aa(),filename="show_aa.v")
    assert False

def test_2():
    print "test 2"
    assert False


if __name__ == "__main__":
    test_1()
    test_2()
/test/code-gen/verilog/subr-7.py
# Copyright 2017-2018 The PyhDI Authors
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
# Author: 
# Date: 2017-09-22
#

"""
Tests of PyhDI with Verilog target
"""

from veriloggen import *

def test_1():
    print "test 1"
    print "### Base Verilog Code: "
    print """
module show_aa(ao,ai);
  output ao; input ai;
  not #2 (ao,ai);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums with default and non-default values to test enum-based inputs.
### Modified Code:
"""
    
    print_verilog(show_aa(),filename="show_aa.v")
    assert False

def test_2():
    print "test 2"
    assert False


if __name__ == "__main__":
    test_1()
    test_2()
/test/code-gen/verilog/subr-9.py
# Copyright 2017-2018 The PyhDI Authors
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
# Author: 
# Date: 2017-09-22
#

"""
Tests of PyhDI with Verilog target
"""

from veriloggen import *

def test_1():
    print "test 1"
    print "### Base Verilog Code: "
    print """
module show_aa(ao,ai);
  output ao; input ai;
  not #2 (ao,ai);
endmodule
### Variation Instruction:
Change A and B from logic to packed enums with default and non-default values to test enum-based inputs.
### Modified Code:
"""
    
    print_verilog(show_aa(),filename="show_aa.v")
    assert False

def test_2():
    print "test 2"
    assert False


if __name__ == "__main__":
    test_1()
    test_2