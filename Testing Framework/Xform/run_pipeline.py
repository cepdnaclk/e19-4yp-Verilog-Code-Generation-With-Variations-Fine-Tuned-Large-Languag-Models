#!/usr/bin/env python3
"""
Pipeline script to orchestrate evaluation, transformation, and comparison of Verilog transformations.
1. Evaluates transformation scripts in codelama/ and codelama2/ directories.
2. Applies a specified transformation to an input Verilog file.
3. Compares the generated Verilog with ground truth to compute pass@1.
"""

import argparse
import ast
import json
import re
import sys
from pathlib import Path
from typing import Dict, List, Tuple
import os
import importlib.util
import inspect

class TaskSpec:
    """Generic specification for a transformation task with configurable name and complexity."""
    def __init__(self, task_name: str, complexity: str):
        self.name = task_name
        self.description = f"{task_name} transformation"
        self.complexity = complexity
        self.requirements = [
            "Use PyVerilog to parse and analyze the AST",
            "Create a visitor class to identify target elements",
            "Use regex for text transformations",
            "Include proper error handling and validation",
            "Return True/False for success/failure"
        ]

class XformScorer:
    """Scores xform transformations based on multiple metrics."""
    def __init__(self, complexity: str):
        self.weights = {
            'syntactic_correctness': 0.10,
            'semantic_correctness': 0.15,
            'functional_correctness': 0.15,
            'framework_compliance': 0.20,
            'code_style': 0.10,
            'robustness': 0.10,
            'maintainability': 0.10,
            'innovation': 0.10
        }
        self.pass_threshold = 0.6 if complexity in ['simple', 'medium'] else 0.5
        self.complexity = complexity

    def score_transformation(self, generated_code: str, task_spec: TaskSpec) -> Tuple[Dict[str, float], List[str]]:
        """Score a generated transformation."""
        scores = {}
        errors = []

        scores['syntactic_correctness'] = self._check_syntax(generated_code, errors)
        scores['semantic_correctness'] = self._check_semantics(generated_code, errors)
        scores['framework_compliance'] = self._check_framework_patterns(generated_code, errors)
        scores['code_style'] = self._assess_code_style(generated_code, errors)
        scores['robustness'] = self._check_robustness(generated_code, errors)
        scores['maintainability'] = self._assess_maintainability(generated_code, errors)
        scores['innovation'] = self._measure_innovation(generated_code, task_spec, errors)
        scores['functional_correctness'] = 0.5  # Placeholder as in original framework

        return scores, errors

    def calculate_overall_score(self, scores: Dict[str, float]) -> float:
        """Calculate weighted overall score."""
        return sum(scores[metric] * self.weights[metric] for metric in scores)

    def _check_syntax(self, code: str, errors: List[str]) -> float:
        """Check if code is syntactically correct."""
        try:
            ast.parse(code)
            return 1.0
        except SyntaxError as e:
            errors.append(f"Syntax error: {e}")
            return 0.0
        except Exception as e:
            errors.append(f"Parse error: {e}")
            return 0.0

    def _check_semantics(self, code: str, errors: List[str]) -> float:
        """Check semantic correctness based on expected patterns."""
        score = 0.0
        if 'from pyverilog.vparser.parser import parse' in code:
            score += 0.2
        else:
            errors.append("Missing PyVerilog parser import")
        if 'from pyverilog.vparser.ast import' in code:
            score += 0.2
        else:
            errors.append("Missing PyVerilog AST import")
        if 'def visit(self, node):' in code:
            score += 0.2
        else:
            errors.append("Missing AST visitor method")
        if 'isinstance(node, Node)' in code:
            score += 0.2
        else:
            errors.append("Missing proper node type checking")
        if 're.sub(' in code or 'regex' in code.lower():
            score += 0.2
        else:
            errors.append("Missing regex transformations")
        return score

    def _check_framework_patterns(self, code: str, errors: List[str]) -> float:
        """Check compliance with xform framework patterns."""
        score = 0.0
        total_checks = 6
        if 'class ' in code and 'Visitor' in code:
            score += 1 / total_checks
        else:
            errors.append("Missing visitor class")
        if 'def transform_' in code:
            score += 1 / total_checks
        else:
            errors.append("Missing main transform function")
        if 'return True' in code and 'return False' in code:
            score += 1 / total_checks
        else:
            errors.append("Missing proper return values")
        if 'try:' in code and 'except' in code:
            score += 1 / total_checks
        else:
            errors.append("Missing error handling")
        if 'with open(' in code:
            score += 1 / total_checks
        else:
            errors.append("Missing proper file I/O")
        if 'argparse' in code and 'parser.add_argument' in code:
            score += 1 / total_checks
        else:
            errors.append("Missing command line interface")
        return score

    def _assess_code_style(self, code: str, errors: List[str]) -> float:
        """Assess code style based on documentation and structure."""
        score = 0.0
        if '"""' in code:
            score += 0.3
        if any(pattern in code for pattern in ['def transform_', 'class ', 'Visitor']):
            score += 0.3
        if '#' in code:
            score += 0.2
        lines = code.split('\n')
        long_lines = [line for line in lines if len(line) > 120]
        if len(long_lines) / len(lines) < 0.1:
            score += 0.2
        return score

    def _check_robustness(self, code: str, errors: List[str]) -> float:
        """Check code robustness."""
        score = 0.0
        if 'os.path.exists' in code or 'Path(' in code:
            score += 0.4
        if 'try:' in code and 'except' in code:
            score += 0.3
        if 'if not' in code:
            score += 0.3
        return score

    def _assess_maintainability(self, code: str, errors: List[str]) -> float:
        """Assess code maintainability."""
        score = 0.0
        func_count = code.count('def ')
        if 2 <= func_count <= 6:
            score += 0.4
        if 'class ' in code:
            score += 0.3
        if not any(bad_name in code for bad_name in ['a =', 'b =', 'x =', 'temp =']):
            score += 0.3
        return score

    def _measure_innovation(self, code: str, task_spec: TaskSpec, errors: List[str]) -> float:
        """Measure innovation in the code, adjusted for complexity."""
        score = 0.5
        if task_spec.complexity in ['complex', 'novel']:
            if 'enum' in code or 'dataclass' in code:
                score += 0.2
            if code.count('print(') > 5:
                score += 0.1
            if 'compile(' in code or 'cache' in code:
                score += 0.2
        elif task_spec.complexity == 'medium':
            if 'enum' in code or 'dataclass' in code:
                score += 0.1
            if code.count('print(') > 3:
                score += 0.1
            if 'compile(' in code or 'cache' in code:
                score += 0.1
        return min(score, 1.0)

