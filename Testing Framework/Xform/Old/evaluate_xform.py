#!/usr/bin/env python3
"""
Standalone script to evaluate any xform transformation code with configurable task name and complexity.
Evaluates based on syntactic correctness, semantic correctness, framework compliance,
code style, robustness, maintainability, and innovation.
"""

import argparse
import ast
import json
from pathlib import Path
from typing import Dict, List, Tuple

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

def main():
    """Main function to evaluate an xform transformation."""
    parser = argparse.ArgumentParser(description="Evaluate an xform transformation code")
    parser.add_argument(
        "--xform-file",
        required=True,
        help="Path to the xform code file to evaluate"
    )
    parser.add_argument(
        "--task-name",
        required=True,
        help="Name of the task (e.g., reg_to_wire, fsm_rename)"
    )
    parser.add_argument(
        "--complexity",
        choices=['simple', 'medium', 'complex', 'novel'],
        default='simple',
        help="Complexity level of the task (default: simple)"
    )
    parser.add_argument(
        "--output-dir",
        default="xform_evaluation_results",
        help="Output directory for evaluation results"
    )
    args = parser.parse_args()

    try:
        xform_code = load_xform_code(args.xform_file)
    except Exception as e:
        print(f"❌ Failed to load xform code: {e}")
        return 1

    print(f"🚀 Evaluating xform: {args.xform_file} (Task: {args.task_name}, Complexity: {args.complexity})")
    
    task_spec = TaskSpec(args.task_name, args.complexity)
    scorer = XformScorer(args.complexity)
    scores, errors = scorer.score_transformation(xform_code, task_spec)
    overall_score = scorer.calculate_overall_score(scores)

    save_evaluation_results(
        scores=scores,
        errors=errors,
        overall_score=overall_score,
        task_name=args.task_name,
        complexity=args.complexity,
        xform_file=args.xform_file,
        output_dir=args.output_dir
    )

    print(f"\n=== EVALUATION SUMMARY ===")
    print(f"Task: {args.task_name}")
    print(f"Xform File: {args.xform_file}")
    print(f"Complexity: {args.complexity}")
    print(f"Status: {'PASS' if overall_score >= scorer.pass_threshold else 'FAIL'}")
    print(f"Overall Score: {overall_score:.3f}")
    print(f"Results saved to: {args.output_dir}/")
    print(f"View report: {args.output_dir}/{args.task_name}_evaluation_report.md")

    return 0

if __name__ == "__main__":
    import sys
    sys.exit(main())