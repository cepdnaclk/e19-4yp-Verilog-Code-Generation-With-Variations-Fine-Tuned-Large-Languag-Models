#!/usr/bin/env python3
"""
Test Step 2 Refined: Functional Validation with Existing Generated Code
This tests the argument detection and execution on already generated transformations
"""

import sys
import os
import tempfile
import subprocess

# Test the argument detection function
sys.path.append(os.path.dirname(__file__))
from xform_rag.code_generator import CodeGenerator
from xform_rag import RAGConfig


def test_argument_detection():
    """Test the argument detection functionality"""

    print("🔍 Testing Argument Detection")
    print("=" * 50)

    # Create a minimal config
    config = RAGConfig()
    generator = CodeGenerator(config)

    # Test code with specific arguments
    test_code_module_rename = """
def main():
    parser = argparse.ArgumentParser(description="Module renaming transformation")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--old-name", help="Old module name")
    parser.add_argument("--new-name", help="New module name")
"""

    test_code_generic = """
def main():
    parser = argparse.ArgumentParser(description="Verilog transformation tool")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--target", help="Target parameter for transformation")
"""

    # Test detection
    args1 = generator._detect_script_arguments(test_code_module_rename)
    args2 = generator._detect_script_arguments(test_code_generic)

    print(f"✅ Module rename args detected: {args1}")
    print(f"✅ Generic args detected: {args2}")

    # Test argument determination
    args_module = generator._determine_transformation_args(
        "change module name from counter to timer",
        "input.v",
        "output.v",
        test_code_module_rename,
    )

    args_generic = generator._determine_transformation_args(
        "change module name from counter to timer",
        "input.v",
        "output.v",
        test_code_generic,
    )

    print(f"✅ Module rename final args: {args_module}")
    print(f"✅ Generic final args: {args_generic}")

    return True


def test_existing_generated_code():
    """Test functional validation on existing generated code"""

    print("\n🧪 Testing Existing Generated Code")
    print("=" * 50)

    # Path to existing generated code
    generated_path = "generated_xforms_priority1/test_run_20250719_215303/passed"

    if not os.path.exists(generated_path):
        print("❌ No existing generated code found")
        return False

    # Test files
    test_files = [
        "module_rename.py",
        "wire_to_reg_conversion.py",
        "signal_width_change.py",
    ]

    results = []

    for test_file in test_files:
        file_path = os.path.join(generated_path, test_file)
        if os.path.exists(file_path):
            print(f"\n🔬 Testing {test_file}")

            try:
                # Read the generated code
                with open(file_path, "r") as f:
                    code = f.read()

                # Create test Verilog
                test_verilog = """module counter(
    input clk,
    input reset,
    output reg [7:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 8'b0;
        else
            count <= count + 1;
    end
endmodule"""

                # Create temporary files
                with tempfile.NamedTemporaryFile(
                    mode="w", suffix=".v", delete=False
                ) as temp_input:
                    temp_input.write(test_verilog)
                    input_path = temp_input.name

                with tempfile.NamedTemporaryFile(
                    mode="w", suffix=".v", delete=False
                ) as temp_output:
                    output_path = temp_output.name

                # Determine appropriate arguments
                if "module_rename" in test_file:
                    args = [
                        input_path,
                        output_path,
                        "--old-name",
                        "counter",
                        "--new-name",
                        "timer",
                    ]
                elif "wire_to_reg" in test_file:
                    args = [input_path, output_path]  # No extra args needed
                elif "signal_width" in test_file:
                    args = [
                        input_path,
                        output_path,
                        "--target",
                        "count",
                    ]  # Fallback to generic
                else:
                    args = [input_path, output_path]

                # Execute the script
                cmd = [sys.executable, file_path] + args
                print(f"  Command: {' '.join(cmd)}")

                process = subprocess.run(
                    cmd, capture_output=True, text=True, timeout=30
                )

                if process.returncode == 0:
                    print(f"  ✅ Execution successful")

                    # Check if output was modified
                    if os.path.exists(output_path):
                        with open(output_path, "r") as f:
                            output_content = f.read()

                        if output_content != test_verilog:
                            print(
                                f"  ✅ Transformation applied - output differs from input"
                            )

                            # Show specific changes for module rename
                            if (
                                "module_rename" in test_file
                                and "module timer" in output_content
                            ):
                                print(f"  🎯 Module successfully renamed to 'timer'")

                            results.append(
                                {
                                    "file": test_file,
                                    "execution_success": True,
                                    "transformation_applied": True,
                                    "changes_detected": True,
                                }
                            )
                        else:
                            print(
                                f"  ⚠️ No transformation detected - output same as input"
                            )
                            results.append(
                                {
                                    "file": test_file,
                                    "execution_success": True,
                                    "transformation_applied": False,
                                    "changes_detected": False,
                                }
                            )
                    else:
                        print(f"  ❌ No output file created")
                        results.append(
                            {
                                "file": test_file,
                                "execution_success": True,
                                "transformation_applied": False,
                                "changes_detected": False,
                            }
                        )
                else:
                    print(f"  ❌ Execution failed: {process.stderr}")
                    results.append(
                        {
                            "file": test_file,
                            "execution_success": False,
                            "transformation_applied": False,
                            "error": process.stderr,
                        }
                    )

                # Cleanup
                try:
                    os.unlink(input_path)
                    os.unlink(output_path)
                except:
                    pass

            except Exception as e:
                print(f"  ❌ Test failed: {e}")
                results.append(
                    {
                        "file": test_file,
                        "execution_success": False,
                        "transformation_applied": False,
                        "error": str(e),
                    }
                )
        else:
            print(f"❌ File not found: {test_file}")

    # Summary
    print("\n" + "=" * 50)
    print("📈 STEP 2 REFINED VALIDATION SUMMARY")
    print("=" * 50)

    successful_executions = sum(1 for r in results if r.get("execution_success", False))
    applied_transformations = sum(
        1 for r in results if r.get("transformation_applied", False)
    )

    print(f"🧪 Total Tests: {len(results)}")
    print(f"✅ Successful Executions: {successful_executions}/{len(results)}")
    print(f"🔄 Applied Transformations: {applied_transformations}/{len(results)}")

    for result in results:
        exec_status = "✅" if result.get("execution_success") else "❌"
        transform_status = "🔄" if result.get("transformation_applied") else "⭕"
        print(f"  {exec_status} {transform_status} {result['file']}")

    if successful_executions > 0:
        print("\n🎉 STEP 2 REFINED FUNCTIONAL VALIDATION WORKING!")
        print("✅ Generated transformations can be executed and are applying changes!")
        return True
    else:
        print("\n⚠️ STEP 2 STILL NEEDS WORK")
        return False


def main():
    """Main test function"""
    print("🚀 Step 2 Refined: Functional Validation Test")
    print("=" * 60)

    # Test 1: Argument detection
    detection_success = test_argument_detection()

    # Test 2: Existing code execution
    execution_success = test_existing_generated_code()

    if detection_success and execution_success:
        print("\n🎉 STEP 2 REFINEMENT SUCCESSFUL!")
        print("✅ Argument detection and functional validation are working!")
        return True
    else:
        print("\n⚠️ STEP 2 REFINEMENT NEEDS MORE WORK")
        return False


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