def load_xform_code(file_path: str) -> str:
    """Load the xform code from a file."""
    try:
        with open(file_path, 'r') as f:
            return f.read()
    except Exception as e:
        raise Exception(f"Error reading xform code: {e}")

def save_evaluation_results(scores: Dict[str, float], errors: List[str], overall_score: float, 
                          task_name: str, complexity: str, xform_file: str, output_dir: str):
    """Save evaluation results to JSON and Markdown files."""
    Path(output_dir).mkdir(exist_ok=True)
    
    detailed_result = {
        "task_name": task_name,
        "complexity": complexity,
        "xform_file": xform_file,
        "success": overall_score >= (0.6 if complexity in ['simple', 'medium'] else 0.5),
        "overall_score": overall_score,
        "scores": scores,
        "errors": errors,
        "execution_time": 0.0
    }
    
    with open(Path(output_dir) / f"{task_name}_evaluation_result.json", "w") as f:
        json.dump(detailed_result, f, indent=2)
    
    report = f"""
# Xform Evaluation Report

## Task: {task_name}
- **Xform File**: {xform_file}
- **Complexity**: {complexity}
- **Status**: {"PASS" if detailed_result['success'] else "FAIL"}
- **Overall Score**: {overall_score:.3f}
- **Execution Time**: 0.00s

## Scores by Metric
"""
    for metric, score in scores.items():
        report += f"- **{metric.replace('_', ' ').title()}**: {score:.3f}\n"
    
    if errors:
        report += "\n## Errors\n"
        for error in errors:
            report += f"- {error}\n"
    
    with open(Path(output_dir) / f"{task_name}_evaluation_report.md", "w") as f:
        f.write(report)

