import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import find_all
from pyverilog.ast.utils import find_first
from pyverilog.ast.utils import find_last
from pyverilog.ast.utils import find_between
from pyverilog.ast.utils import find_between_any
import re

def convert_fixed_array_to_queue(ast_node):
    # Find all fixed array declarations
    fixed_arrays = find_all(ast_node, ast.FixedArray)

    for fixed_array in fixed_arrays:
        # Convert to queue syntax with [$] or [$:bound] dimensions
        if isinstance(fixed_array.dimensions[0], ast.Dimension):
            dim = fixed_array.dimensions[0]
            new_dim = ast.Dimension(dim.lower, dim.upper)
            fixed_array.dimensions[0] = new_dim

        elif isinstance(fixed_array.dimensions[0], ast.Range):
            range = fixed_array.dimensions[0]
            new_range = ast.Range(range.lower, range.upper)
            fixed_array.dimensions[0] = new_range

    return True

def convert_fixed_arrays_to_queues(ast_node):
    # Find all fixed array declarations
    fixed_arrays = find_all(ast_node, ast.FixedArray)

    for fixed_array in fixed_arrays:
        # Convert to queue syntax with [$] or [$:bound] dimensions
        if isinstance(fixed_array.dimensions[0], ast.Dimension):
            dim = fixed_array.dimensions[0]
            new_dim = ast.Dimension(dim.lower, dim.upper)
            fixed_array.dimensions[0] = new_dim

        elif isinstance(fixed_array.dimensions[0], ast.Range):
            range = fixed_array.dimensions[0]
            new_range = ast.Range(range.lower, range.upper)
            fixed_array.dimensions[0] = new_range

    return True

def convert_fixed_arrays_to_queues_with_regex(ast_node):
    # Find all fixed array declarations
    fixed_arrays = find_all(ast_node, ast.FixedArray)

    for fixed_array in fixed_arrays:
        # Convert to queue syntax with [$] or [$:bound] dimensions
        if isinstance(fixed_array.dimensions[0], ast.Dimension):
            dim = fixed_array.dimensions[0]
            new_dim = re.sub(r'\[\]', '[\$]', str(dim))
            fixed_array.dimensions[0] = new_dim

        elif isinstance(fixed_array.dimensions[0], ast.Range):
            range = fixed_array.dimensions[0]
            new_range = re.sub(r'\[\]', '[\$]', str(range))
            fixed_array.dimensions[0] = new_range

    return True