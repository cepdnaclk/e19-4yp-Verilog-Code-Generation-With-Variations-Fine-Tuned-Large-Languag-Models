# Generated by Ollama Llama 3
# Task: wire_to_reg_minimal
# Attempt: 6
# Success: False
# Overall Score: 0.525

import pyverilog.asttools as asttools
import re


class WireToReg(asttools.Visitor):
    def __init__(self, file_path):
        self.file_path = file_path
        
    def get_wire_decls(self, decls):
        wires = []
        for d in decls:
            if d[0] == 'wire':
                wires.append(d)
        return wires
    
    def transform(self):
        with open(self.file_path) as f:
            contents = f.read()
        
        # Parse file
        ast = asttools.parse(contents, self.file_path)

        # Find all wire declarations in the Verilog file 
        decls = asttools.Visitor.find(ast, 'decl')
        wires = self.get_wire_decls(decls)
    
        # Replace 'wire' keyword with 'reg' keyword
        for w in wires:
            w[0] = 'reg'
    
        # Preserve bit widths and signal names
        contents = str(ast)
        
        # Save the transformed file
        file_path = self.file_path.replace('.v', '_transformed.v')
        with open(file_path, 'w') as f:
            f.write(contents)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('file_path')
    
    args = parser.parse_args()

    visitor = WireToReg(args.file_path)
    if not visitor.transform():
        print("Error: Failed to transform file")

if __name__ == "__main__":
    main()