#!/usr/bin/env python3
"""
Example usage script for the Xform RAG Pipeline
This demonstrates various ways to use the system and shows expected workflows.
"""

import os
import sys
import json
import subprocess
from pathlib import Path
import time


def run_command(cmd, description=""):
    """Run a command and return the result"""
    print(f"\n{'='*60}")
    print(f"RUNNING: {description}")
    print(f"COMMAND: {cmd}")
    print(f"{'='*60}")

    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        print("STDOUT:")
        print(result.stdout)
        if result.stderr:
            print("STDERR:")
            print(result.stderr)
        return result.returncode == 0
    except Exception as e:
        print(f"Error running command: {e}")
        return False


def demo_basic_setup():
    """Demonstrate basic setup and initialization"""
    print("\n" + "=" * 80)
    print("DEMO: Basic Setup and Initialization")
    print("=" * 80)

    # Check if we can list transformations (this initializes the vector store)
    success = run_command(
        "python rag_pipeline.py list",
        "Initialize system and list existing transformations",
    )

    if success:
        print("✅ System initialization successful!")
    else:
        print("❌ System initialization failed!")

    return success


def demo_simple_generation():
    """Demonstrate simple transformation generation"""
    print("\n" + "=" * 80)
    print("DEMO: Simple Transformation Generation")
    print("=" * 80)

    examples = [
        "Add debug output ports to a module",
        "Convert register to wire with continuous assignment",
        "Add parameter for bus width configuration",
        "Insert pipeline registers between modules",
    ]

    for i, example in enumerate(examples, 1):
        print(f"\n--- Example {i}: {example} ---")

        success = run_command(
            f'python rag_pipeline.py generate "{example}"',
            f"Generate transformation for: {example}",
        )

        if success:
            print(f"✅ Generation {i} successful!")
        else:
            print(f"❌ Generation {i} failed!")

        # Small delay between generations
        time.sleep(2)


def demo_advanced_generation():
    """Demonstrate advanced transformation scenarios"""
    print("\n" + "=" * 80)
    print("DEMO: Advanced Transformation Generation")
    print("=" * 80)

    advanced_examples = [
        {
            "request": "Transform module to use SystemVerilog interfaces for data communication",
            "description": "Complex interface transformation",
        },
        {
            "request": "Add configurable delay line with parameterizable depth and enable",
            "description": "Parameterized delay logic",
        },
        {
            "request": "Convert blocking assignments to non-blocking with proper clocking",
            "description": "Assignment type transformation",
        },
        {
            "request": "Add error correction code generation and checking logic",
            "description": "Error handling insertion",
        },
    ]

    for i, example in enumerate(advanced_examples, 1):
        print(f"\n--- Advanced Example {i}: {example['description']} ---")

        success = run_command(
            f'python rag_pipeline.py generate "{example["request"]}"',
            example["description"],
        )

        if success:
            print(f"✅ Advanced generation {i} successful!")
        else:
            print(f"❌ Advanced generation {i} failed!")


def demo_model_switching():
    """Demonstrate switching between different models"""
    print("\n" + "=" * 80)
    print("DEMO: Model Switching")
    print("=" * 80)

    # Test with different Ollama models
    models = ["codellama:7b", "deepseek-coder:6.7b"]
    test_request = "Add reset synchronizer to module inputs"

    for model in models:
        print(f"\n--- Testing with model: {model} ---")

        # Check if model is available
        check_cmd = f"ollama list | grep {model.split(':')[0]}"
        if run_command(check_cmd, f"Check if {model} is available"):
            success = run_command(
                f'python rag_pipeline.py --model-name {model} generate "{test_request}"',
                f"Generate with {model}",
            )

            if success:
                print(f"✅ Generation with {model} successful!")
            else:
                print(f"❌ Generation with {model} failed!")
        else:
            print(f"⚠️ Model {model} not available, skipping...")


def demo_batch_generation():
    """Demonstrate batch generation of multiple transformations"""
    print("\n" + "=" * 80)
    print("DEMO: Batch Generation")
    print("=" * 80)

    batch_requests = [
        "Add assertion for signal range checking",
        "Convert combinational logic to look-up table",
        "Add test mode bypass for normal operation",
        "Insert scan chain for design-for-test",
        "Add power management clock gating",
    ]

    successful = 0
    total = len(batch_requests)

    for i, request in enumerate(batch_requests, 1):
        print(f"\n--- Batch Item {i}/{total}: {request[:50]}... ---")

        success = run_command(
            f'python rag_pipeline.py generate "{request}"', f"Batch generation {i}"
        )

        if success:
            successful += 1
            print(f"✅ Batch item {i} successful!")
        else:
            print(f"❌ Batch item {i} failed!")

    print(f"\n📊 Batch Generation Summary: {successful}/{total} successful")


