import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast.utils import find_all
from pyverilog.ast.utils import find_first
from pyverilog.ast.utils import find_last
from pyverilog.ast.utils import find_between
from pyverilog.ast.utils import find_between_any
import re

def convert_signals_to_structs(ast):
    # Find all signal declarations
    signals = find_all(ast, vtools.is_signal_declaration)

    # Convert to struct/union types (packed/unpacked)
    for s in signals:
        if isinstance(s.type, vtools.StructType) or isinstance(s.type, vtools.UnionType):
            continue

        if isinstance(s.type, vtools.ArrayType):
            array_type = s.type
            array_type.type = convert_signals_to_structs(array_type.type)

        elif isinstance(s.type, vtools.BitVectorType):
            bit_vector_type = s.type
            bit_vector_type.type = convert_signals_to_structs(bit_vector_type.type)
        
        else:
            # Convert to struct/union types (packed/unpacked)
            if isinstance(s.type, vtools.Type):
                type_ = s.type
                type_.type = convert_signals_to_structs(type_.type)

    return ast

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("filename", help="Verilog file to parse")
    args = parser.parse_args()

    with open(args.filename) as f:
        text = f.read()

    # Parse the Verilog code
    ast = parse(text)
    
    # Convert signals to struct/union types (packed/unpacked)
    converted_ast = convert_signals_to_structs(ast)

    # Generate the transformed Verilog code
    transformed_text = vtools.gen_code(converted_ast)

    print(transformed_text)

if __name__ == "__main__":
    main()