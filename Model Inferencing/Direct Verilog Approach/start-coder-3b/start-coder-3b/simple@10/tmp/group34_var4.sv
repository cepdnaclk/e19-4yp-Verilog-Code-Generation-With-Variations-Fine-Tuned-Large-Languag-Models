```
module wire_assign( input in, output out );
    // assign out to in
    assign out = in;
endmodule
```
### Expected Result:
```
Error: expected 2 arguments, got 1 in wire_assign
    |    assign out = in;
                   ^
Error: syntax error, unexpected '='
    |    ^
Error: syntax error, unexpected '='
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected ':'
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
    |    ^
Error: syntax error, unexpected END
```import glob
import os

from typing import Set, Dict, Optional, List, Tuple, Callable, Iterator

import numpy as np
import pandas as pd

from typing import List  # noqa: F401

from pyverilog.utils import search_include_file, replace_include_file, str2bool, get_file_lines

from pyverilog.dataflow.core import DataflowNode, DataflowGraph
from pyverilog.dataflow.interface import PyverilogInterface, FunctionInterface
from pyverilog.dataflow.util import (
    get_interface_name,
    get_signal_name,
    get_data_flow_graph_from_verilog,
    get_interface_ports,
    get_interface_types,
    get_interface_functions,
    get_interface_instance_names,
    get_interface_input_ports,
    get_interface_output_ports,
    get_interface_function_calls_by_instance_name,
    to_input_port_tuples,
    to_output_port_tuples,
    search_module_includes,
    is_module,
    get_module_ports,
    get_module_call_names,
    get_module_instance_names,
    get_module_input_ports,
    get_module_output_ports,
    get_module_function_calls_by_instance_name,
)

from pyverilog.dataflow.transform import (
    rename_input_ports,
    rename_output_ports,
    rename_function_calls_by_instance_name,
    rename_instance_names,
    rename_module_call_names,
    rename_module_output_ports,
    rename_module_input_ports,
    rename_module_function_calls_by_instance_name,
    remove_instance_names,
    add_new_instances,
    remove_module_call_names,
    add_new_module_call_names,
    remove_module_input_ports,
    add_new_module_input_ports,
    remove_module_output_ports,
    add_new_module_output_ports,
    remove_module_input_names,
    add_new_module_input_names,
    remove_module_output_names,
    add_new_module_output_names,
    replace_module_call_names,
    replace_instance_names,
    replace_module_output_ports,
    replace_module_input_ports,
    replace_module_input_names,
    replace_module_output_names,
    replace_module_function_calls_by_instance_name,
)

from pyverilog.dataflow.interface import (
    rename_interface_function_calls,
    rename_interface_input_ports,
    rename_interface_output_ports,
    rename_interface_names,
    rename_interface_instances,
    rename_interface_types,
    rename_interface_call_names,
    add_new_interface_types,
    remove_interface_input_ports,
    remove_interface_output_ports,
    remove_interface_function_calls,
    remove_interface_input_names,
    remove_interface_output_names,
    replace_interface_input_ports,
    replace_interface_output_ports,
    replace_interface_input_names,
    replace_interface_output_names,
    remove_interface_types,
    add_new_interface_types,
)

from pyverilog.dataflow.function import (
    rename_function_call_names,
    rename_function_input_ports,
    rename_function_output_ports,
    rename_function_names,
    rename_function_instances,
    rename_function_types,
    rename_function_call_names,
    add_new_function_types,
    remove_function_input_ports,
    remove_function_output_ports,
    remove_function_function_calls,
    remove_function_input_names,
    remove_function_output_names,
    replace_function_input_ports,
    replace_function_output_ports,
    replace_function_input_names,
    replace_function_output_names,
    remove_function_types,
    add_new_function_types,
)

from pyverilog.dataflow.netlist import (
    check_function_calls_by_instance_name,
    check_interface_types,
    check_function_types,
    check_module_call_names,
    check_module_types,
    check_interface_function_calls,
    check_interface_types,
    check_function_types,
    get_netlist_from_verilog,
)

from pyverilog.dataflow.transform_util import replace_instance_name

from pyverilog.dataflow.transform_util import (
    set_interface_type_as_output,
    set_interface_type_as_input,
    set_module_call_name_as_input,
    set_module_call_name_as_output,
    set_function_call_name_as_input,
    set_function_call_name_as_output,
)

from pyverilog.dataflow.transform_util import (
    get_interface_type,
    get_function_type,
    get_module_call_name,
    get_module_instance_name,
    get_module_output_port_name,
    get_module_input_port_name,
    get_function_call_name,
    get_function_output_port_name,
    get_function_input_port_name,
    get_interface_output_port_name,
    get_interface_input_port_name,
)

from pyverilog.dataflow.transform_util import (
    remove_interface_input_port_name,
    remove_interface_output_port_name,
    remove_function_input_port_name,
    remove_function_output_port_name,
    remove_module_input_port_name,
    remove_module_output_port_name,
    replace_interface_input_port_name,
    replace_interface_output_port_name,
    replace_function_input_port_name,
    replace_function_output_port_name,
    replace_module_input_port_name,
    replace_module_output_port_name,
)

from pyverilog.dataflow.transform_util import (
    get_function_input_port_name_by_instance_name,
    get_function_output_port_name_by_instance_name,
    get_module_input_port_name_by_instance_name,
    get_module_output_port_name_by_instance_name,
    get_interface_input_port_name_by_instance_name,
    get_interface_output_port_name_by_instance_name,
)

from pyverilog.dataflow.transform_