def analyze_generated_files():
    """Analyze the generated files and show statistics"""
    print("\n" + "=" * 80)
    print("ANALYSIS: Generated Files")
    print("=" * 80)

    generated_dir = Path("./generated")

    if not generated_dir.exists():
        print("❌ No generated directory found!")
        return

    # Count files
    py_files = list(generated_dir.glob("*.py"))
    json_files = list(generated_dir.glob("*.json"))

    print(f"📁 Generated directory contents:")
    print(f"   Python files: {len(py_files)}")
    print(f"   Metadata files: {len(json_files)}")

    # Show file details
    for py_file in py_files[:5]:  # Show first 5 files
        print(f"\n📄 {py_file.name}:")

        # Get file size
        size = py_file.stat().st_size
        print(f"   Size: {size} bytes")

        # Check metadata
        metadata_file = generated_dir / f"{py_file.name}.metadata.json"
        if metadata_file.exists():
            try:
                with open(metadata_file) as f:
                    metadata = json.load(f)
                print(f"   Request: {metadata.get('user_request', 'N/A')[:60]}...")
                print(f"   Sources: {len(metadata.get('source_documents', []))} files")
            except Exception as e:
                print(f"   Metadata error: {e}")

        # Check if file is syntactically correct Python
        try:
            compile(py_file.read_text(), py_file, "exec")
            print(f"   ✅ Syntax: Valid Python")
        except SyntaxError as e:
            print(f"   ❌ Syntax: Error on line {e.lineno}")
        except Exception as e:
            print(f"   ⚠️ Syntax: Could not check ({e})")


def demo_update_workflow():
    """Demonstrate how to update the vector store"""
    print("\n" + "=" * 80)
    print("DEMO: Update Workflow")
    print("=" * 80)

    print("This demonstrates how you would update the system with new xform files...")

    # Show current transformations
    run_command("python rag_pipeline.py list", "List current transformations")

    # Create a dummy new xform file for demo
    dummy_xform = """#!/usr/bin/env python3
'''
Dummy transformation for demonstration
'''
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse

class DummyVisitor:
    def __init__(self, signal_name):
        self.signal_name = signal_name
        self.changes_made = []
    
    def visit(self, node):
        # Dummy implementation
        pass

def transform_dummy(input_file, output_file, signal_name):
    '''Dummy transformation function'''
    return True

def main():
    parser = argparse.ArgumentParser(description="Dummy transformation")
    parser.add_argument("input_file", help="Input file")
    parser.add_argument("output_file", help="Output file")
    parser.add_argument("--signal", required=True, help="Signal name")
    args = parser.parse_args()
    
    success = transform_dummy(args.input_file, args.output_file, args.signal)
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())
"""

    # Write dummy file
    with open("xform_dummy_demo.py", "w") as f:
        f.write(dummy_xform)

    print("✅ Created dummy xform file: xform_dummy_demo.py")

    # Update vector store
    success = run_command(
        "python rag_pipeline.py update", "Update vector store with new files"
    )

    if success:
        print("✅ Vector store update successful!")

        # Show updated list
        run_command("python rag_pipeline.py list", "List transformations after update")
    else:
        print("❌ Vector store update failed!")

    # Clean up
    try:
        os.remove("xform_dummy_demo.py")
        print("🧹 Cleaned up dummy file")
    except:
        pass


def run_comprehensive_demo():
    """Run the complete demonstration"""
    print("🚀 Starting Comprehensive Xform RAG Pipeline Demo")
    print("=" * 80)

    demos = [
        ("Basic Setup", demo_basic_setup),
        ("Simple Generation", demo_simple_generation),
        ("Model Switching", demo_model_switching),
        ("Batch Generation", demo_batch_generation),
        ("File Analysis", analyze_generated_files),
        ("Update Workflow", demo_update_workflow),
        ("Advanced Generation", demo_advanced_generation),
    ]

    results = {}

    for name, demo_func in demos:
        print(f"\n🎯 Starting: {name}")
        try:
            result = demo_func()
            results[name] = "✅ Success" if result != False else "⚠️ Partial"
        except Exception as e:
            print(f"❌ Error in {name}: {e}")
            results[name] = f"❌ Error: {e}"

        # Pause between demos
        print(f"\n⏸️ Pausing after {name}...")
        time.sleep(3)

    # Final summary
    print("\n" + "=" * 80)
    print("📊 DEMONSTRATION SUMMARY")
    print("=" * 80)

    for name, result in results.items():
        print(f"{result} {name}")

    print(f"\n🎉 Demo completed! Check the 'generated' directory for results.")


def main():
    """Main entry point"""
    import argparse

    parser = argparse.ArgumentParser(description="Xform RAG Pipeline Demo")
    parser.add_argument(
        "--demo",
        choices=["all", "basic", "simple", "advanced", "batch", "models"],
        default="all",
        help="Which demo to run",
    )

    args = parser.parse_args()

    if args.demo == "all":
        run_comprehensive_demo()
    elif args.demo == "basic":
        demo_basic_setup()
    elif args.demo == "simple":
        demo_simple_generation()
    elif args.demo == "advanced":
        demo_advanced_generation()
    elif args.demo == "batch":
        demo_batch_generation()
    elif args.demo == "models":
        demo_model_switching()

    return 0


if __name__ == "__main__":
    sys.exit(main())
