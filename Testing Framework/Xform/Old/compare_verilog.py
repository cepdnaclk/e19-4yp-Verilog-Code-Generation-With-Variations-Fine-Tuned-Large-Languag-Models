#!/usr/bin/env python3
"""
Script to compare generated Verilog code with ground truth and compute pass@1 metric.
Also performs a basic semantic check for wire/reg misuse in sequential logic.
"""

import argparse
from pathlib import Path
import re
import json

def normalize_verilog(code: str) -> str:
    """Normalize Verilog code by removing extra whitespace and standardizing formatting."""
    # Remove leading/trailing whitespace, collapse multiple spaces, normalize newlines
    code = re.sub(r'\s+', ' ', code.strip())
    # Remove spaces around certain operators and keywords for consistency
    code = re.sub(r'\s*([;()=><,])\s*', r'\1', code)
    return code

def check_semantic_correctness(code: str) -> list:
    """
    Perform a basic semantic check for wire declarations used in sequential always blocks.
    Returns a list of error messages if issues are found.
    """
    errors = []
    lines = code.split('\n')
    wire_decls = []
    always_blocks = []
    in_always_block = False

    # Parse the code line by line
    for i, line in enumerate(lines):
        line = line.strip()
        # Detect wire declarations
        if re.match(r'^\s*wire\s*\[\d+:\d+\]\s*\w+\s*;', line):
            var_name = re.search(r'wire\s*\[\d+:\d+\]\s*(\w+)\s*;', line).group(1)
            wire_decls.append(var_name)
        # Detect start of always block
        if re.match(r'^\s*always\s*@\(\s*posedge\s*\w+\s*or\s*posedge\s*\w+\s*\)', line):
            in_always_block = True
            always_blocks.append([])
        # Collect lines in always block
        if in_always_block:
            always_blocks[-1].append(line)
            if 'end' in line:
                in_always_block = False

    # Check if any wire is assigned in an always block
    for wire in wire_decls:
        for block in always_blocks:
            block_text = ' '.join(block)
            if f'{wire}<=' in block_text:
                errors.append(
                    f"Semantic error: Wire '{wire}' is assigned in a sequential always block, which is invalid."
                )

    return errors

def compare_verilog_files(generated_file: str, ground_truth_file: str) -> tuple[bool, float, list]:
    """
    Compare generated Verilog file with ground truth and compute pass@1.
    Returns (is_identical, pass_at_1, errors).
    """
    try:
        # Read the files
        with open(generated_file, 'r') as f:
            generated_code = f.read()
        with open(ground_truth_file, 'r') as f:
            ground_truth_code = f.read()

        # Normalize the code for comparison
        normalized_generated = normalize_verilog(generated_code)
        normalized_ground_truth = normalize_verilog(ground_truth_code)

        # Compute pass@1 (1.0 if identical, 0.0 otherwise)
        is_identical = normalized_generated == normalized_ground_truth
        pass_at_1 = 1.0 if is_identical else 0.0

        # Perform semantic check on generated code
        errors = check_semantic_correctness(generated_code)

        return is_identical, pass_at_1, errors

    except FileNotFoundError as e:
        return False, 0.0, [f"File error: {e}"]
    except Exception as e:
        return False, 0.0, [f"Error during comparison: {e}"]

def save_results(is_identical: bool, pass_at_1: float, errors: list, generated_file: str,
                ground_truth_file: str, output_dir: str, task_name: str):
    """Save comparison results to JSON and Markdown files."""
    Path(output_dir).mkdir(exist_ok=True)
    
    result = {
        "task_name": task_name,
        "generated_file": generated_file,
        "ground_truth_file": ground_truth_file,
        "is_identical": is_identical,
        "pass_at_1": pass_at_1,
        "errors": errors
    }
    
    json_path = Path(output_dir) / f"{task_name}_comparison_result.json"
    with open(json_path, 'w') as f:
        json.dump(result, f, indent=2)
    
    report = f"""
# Verilog Comparison Report

## Task: {task_name}
- **Generated File**: {generated_file}
- **Ground Truth File**: {ground_truth_file}
- **Identical**: {"Yes" if is_identical else "No"}
- **Pass@1**: {pass_at_1:.3f}

## Errors
"""
    if errors:
        for error in errors:
            report += f"- {error}\n"
    else:
        report += "- None\n"
    
    report_path = Path(output_dir) / f"{task_name}_comparison_report.md"
    with open(report_path, 'w') as f:
        f.write(report)

def main():
    """Main function to compare Verilog files and compute pass@1."""
    parser = argparse.ArgumentParser(description="Compare generated Verilog with ground truth and compute pass@1")
    parser.add_argument("--generated-file", required=True, help="Path to the generated Verilog file")
    parser.add_argument("--ground-truth-file", required=True, help="Path to the ground truth Verilog file")
    parser.add_argument("--output-dir", default="comparison_results", help="Output directory for results")
    parser.add_argument("--task-name", default="verilog_comparison", help="Name of the comparison task")

    args = parser.parse_args()

    print(f"🚀 Comparing {args.generated_file} with {args.ground_truth_file}")

    is_identical, pass_at_1, errors = compare_verilog_files(args.generated_file, args.ground_truth_file)
    
    save_results(
        is_identical=is_identical,
        pass_at_1=pass_at_1,
        errors=errors,
        generated_file=args.generated_file,
        ground_truth_file=args.ground_truth_file,
        output_dir=args.output_dir,
        task_name=args.task_name
    )

    print(f"\n=== COMPARISON SUMMARY ===")
    print(f"Task: {args.task_name}")
    print(f"Generated File: {args.generated_file}")
    print(f"Ground Truth File: {args.ground_truth_file}")
    print(f"Identical: {'Yes' if is_identical else 'No'}")
    print(f"Pass@1: {pass_at_1:.3f}")
    if errors:
        print("Errors:")
        for error in errors:
            print(f"- {error}")
    else:
        print("Errors: None")
    print(f"Results saved to: {args.output_dir}/")

    return 0

if __name__ == "__main__":
    import sys
    sys.exit(main())