def normalize_verilog(code: str) -> str:
    """Normalize Verilog code by removing extra whitespace and standardizing formatting."""
    code = re.sub(r'\s+', ' ', code.strip())
    code = re.sub(r'\s*([;()=><,])\s*', r'\1', code)
    return code

def check_semantic_correctness(code: str) -> list:
    """Perform a basic semantic check for wire/reg misuse in sequential logic."""
    errors = []
    lines = code.split('\n')
    wire_decls = []
    always_blocks = []
    in_always_block = False

    for i, line in enumerate(lines):
        line = line.strip()
        if re.match(r'^\s*wire\s*\[\d+:\d+\]\s*\w+\s*;', line):
            var_name = re.search(r'wire\s*\[\d+:\d+\]\s*(\w+)\s*;', line).group(1)
            wire_decls.append(var_name)
        if re.match(r'^\s*always\s*@\(\s*posedge\s*\w+\s*or\s*posedge\s*\w+\s*\)', line):
            in_always_block = True
            always_blocks.append([])
        if in_always_block:
            always_blocks[-1].append(line)
            if 'end' in line:
                in_always_block = False

    for wire in wire_decls:
        for block in always_blocks:
            block_text = ' '.join(block)
            if f'{wire}<=' in block_text:
                errors.append(
                    f"Semantic error: Wire '{wire}' is assigned in a sequential always block, which is invalid."
                )

    return errors

def compare_verilog_files(generated_file: str, ground_truth_file: str) -> tuple[bool, float, list]:
    """Compare generated Verilog file with ground truth and compute pass@1."""
    try:
        with open(generated_file, 'r') as f:
            generated_code = f.read()
        with open(ground_truth_file, 'r') as f:
            ground_truth_code = f.read()

        normalized_generated = normalize_verilog(generated_code)
        normalized_ground_truth = normalize_verilog(ground_truth_code)

        is_identical = normalized_generated == normalized_ground_truth
        pass_at_1 = 1.0 if is_identical else 0.0

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

def load_xform_function(xform_file: str):
    """Dynamically load the transformation function from a Python file."""
    try:
        module_name = Path(xform_file).stem
        spec = importlib.util.spec_from_file_location(module_name, xform_file)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        
        # Find the transformation function (assumes it starts with 'transform_')
        for name, obj in inspect.getmembers(module, inspect.isfunction):
            if name.startswith('transform_'):
                return obj
        raise Exception("No transformation function found in module")
    except Exception as e:
        raise Exception(f"Error loading transformation function from {xform_file}: {e}")

def run_transformation(xform_file: str, input_file: str, output_file: str, xform_args: dict) -> bool:
    """Run the specified transformation on the input Verilog file."""
    try:
        transform_function = load_xform_function(xform_file)
        return transform_function(input_file, output_file, **xform_args)
    except Exception as e:
        print(f"Error running transformation {xform_file}: {e}")
        return False

def evaluate_xforms(xform_dirs: List[str], complexity: str, output_dir: str) -> List[Dict]:
    """Evaluate all transformation scripts in the specified directories."""
    results = []
    for xform_dir in xform_dirs:
        xform_dir_path = Path(xform_dir)
        if not xform_dir_path.exists():
            print(f"Directory {xform_dir} does not exist")
            continue
        for xform_file in xform_dir_path.glob("*.py"):
            task_name = xform_file.stem
            try:
                xform_code = load_xform_code(xform_file)
                task_spec = TaskSpec(task_name, complexity)
                scorer = XformScorer(complexity)
                scores, errors = scorer.score_transformation(xform_code, task_spec)
                overall_score = scorer.calculate_overall_score(scores)
                
                save_evaluation_results(
                    scores=scores,
                    errors=errors,
                    overall_score=overall_score,
                    task_name=task_name,
                    complexity=complexity,
                    xform_file=str(xform_file),
                    output_dir=output_dir
                )
                
                results.append({
                    "task_name": task_name,
                    "xform_file": str(xform_file),
                    "overall_score": overall_score,
                    "success": overall_score >= scorer.pass_threshold,
                    "errors": errors
                })
                
                print(f"\nEvaluated {xform_file}:")
                print(f"Status: {'PASS' if overall_score >= scorer.pass_threshold else 'FAIL'}")
                print(f"Overall Score: {overall_score:.3f}")
                if errors:
                    print("Errors:")
                    for error in errors:
                        print(f"- {error}")
            except Exception as e:
                print(f"Failed to evaluate {xform_file}: {e}")
                results.append({
                    "task_name": task_name,
                    "four_file": str(xform_file),
                    "overall_score": 0.0,
                    "success": False,
                    "errors": [str(e)]
                })
    return results

