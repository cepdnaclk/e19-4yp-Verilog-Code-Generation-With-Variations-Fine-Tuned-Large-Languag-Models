#!/usr/bin/env python3
"""
Test Step 2 fixes - Verify that code fixing resolves common issues
"""

import os
import sys
import json
import tempfile
import subprocess
from pathlib import Path

# Add the project root to the path
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))


def test_code_fixes():
    """Test the automatic code fixing functionality"""

    from xform_rag.code_generator import CodeGenerator

    # Create a minimal config for testing
    class MockConfig:
        def __init__(self):
            self.vector_store_path = "test_vector_store"
            self.llm_base_url = "http://localhost:11434"
            self.llm_model = "codellama:7b"
            self.chunk_size = 500
            self.chunk_overlap = 50

    config = MockConfig()

    # Initialize code generator (this might fail if LLM not available, but we only need the fixing function)
    try:
        generator = CodeGenerator(config)
    except Exception as e:
        print(
            f"Warning: Could not initialize full CodeGenerator ({e}), testing fixes only..."
        )
        # Create a minimal generator instance just for testing the fix function
        generator = type("MockGenerator", (), {})()

        # Import the fix function directly
        import sys
        import os
        import re

        def _fix_generated_code(self, code_content: str, xform_type: str) -> str:
            """Fix common issues in generated code"""
            fixed_code = code_content

            # Fix 1: Remove NodeVisitor inheritance if present
            fixed_code = re.sub(
                r"class\s+TransformationVisitor\s*\(\s*NodeVisitor\s*\):",
                "class TransformationVisitor:",
                fixed_code,
            )

            # Fix 2: Add required imports if missing
            if "from pyverilog.vparser.ast import *" not in fixed_code:
                import_section = """#!/usr/bin/env python3
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *"""

                # Replace existing import section
                fixed_code = re.sub(
                    r"#!/usr/bin/env python3.*?(?=class)",
                    import_section + "\n\n",
                    fixed_code,
                    flags=re.DOTALL,
                )

            # Fix 3: Correct argument patterns based on transformation type
            if "wire" in xform_type.lower() and "reg" in xform_type.lower():
                # Wire to reg transformation - should use --signal
                fixed_code = re.sub(
                    r'parser\.add_argument\("--old-name".*?\n.*?parser\.add_argument\("--new-name".*?\n',
                    'parser.add_argument("--signal", help="Specific signal name to convert")\n',
                    fixed_code,
                    flags=re.DOTALL,
                )

            elif "signal" in xform_type.lower() and "width" in xform_type.lower():
                # Signal width transformation - should use --signal and --width
                fixed_code = re.sub(
                    r'parser\.add_argument\("--old-name".*?\n.*?parser\.add_argument\("--new-name".*?\n',
                    'parser.add_argument("--signal", help="Signal name to modify")\n    parser.add_argument("--width", help="New width value")\n',
                    fixed_code,
                    flags=re.DOTALL,
                )

            # Fix 4: Update function signatures to match arguments
            if (
                "--signal" in fixed_code
                and "old_name=None, new_name=None" in fixed_code
            ):
                fixed_code = re.sub(
                    r"def transform_operation\(input_file, output_file, old_name=None, new_name=None\):",
                    "def transform_operation(input_file, output_file, signal=None, width=None):",
                    fixed_code,
                )

                # Update visitor initialization
                fixed_code = re.sub(
                    r"visitor = TransformationVisitor\(old_name, new_name\)",
                    "visitor = TransformationVisitor(signal, width)",
                    fixed_code,
                )

                # Update class init
                fixed_code = re.sub(
                    r"def __init__\(self, old_name=None, new_name=None\):",
                    "def __init__(self, signal=None, width=None):",
                    fixed_code,
                )

                fixed_code = re.sub(
                    r"self\.old_name = old_name\s*\n\s*self\.new_name = new_name",
                    "self.signal = signal\n        self.width = width",
                    fixed_code,
                )

                # Fix the main function call
                fixed_code = re.sub(
                    r"success = transform_operation\(args\.input_file, args\.output_file, args\.old_name, args\.new_name\)",
                    'success = transform_operation(args.input_file, args.output_file, args.signal, getattr(args, "width", None))',
                    fixed_code,
                )

            return fixed_code

        generator._fix_generated_code = _fix_generated_code.__get__(
            generator, type(generator)
        )

    # Test case 1: Fix NodeVisitor inheritance issue
    problematic_code_1 = """#!/usr/bin/env python3
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse

class TransformationVisitor(NodeVisitor):
    def __init__(self, signal=None):
        self.signal = signal
        self.changes_made = []
"""

    print("Testing Fix 1: NodeVisitor inheritance removal...")
    fixed_code_1 = generator._fix_generated_code(
        problematic_code_1, "wire to reg conversion"
    )

    if (
        "class TransformationVisitor:" in fixed_code_1
        and "NodeVisitor" not in fixed_code_1.split("\n")[6]
    ):
        print("✅ Fix 1 successful: NodeVisitor inheritance removed")
    else:
        print("❌ Fix 1 failed: NodeVisitor inheritance still present")
        print(
            f"Fixed line: {[line for line in fixed_code_1.split('\n') if 'class TransformationVisitor' in line][0]}"
        )

    # Test case 2: Fix missing imports
    problematic_code_2 = """#!/usr/bin/env python3
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse

class TransformationVisitor:
    def __init__(self, signal=None):
        self.signal = signal
"""

    print("\nTesting Fix 2: Adding missing ast imports...")
    fixed_code_2 = generator._fix_generated_code(
        problematic_code_2, "wire to reg conversion"
    )

    if "from pyverilog.vparser.ast import *" in fixed_code_2:
        print("✅ Fix 2 successful: AST imports added")
    else:
        print("❌ Fix 2 failed: AST imports missing")
        print("Import lines:")
        for line in fixed_code_2.split("\n")[:10]:
            if "import" in line:
                print(f"  {line}")

    # Test case 3: Fix argument patterns for wire-to-reg
    problematic_code_3 = """def main():
    parser = argparse.ArgumentParser(description="Wire to reg conversion")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--old-name", help="Old module name")
    parser.add_argument("--new-name", help="New module name")
    
    args = parser.parse_args()
"""

    print("\nTesting Fix 3: Wire-to-reg argument pattern...")
    fixed_code_3 = generator._fix_generated_code(
        problematic_code_3, "wire to reg conversion"
    )

    if "--signal" in fixed_code_3 and "--old-name" not in fixed_code_3:
        print("✅ Fix 3 successful: Arguments corrected for wire-to-reg")
    else:
        print("❌ Fix 3 failed: Arguments not corrected")
        print("Arguments found:")
        for line in fixed_code_3.split("\n"):
            if "add_argument" in line and "--" in line:
                print(f"  {line.strip()}")

    print("\n" + "=" * 60)
    print("TESTING FIXES ON ACTUAL PROBLEMATIC FILES")
    print("=" * 60)

    # Test fixes on real problematic files
    test_files = [
        "generated_xforms_priority1/test_run_20250719_215303/passed/wire_to_reg_conversion.py",
        "generated_xforms_priority1/test_run_20250719_215303/passed/signal_width_change.py",
    ]

    for test_file in test_files:
        file_path = project_root / test_file
        if file_path.exists():
            print(f"\nTesting fixes on: {test_file}")

            with open(file_path, "r") as f:
                original_code = f.read()

            # Apply fixes
            xform_type = "wire to reg" if "wire_to_reg" in test_file else "signal width"
            fixed_code = generator._fix_generated_code(original_code, xform_type)

            # Save fixed version
            fixed_file = file_path.parent / f"fixed_{file_path.name}"
            with open(fixed_file, "w") as f:
                f.write(fixed_code)

            print(f"✅ Fixed version saved to: {fixed_file}")

            # Test execution of fixed version
            test_verilog = """module counter(
    input wire clk,
    input wire reset,
    output wire [7:0] count
);
    wire internal_signal;
    reg [7:0] counter_reg;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter_reg <= 8'b0;
        else
            counter_reg <= counter_reg + 1;
    end
    
    assign count = counter_reg;
endmodule"""

            # Create temporary test files
            with tempfile.NamedTemporaryFile(
                mode="w", suffix=".v", delete=False
            ) as temp_input:
                temp_input.write(test_verilog)
                temp_input_path = temp_input.name

            with tempfile.NamedTemporaryFile(
                mode="w", suffix=".v", delete=False
            ) as temp_output:
                temp_output_path = temp_output.name

            try:
                # Test the fixed script
                if "wire_to_reg" in test_file:
                    cmd = [
                        sys.executable,
                        str(fixed_file),
                        temp_input_path,
                        temp_output_path,
                        "--signal",
                        "internal_signal",
                    ]
                else:
                    cmd = [
                        sys.executable,
                        str(fixed_file),
                        temp_input_path,
                        temp_output_path,
                        "--signal",
                        "counter_reg",
                        "--width",
                        "16",
                    ]

                result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)

                if result.returncode == 0:
                    print(f"✅ Fixed script executed successfully!")
                    if os.path.exists(temp_output_path):
                        with open(temp_output_path, "r") as f:
                            output_content = f.read()
                        print(f"  Output generated ({len(output_content)} characters)")
                else:
                    print(
                        f"❌ Fixed script failed with return code: {result.returncode}"
                    )
                    print(f"  Error: {result.stderr}")

            except subprocess.TimeoutExpired:
                print(f"❌ Fixed script timed out")
            except Exception as e:
                print(f"❌ Error testing fixed script: {e}")
            finally:
                # Cleanup
                try:
                    os.unlink(temp_input_path)
                    os.unlink(temp_output_path)
                except:
                    pass
        else:
            print(f"❌ Test file not found: {test_file}")


if __name__ == "__main__":
    print("Step 2 Fixes Validation Test")
    print("=" * 60)
    test_code_fixes()
    print("\nTest completed!")