def main():
    """Main function to run the pipeline."""
    parser = argparse.ArgumentParser(description="Run Verilog transformation pipeline")
    parser.add_argument(
        "--xform-dirs",
        nargs='+',
        default=["codelama", "codelama2"],
        help="Directories containing xform scripts (default: codelama codelama2)"
    )
    parser.add_argument(
        "--xform-file",
        required=True,
        help="Path to the xform script to apply"
    )
    parser.add_argument(
        "--input-file",
        required=True,
        help="Input Verilog file"
    )
    parser.add_argument(
        "--output-file",
        required=True,
        help="Output Verilog file"
    )
    parser.add_argument(
        "--ground-truth-file",
        required=True,
        help="Ground truth Verilog file for comparison"
    )
    parser.add_argument(
        "--task-name",
        required=True,
        help="Name of the transformation task"
    )
    parser.add_argument(
        "--complexity",
        choices=['simple', 'medium', 'complex', 'novel'],
        default='simple',
        help="Complexity level of the task (default: simple)"
    )
    parser.add_argument(
        "--output-dir",
        default="pipeline_results",
        help="Output directory for results (default: pipeline_results)"
    )
    parser.add_argument(
        "--xform-args",
        nargs='*',
        default=[],
        help="Additional arguments for the transformation function (format: key=value)"
    )

    args = parser.parse_args()

    # Parse xform arguments
    xform_args = {}
    for arg in args.xform_args:
        try:
            key, value = arg.split('=', 1)
            xform_args[key] = value
        except ValueError:
            print(f"Invalid xform argument format: {arg} (expected key=value)")
            return 1

    print("=== Starting Pipeline ===")

    # Step 1: Evaluate transformation scripts
    print("\n[Step 1] Evaluating transformation scripts...")
    evaluation_results = evaluate_xforms(args.xform_dirs, args.complexity, args.output_dir)

    # Step 2: Apply transformation
    print(f"\n[Step 2] Applying transformation: {args.xform_file}")
    success = run_transformation(args.xform_file, args.input_file, args.output_file, xform_args)
    if not success:
        print("Transformation failed")
        return 1
    print(f"Transformation completed. Output saved to {args.output_file}")

    # Step 3: Compare output with ground truth
    print(f"\n[Step 3] Comparing {args.output_file} with {args.ground_truth_file}")
    is_identical, pass_at_1, errors = compare_verilog_files(args.output_file, args.ground_truth_file)
    
    save_results(
        is_identical=is_identical,
        pass_at_1=pass_at_1,
        errors=errors,
        generated_file=args.output_file,
        ground_truth_file=args.ground_truth_file,
        output_dir=args.output_dir,
        task_name=args.task_name
    )

    print(f"\n=== PIPELINE SUMMARY ===")
    print("Evaluation Results:")
    for result in evaluation_results:
        print(f"- {result['xform_file']}: {'PASS' if result['success'] else 'FAIL'} (Score: {result['overall_score']:.3f})")
    print(f"\nTransformation: {args.task_name}")
    print(f"Input File: {args.input_file}")
    print(f"Output File: {args.output_file}")
    print(f"Ground Truth File: {args.ground_truth_file}")
    print(f"Identical: {'Yes' if is_identical else 'No'}")
    print(f"Pass@1: {pass_at_1:.3f}")
    if errors:
        print("Comparison Errors:")
        for error in errors:
            print(f"- {error}")
    else:
        print("Comparison Errors: None")
    print(f"Results saved to: {args.output_dir}/")

    return 0

if __name__ == "__main__":
    sys.exit(main())