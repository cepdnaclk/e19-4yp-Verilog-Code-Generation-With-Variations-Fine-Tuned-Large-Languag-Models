#!/usr/bin/env python3
"""
Comprehensive Xform Evaluation Framework
Supports: Original evaluation, Basic evaluation, and Pass@k evaluation
"""

import ast
import os
import re
import sys
import json
import time
import math
import subprocess
import traceback
import argparse
import signal  # Added for timeout handling
from typing import Dict, List, Any, Tuple
from dataclasses import dataclass
from pathlib import Path
from collections import defaultdict
import ollama


@dataclass
class TaskSpec:
    """Specification for a transformation task."""
    name: str
    description: str
    complexity: str  # 'simple', 'medium', 'complex', 'novel'
    requirements: List[str]
    input_file: str
    expected_output: str = None
    success_criteria: List[str] = None


@dataclass
class EvaluationResult:
    """Results from evaluating a generated transformation."""
    task_name: str
    success: bool
    scores: Dict[str, float]
    generated_code: str
    errors: List[str]
    execution_time: float
    attempt_number: int = 1  # For Pass@k compatibility
    tokens_used: int = 0


@dataclass
class PassAtKResult:
    """Pass@k results for a specific task."""
    task_name: str
    k_values: List[int]
    pass_at_k_scores: Dict[int, float]
    total_attempts: int
    successful_attempts: List[int]
    best_score: float
    worst_score: float
    average_score: float


class XformGenerator:
    """Generates xform transformations using Ollama."""

    def __init__(self, client, model="llama3.2:1b"):
        self.client = client
        self.model = model

    def generate_xform(self, task_spec: TaskSpec, prompt_strategy="rich") -> str:
        """Generate a single xform transformation (original method)."""
        prompt = self._create_prompt(task_spec, prompt_strategy)

        try:
            # FIXED: Removed rope_frequency_base and cleaned up options
            response = self.client.generate(
                model=self.model,
                prompt=prompt,
                options={
                    'temperature': 0.1,
                    'top_p': 0.9,
                    'top_k': 40,
                    'num_predict': 2048,
                    # Removed problematic rope_frequency_base parameter
                }
            )
            return response['response']
        except Exception as e:
            print(f"Error generating code: {e}")
            return f"# Error generating code: {e}"

    def generate_xform_multiple(self, task_spec: TaskSpec, k: int = 10,
                                prompt_strategy="rich", temperature=0.7) -> List[str]:
        """Generate k different attempts for the same task (Pass@k method)."""
        prompt = self._create_prompt(task_spec, prompt_strategy)
        generated_samples = []

        for attempt in range(k):
            try:
                # FIXED: Removed rope_frequency_base and cleaned up options
                response = self.client.generate(
                    model=self.model,
                    prompt=prompt,
                    options={
                        'temperature': temperature,
                        'top_p': 0.9,
                        'top_k': 40,
                        'num_predict': 2048,
                        'seed': attempt,
                        # Removed problematic rope_frequency_base parameter
                    }
                )
                generated_samples.append(response['response'])
                time.sleep(0.1)

            except Exception as e:
                print(f"Warning: Failed to generate attempt {attempt + 1}: {e}")
                generated_samples.append(f"# Error generating code: {e}")

        return generated_samples

    def _create_prompt(self, task_spec: TaskSpec, prompt_strategy="rich") -> str:
        """Create the prompt for code generation."""
        base_prompt = f"""
You are an expert in Verilog/SystemVerilog and Python. Generate a transformation 
module for the xform framework that performs the following task:

TASK: {task_spec.description}

REQUIREMENTS:
{chr(10).join(f"- {req}" for req in task_spec.requirements)}

The transformation should follow this pattern:
1. Use PyVerilog to parse and analyze the AST
2. Create a visitor class to identify target elements  
3. Use regex to perform the actual text transformations
4. Include proper error handling and validation
5. Return True/False for success/failure

Generate a complete Python module with:
- Proper imports (pyverilog, re, argparse, etc.)
- A visitor class that inherits the pattern from existing xforms
- A main transformation function
- A command-line interface
- Comprehensive docstrings

Make sure the code integrates properly with the existing xform framework patterns.
"""

        if prompt_strategy == "rich":
            context = """
FRAMEWORK EXAMPLE (for reference):
```python
class ExampleVisitor:
    def __init__(self, signal_name):
        self.signal_name = signal_name
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        if isinstance(node, Node):
            # Check for target declarations
            if isinstance(node, Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == self.signal_name:
                        self.signal_found = True
                        self.changes_made.append(f"Found {self.signal_name}")

            # Visit children
            for c in node.children():
                self.visit(c)

def transform_example(input_file, output_file, signal_name):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = ExampleVisitor(signal_name)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = re.sub(pattern, replacement, content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True
```
"""
            base_prompt = context + base_prompt

        return base_prompt


class XformScorer:
    """Scores generated xform transformations."""

    def __init__(self):
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
        self.pass_threshold = 0.6

    def score_transformation(self, generated_code: str, task_spec: TaskSpec) -> Tuple[Dict[str, float], List[str]]:
        """Score a generated transformation (original method)."""
        scores = {}
        errors = []

        scores['syntactic_correctness'] = self._check_syntax(generated_code, errors)
        scores['semantic_correctness'] = self._check_semantics(generated_code, errors)
        scores['framework_compliance'] = self._check_framework_patterns(generated_code, errors)
        scores['code_style'] = self._assess_code_style(generated_code, errors)
        scores['robustness'] = self._check_robustness(generated_code, errors)
        scores['maintainability'] = self._assess_maintainability(generated_code, errors)
        scores['innovation'] = self._measure_innovation(generated_code, task_spec, errors)
        scores['functional_correctness'] = 0.5  # Placeholder

        return scores, errors

    def score_transformation_with_pass(self, generated_code: str, task_spec: TaskSpec) -> Tuple[
        Dict[str, float], List[str], bool]:
        """Score a generated transformation with pass/fail (Pass@k method)."""
        scores, errors = self.score_transformation(generated_code, task_spec)
        overall_score = self.calculate_overall_score(scores)
        passed = overall_score >= self.pass_threshold
        return scores, errors, passed

    def calculate_overall_score(self, scores: Dict[str, float]) -> float:
        """Calculate weighted overall score."""
        total = sum(scores[metric] * self.weights[metric] for metric in scores)
        return total

    # All the scoring methods (same as before)
    def _check_syntax(self, code: str, errors: List[str]) -> float:
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
        score = 0.0
        if 'os.path.exists' in code or 'Path(' in code:
            score += 0.4
        if 'try:' in code and 'except' in code:
            score += 0.3
        if 'if not' in code:
            score += 0.3
        return score

    def _assess_maintainability(self, code: str, errors: List[str]) -> float:
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
        score = 0.5
        if 'enum' in code or 'dataclass' in code:
            score += 0.2
        if code.count('print(') > 3:
            score += 0.1
        if 'compile(' in code or 'cache' in code:
            score += 0.2
        return min(score, 1.0)


class PassAtKCalculator:
    """Calculate Pass@k metrics for code generation tasks."""

    @staticmethod
    def calculate_pass_at_k(results: List[bool], k_values: List[int]) -> Dict[int, float]:
        n = len(results)
        pass_at_k = {}

        for k in k_values:
            if k > n:
                k = n

            if k == 1:
                pass_at_k[k] = 1.0 if results[0] else 0.0
            else:
                pass_at_k[k] = 1.0 if any(results[:k]) else 0.0

        return pass_at_k

    @staticmethod
    def aggregate_pass_at_k(task_results: List[PassAtKResult], k_values: List[int]) -> Dict[int, float]:
        if not task_results:
            return {k: 0.0 for k in k_values}

        aggregated = {}
        for k in k_values:
            k_scores = [task.pass_at_k_scores.get(k, 0.0) for task in task_results]
            aggregated[k] = sum(k_scores) / len(k_scores)

        return aggregated


class ComprehensiveXformEvaluator:
    """Comprehensive evaluation harness supporting Original, Basic, and Pass@k modes."""

    def __init__(self, ollama_client, model="llama3.2:1b"):
        self.generator = XformGenerator(ollama_client, model)
        self.scorer = XformScorer()
        self.pass_calculator = PassAtKCalculator()
        self.results = []
        self.pass_at_k_results = []

    def create_test_suite(self) -> List[TaskSpec]:
        """Create a comprehensive test suite using all available xform transformations."""
        return [
            # ========== SIMPLE TASKS (Basic transformations) ==========
            TaskSpec(
                name="wire_to_reg",
                description="Transform wire variables to reg variables",
                complexity="simple",
                requirements=[
                    "Find all wire declarations in the Verilog file",
                    "Replace 'wire' keyword with 'reg' keyword",
                    "Preserve bit widths and signal names",
                    "Handle both single and multiple wire declarations"
                ],
                input_file="test_simple.v"
            ),

            TaskSpec(
                name="signal_rename",
                description="Rename any signal throughout a Verilog module",
                complexity="simple",
                requirements=[
                    "Take old_name and new_name as parameters",
                    "Find all occurrences of the signal",
                    "Replace in declarations, assignments, and references",
                    "Ensure only whole word matches (not partial)"
                ],
                input_file="test_simple.v"
            ),

            TaskSpec(
                name="module_name_change",
                description="Change a module name throughout the file",
                complexity="simple",
                requirements=[
                    "Find module declaration with old name",
                    "Replace module name in declaration",
                    "Update endmodule comments if they reference module name",
                    "Preserve all module contents and port lists"
                ],
                input_file="test_simple.v"
            ),

            TaskSpec(
                name="signal_width_change",
                description="Change a signal's bit width specification",
                complexity="simple",
                requirements=[
                    "Find signal declaration with existing width",
                    "Replace width specification with new width",
                    "Handle input, output, reg, wire signal types",
                    "Preserve signal name and other attributes"
                ],
                input_file="test_simple.v"
            ),

            # ========== MEDIUM TASKS (More complex logic) ==========
            TaskSpec(
                name="multi_signal_width",
                description="Change the bit width of multiple signals at once",
                complexity="medium",
                requirements=[
                    "Take a list of signal names and new width",
                    "Find each signal's declaration",
                    "Update the bit width specification",
                    "Handle both packed and unpacked arrays",
                    "Validate that new width is syntactically correct"
                ],
                input_file="test_medium.v"
            ),

            TaskSpec(
                name="reset_condition_change",
                description="Change reset condition from active-high to active-low or vice versa",
                complexity="medium",
                requirements=[
                    "Find reset signal usage in if statements",
                    "Change if(rst) to if(!rst) or vice versa",
                    "Update sensitivity lists (posedge to negedge)",
                    "Handle both synchronous and asynchronous reset patterns"
                ],
                input_file="test_medium.v"
            ),

            TaskSpec(
                name="add_enable_signal",
                description="Add an enable signal to control a counter",
                complexity="medium",
                requirements=[
                    "Find counter increment statements (counter <= counter + 1)",
                    "Add enable signal as new input port",
                    "Wrap counter increments with enable condition",
                    "Preserve existing sensitivity lists and reset logic"
                ],
                input_file="test_medium.v"
            ),

            TaskSpec(
                name="array_base_type_change",
                description="Change the base type of an array declaration",
                complexity="medium",
                requirements=[
                    "Find array declaration with current base type",
                    "Replace base type (e.g., bit to logic, int to byte)",
                    "Handle width specifications appropriately for new type",
                    "Preserve array dimensions and signal name"
                ],
                input_file="test_medium.v"
            ),

            # ========== COMPLEX TASKS (Advanced transformations) ==========
            TaskSpec(
                name="fsm_state_rename",
                description="Systematically rename FSM state names throughout a module",
                complexity="complex",
                requirements=[
                    "Identify FSM state enum/parameter declarations",
                    "Take old_prefix and new_prefix as parameters",
                    "Rename all states that match the prefix pattern",
                    "Update all references in case statements",
                    "Update assignments and comparisons"
                ],
                input_file="test_complex.v"
            ),

            TaskSpec(
                name="queue_mda_conversion",
                description="Convert fixed arrays to queue-based multi-dimensional arrays",
                complexity="complex",
                requirements=[
                    "Find fixed array declarations",
                    "Convert to queue syntax with [$] or [$:bound] dimensions",
                    "Handle multiple dimensions as specified",
                    "Support both bounded and unbounded queues",
                    "Preserve base signal type and width"
                ],
                input_file="test_complex.v"
            ),

            TaskSpec(
                name="dynamic_mda_conversion",
                description="Convert fixed arrays to dynamic multi-dimensional arrays",
                complexity="complex",
                requirements=[
                    "Find fixed array declarations",
                    "Convert to dynamic array syntax with [] dimensions",
                    "Handle multiple dimensions as specified",
                    "Preserve base signal type and width",
                    "Generate proper initialization code"
                ],
                input_file="test_complex.v"
            ),

            TaskSpec(
                name="associative_mda_conversion",
                description="Convert arrays to associative multi-dimensional arrays",
                complexity="complex",
                requirements=[
                    "Find array declarations to convert",
                    "Convert to associative array syntax [key_type]",
                    "Support various key types (string, int, wildcard, etc.)",
                    "Handle multiple associative dimensions",
                    "Preserve base signal type and width"
                ],
                input_file="test_complex.v"
            ),

            TaskSpec(
                name="structure_type_conversion",
                description="Convert signals to use different structure types",
                complexity="complex",
                requirements=[
                    "Find signal declarations to convert",
                    "Convert to struct/union types (packed/unpacked)",
                    "Handle nested structures and hybrid types",
                    "Generate appropriate struct member definitions",
                    "Support blasted structure representations"
                ],
                input_file="test_complex.v"
            ),

            # ========== NOVEL TASKS (Advanced/specialized scenarios) ==========
            TaskSpec(
                name="inside_op_coverage",
                description="Generate coverage test cases for inside operator with random values",
                complexity="novel",
                requirements=[
                    "Create test cases for inside operator",
                    "Generate random value arrays for testing",
                    "Add coverage points for different scenarios",
                    "Include edge cases like empty arrays and boundary values",
                    "Generate both positive and negative test cases"
                ],
                input_file="test_coverage.v"
            ),

            TaskSpec(
                name="inside_op_array_usage",
                description="Create test cases for using arrays in inside operator",
                complexity="novel",
                requirements=[
                    "Generate test cases for array as whole in inside operator",
                    "Create array slice and part select test cases",
                    "Handle array select for multi-dimensional arrays",
                    "Test constant and variable index scenarios",
                    "Generate XMR and function call index test cases"
                ],
                input_file="test_coverage.v"
            ),

            TaskSpec(
                name="inside_op_context_scenarios",
                description="Create test cases for inside operator in different contexts",
                complexity="novel",
                requirements=[
                    "Generate inside operator usage in if statements",
                    "Create case statement scenarios with inside operator",
                    "Test inside operator in loops and continuous assigns",
                    "Handle procedural and initial/final block contexts",
                    "Generate always_comb and case_inside scenarios"
                ],
                input_file="test_coverage.v"
            ),

            TaskSpec(
                name="inside_op_xmr_scenarios",
                description="Create test cases for inside operator with cross-module references",
                complexity="novel",
                requirements=[
                    "Generate XMR scenarios with module hierarchies",
                    "Create interface and class XMR test cases",
                    "Handle virtual interface XMR scenarios",
                    "Test structure and package XMR references",
                    "Generate mixed XMR scenarios with multiple reference types"
                ],
                input_file="test_coverage.v"
            ),

            TaskSpec(
                name="inside_op_debug_scenarios",
                description="Create debug and tool-specific test cases for inside operator",
                complexity="novel",
                requirements=[
                    "Generate value annotation test cases for Verdi debugging",
                    "Create trace driver/load functionality tests",
                    "Generate scountdriver (signal count driver) scenarios",
                    "Create SHDL XMR force test cases",
                    "Generate UCLI trace and VPI walker test scenarios"
                ],
                input_file="test_coverage.v"
            ),

            TaskSpec(
                name="inside_op_misc_scenarios",
                description="Create miscellaneous and edge case scenarios for inside operator",
                complexity="novel",
                requirements=[
                    "Generate test cases with 'x and 'z values",
                    "Create zero select [0:0] test scenarios",
                    "Handle comparison results with x values",
                    "Test unsized literals and open range scenarios",
                    "Generate array method and function return value tests"
                ],
                input_file="test_coverage.v"
            ),

            TaskSpec(
                name="mixed_mda_conversion",
                description="Convert arrays to mixed multi-dimensional array types",
                complexity="novel",
                requirements=[
                    "Combine different MDA types (fixed, dynamic, associative, queue)",
                    "Parse complex MDA specifications",
                    "Generate proper mixed dimension syntax",
                    "Handle various combinations of dimension types",
                    "Validate mixed MDA syntax correctness"
                ],
                input_file="test_coverage.v"
            )
        ]

    # ========== TASK EVALUATION WITH TIMEOUT ==========
    def evaluate_task_with_timeout(self, task_spec: TaskSpec, prompt_strategy="rich", timeout=300) -> EvaluationResult:
        """Evaluate a single task with timeout protection."""

        def timeout_handler(signum, frame):
            raise TimeoutError(f"Task {task_spec.name} timed out after {timeout} seconds")

        # Set up timeout
        signal.signal(signal.SIGALRM, timeout_handler)
        signal.alarm(timeout)

        try:
            result = self.evaluate_task_original(task_spec, prompt_strategy)
            signal.alarm(0)  # Cancel timeout
            return result
        except TimeoutError as e:
            signal.alarm(0)  # Cancel timeout
            print(f"⏰ {e}")
            return EvaluationResult(
                task_name=f"{task_spec.name}_{prompt_strategy}",
                success=False,
                scores={metric: 0.0 for metric in self.scorer.weights.keys()},
                generated_code="",
                errors=[str(e)],
                execution_time=timeout,
                attempt_number=1
            )
        except Exception as e:
            signal.alarm(0)  # Cancel timeout
            print(f"❌ Task failed: {e}")
            return EvaluationResult(
                task_name=f"{task_spec.name}_{prompt_strategy}",
                success=False,
                scores={metric: 0.0 for metric in self.scorer.weights.keys()},
                generated_code="",
                errors=[str(e)],
                execution_time=timeout,
                attempt_number=1
            )

    # ========== ORIGINAL EVALUATION MODE ==========
    def evaluate_task_original(self, task_spec: TaskSpec, prompt_strategy="rich") -> EvaluationResult:
        """Evaluate a single task using ORIGINAL evaluation method."""
        start_time = time.time()

        try:
            # Generate single code sample
            generated_code = self.generator.generate_xform(task_spec, prompt_strategy)

            # Score using original method
            scores, errors = self.scorer.score_transformation(generated_code, task_spec)

            # Calculate success based on overall score
            overall_score = self.scorer.calculate_overall_score(scores)
            success = overall_score >= 0.6

            execution_time = time.time() - start_time

            return EvaluationResult(
                task_name=task_spec.name,
                attempt_number=1,
                success=success,
                scores=scores,
                generated_code=generated_code,
                errors=errors,
                execution_time=execution_time
            )

        except Exception as e:
            execution_time = time.time() - start_time
            return EvaluationResult(
                task_name=task_spec.name,
                attempt_number=1,
                success=False,
                scores={metric: 0.0 for metric in self.scorer.weights.keys()},
                generated_code="",
                errors=[f"Evaluation failed: {e}"],
                execution_time=execution_time
            )

    def run_original_evaluation(self, output_dir="evaluation_results_original") -> Dict[str, Any]:
        """Run the ORIGINAL evaluation (exactly like the first framework)."""
        print("🚀 Running ORIGINAL evaluation (single attempt, original format)")

        Path(output_dir).mkdir(exist_ok=True)

        test_suite = self.create_test_suite()
        results = []

        for i, task in enumerate(test_suite):
            print(f"\nEvaluating task {i + 1}/{len(test_suite)}: {task.name}")

            for strategy in ["minimal", "rich"]:
                print(f"  Testing {strategy} prompt strategy...")
                # FIXED: Using timeout version to prevent hanging
                result = self.evaluate_task_with_timeout(task, strategy, timeout=300)
                result.task_name = f"{task.name}_{strategy}"
                results.append(result)

                # Save generated code
                code_file = Path(output_dir) / f"{result.task_name}_generated.py"
                with open(code_file, "w") as f:
                    f.write(result.generated_code)

        # Analyze using original format
        analysis = self._analyze_original_results(results)

        # Save using original format
        self._save_original_results(results, analysis, output_dir)

        print(f"\nOriginal evaluation complete! Results saved to {output_dir}/")
        return analysis

    def _analyze_original_results(self, results: List[EvaluationResult]) -> Dict[str, Any]:
        """Analyze results using ORIGINAL format."""
        total_tasks = len(results)
        successful_tasks = sum(1 for r in results if r.success)

        # Calculate average scores by metric
        avg_scores = {}
        for metric in self.scorer.weights.keys():
            avg_scores[metric] = sum(r.scores[metric] for r in results) / total_tasks

        # Analyze by complexity
        complexity_analysis = {}
        for result in results:
            complexity = "unknown"
            if "wire_to_reg" in result.task_name or "signal_rename" in result.task_name:
                complexity = "simple"
            elif "multi_signal" in result.task_name:
                complexity = "medium"
            elif "fsm" in result.task_name:
                complexity = "complex"
            elif "coverage" in result.task_name:
                complexity = "novel"

            if complexity not in complexity_analysis:
                complexity_analysis[complexity] = {"total": 0, "successful": 0}

            complexity_analysis[complexity]["total"] += 1
            if result.success:
                complexity_analysis[complexity]["successful"] += 1

        return {
            "overall_success_rate": successful_tasks / total_tasks,
            "total_tasks": total_tasks,
            "successful_tasks": successful_tasks,
            "average_scores": avg_scores,
            "complexity_analysis": complexity_analysis,
            "average_execution_time": sum(r.execution_time for r in results) / total_tasks
        }

    def _save_original_results(self, results: List[EvaluationResult], analysis: Dict[str, Any], output_dir: str):
        """Save results using ORIGINAL format."""
        # Save summary report (original format)
        with open(Path(output_dir) / "evaluation_summary.json", "w") as f:
            json.dump(analysis, f, indent=2)

        # Save detailed results (original format)
        detailed_results = []
        for result in results:
            detailed_results.append({
                "task_name": result.task_name,
                "success": result.success,
                "scores": result.scores,
                "errors": result.errors,
                "execution_time": result.execution_time,
                "overall_score": self.scorer.calculate_overall_score(result.scores)
            })

        with open(Path(output_dir) / "detailed_results.json", "w") as f:
            json.dump(detailed_results, f, indent=2)

        # Generate original-style report
        report = f"""
# Ollama Llama 3 Xform Generation Evaluation Report

## Overall Results
- **Success Rate**: {analysis['overall_success_rate']:.2%}
- **Total Tasks**: {analysis['total_tasks']}
- **Successful Tasks**: {analysis['successful_tasks']}
- **Average Execution Time**: {analysis['average_execution_time']:.2f}s

## Average Scores by Metric
"""
        for metric, score in analysis['average_scores'].items():
            report += f"- **{metric.replace('_', ' ').title()}**: {score:.3f}\n"

        report += "\n## Performance by Complexity\n"
        for complexity, stats in analysis['complexity_analysis'].items():
            success_rate = stats['successful'] / stats['total'] if stats['total'] > 0 else 0
            report += f"- **{complexity.title()}**: {success_rate:.2%} ({stats['successful']}/{stats['total']})\n"

        report += "\n## Detailed Task Results\n"
        for result in detailed_results:
            status = "✅ PASS" if result['success'] else "❌ FAIL"
            report += f"- **{result['task_name']}** {status} (Score: {result['overall_score']:.3f})\n"
            if result['errors']:
                report += f"  - Errors: {'; '.join(result['errors'])}\n"

        with open(Path(output_dir) / "evaluation_report.md", "w") as f:
            f.write(report)

    # ========== PASS@K EVALUATION MODE ==========
    def evaluate_task_with_pass_at_k(self, task_spec: TaskSpec, k_values: List[int] = [1, 3, 5, 10],
                                     prompt_strategy="rich", temperature=0.7) -> PassAtKResult:
        """Evaluate a task with Pass@k scoring."""
        max_k = max(k_values)
        print(f"  Generating {max_k} attempts for Pass@k evaluation...")

        start_time = time.time()

        # Generate multiple attempts
        generated_codes = self.generator.generate_xform_multiple(
            task_spec, k=max_k, prompt_strategy=prompt_strategy, temperature=temperature
        )

        # Evaluate each attempt
        attempt_results = []
        successful_attempts = []
        all_scores = []

        for i, code in enumerate(generated_codes):
            scores, errors, passed = self.scorer.score_transformation_with_pass(code, task_spec)
            overall_score = self.scorer.calculate_overall_score(scores)

            attempt_results.append(passed)
            all_scores.append(overall_score)

            if passed:
                successful_attempts.append(i + 1)

            # Store individual result
            result = EvaluationResult(
                task_name=f"{task_spec.name}_{prompt_strategy}",
                attempt_number=i + 1,
                success=passed,
                scores=scores,
                generated_code=code,
                errors=errors,
                execution_time=time.time() - start_time
            )
            self.results.append(result)

        # Calculate Pass@k scores
        pass_at_k_scores = self.pass_calculator.calculate_pass_at_k(attempt_results, k_values)

        # Create Pass@k result
        pass_result = PassAtKResult(
            task_name=f"{task_spec.name}_{prompt_strategy}",
            k_values=k_values,
            pass_at_k_scores=pass_at_k_scores,
            total_attempts=max_k,
            successful_attempts=successful_attempts,
            best_score=max(all_scores) if all_scores else 0.0,
            worst_score=min(all_scores) if all_scores else 0.0,
            average_score=sum(all_scores) / len(all_scores) if all_scores else 0.0
        )

        return pass_result

    def run_pass_at_k_evaluation(self, k_values: List[int] = [1, 3, 5, 10],
                                 output_dir="evaluation_results_pass_at_k") -> Dict[str, Any]:
        """Run the complete evaluation suite with Pass@k metrics."""
        print("🚀 Running PASS@K evaluation (multiple attempts, comprehensive metrics)")

        Path(output_dir).mkdir(exist_ok=True)

        test_suite = self.create_test_suite()
        pass_at_k_results = []

        for i, task in enumerate(test_suite):
            print(f"\nEvaluating task {i + 1}/{len(test_suite)}: {task.name}")

            for strategy in ["minimal", "rich"]:
                print(f"  Testing {strategy} prompt strategy...")

                pass_result = self.evaluate_task_with_pass_at_k(
                    task, k_values=k_values, prompt_strategy=strategy
                )
                pass_at_k_results.append(pass_result)

                print(f"    Pass@1: {pass_result.pass_at_k_scores[1]:.2f}")
                print(f"    Pass@{max(k_values)}: {pass_result.pass_at_k_scores[max(k_values)]:.2f}")

        # Analyze results
        analysis = self._analyze_pass_at_k_results(pass_at_k_results, k_values)

        # Save all generated code
        self._save_generated_code(output_dir)

        # Save Pass@k results
        self._save_pass_at_k_results(pass_at_k_results, analysis, output_dir)

        print(f"\nPass@k evaluation complete! Results saved to {output_dir}/")
        return analysis

    def _analyze_pass_at_k_results(self, results: List[PassAtKResult], k_values: List[int]) -> Dict[str, Any]:
        """Analyze Pass@k results."""
        overall_pass_at_k = self.pass_calculator.aggregate_pass_at_k(results, k_values)

        complexity_analysis = defaultdict(lambda: {"results": [], "pass_at_k": {}})
        for result in results:
            complexity = "unknown"
            if "wire_to_reg" in result.task_name or "signal_rename" in result.task_name:
                complexity = "simple"
            elif "multi_signal" in result.task_name:
                complexity = "medium"
            elif "fsm" in result.task_name:
                complexity = "complex"
            elif "coverage" in result.task_name:
                complexity = "novel"

            complexity_analysis[complexity]["results"].append(result)

        for complexity, data in complexity_analysis.items():
            if data["results"]:
                data["pass_at_k"] = self.pass_calculator.aggregate_pass_at_k(data["results"], k_values)

        strategy_analysis = defaultdict(lambda: {"results": [], "pass_at_k": {}})
        for result in results:
            strategy = "rich" if "rich" in result.task_name else "minimal"
            strategy_analysis[strategy]["results"].append(result)

        for strategy, data in strategy_analysis.items():
            if data["results"]:
                data["pass_at_k"] = self.pass_calculator.aggregate_pass_at_k(data["results"], k_values)

        return {
            "overall_pass_at_k": overall_pass_at_k,
            "complexity_analysis": dict(complexity_analysis),
            "strategy_analysis": dict(strategy_analysis),
            "total_tasks": len(results),
            "k_values": k_values,
            "best_performing_task": max(results, key=lambda x: x.pass_at_k_scores[max(k_values)]).task_name,
            "worst_performing_task": min(results, key=lambda x: x.pass_at_k_scores[max(k_values)]).task_name
        }

    def _save_generated_code(self, output_dir: str):
        """Save all generated code samples."""
        for result in self.results:
            code_file = Path(output_dir) / f"{result.task_name}_attempt_{result.attempt_number}.py"
            with open(code_file, "w") as f:
                f.write(f"# Generated by Ollama Llama 3\n")
                f.write(f"# Task: {result.task_name}\n")
                f.write(f"# Attempt: {result.attempt_number}\n")
                f.write(f"# Success: {result.success}\n")
                f.write(f"# Overall Score: {self.scorer.calculate_overall_score(result.scores):.3f}\n\n")
                f.write(result.generated_code)

    def _save_pass_at_k_results(self, results: List[PassAtKResult], analysis: Dict[str, Any], output_dir: str):
        """Save Pass@k evaluation results."""
        pass_at_k_data = []
        for result in results:
            pass_at_k_data.append({
                "task_name": result.task_name,
                "k_values": result.k_values,
                "pass_at_k_scores": result.pass_at_k_scores,
                "total_attempts": result.total_attempts,
                "successful_attempts": result.successful_attempts,
                "best_score": result.best_score,
                "worst_score": result.worst_score,
                "average_score": result.average_score
            })

        with open(Path(output_dir) / "pass_at_k_detailed.json", "w") as f:
            json.dump(pass_at_k_data, f, indent=2)

        # Make analysis JSON-serializable by removing PassAtKResult objects
        json_safe_analysis = {
            "overall_pass_at_k": analysis["overall_pass_at_k"],
            "total_tasks": analysis["total_tasks"],
            "k_values": analysis["k_values"],
            "best_performing_task": analysis["best_performing_task"],
            "worst_performing_task": analysis["worst_performing_task"],
            "complexity_analysis": {},
            "strategy_analysis": {}
        }

        # Convert complexity analysis to JSON-safe format
        for complexity, data in analysis["complexity_analysis"].items():
            json_safe_analysis["complexity_analysis"][complexity] = {
                "pass_at_k": data.get("pass_at_k", {}),
                "total_tasks": len(data.get("results", []))
            }

        # Convert strategy analysis to JSON-safe format
        for strategy, data in analysis["strategy_analysis"].items():
            json_safe_analysis["strategy_analysis"][strategy] = {
                "pass_at_k": data.get("pass_at_k", {}),
                "total_tasks": len(data.get("results", []))
            }

        with open(Path(output_dir) / "pass_at_k_analysis.json", "w") as f:
            json.dump(json_safe_analysis, f, indent=2)

        # Generate Pass@k report
        k_values = analysis['k_values']
        overall_pass_at_k = analysis['overall_pass_at_k']

        report = f"""
# Ollama Llama 3 Xform Generation Evaluation - Pass@k Results

## Overall Pass@k Performance
"""
        for k in k_values:
            report += f"- **Pass@{k}**: {overall_pass_at_k[k]:.2%}\n"

        report += f"""

## Key Insights
- **Best Performing Task**: {analysis['best_performing_task']}
- **Worst Performing Task**: {analysis['worst_performing_task']}
- **Total Tasks Evaluated**: {analysis['total_tasks']}

## Performance by Complexity
"""
        for complexity, data in analysis['complexity_analysis'].items():
            if data.get('pass_at_k'):
                report += f"\n### {complexity.title()} Tasks\n"
                for k in k_values:
                    score = data['pass_at_k'].get(k, 0.0)
                    report += f"- Pass@{k}: {score:.2%}\n"

        report += "\n## Performance by Prompt Strategy\n"
        for strategy, data in analysis['strategy_analysis'].items():
            if data.get('pass_at_k'):
                report += f"\n### {strategy.title()} Prompts\n"
                for k in k_values:
                    score = data['pass_at_k'].get(k, 0.0)
                    report += f"- Pass@{k}: {score:.2%}\n"

        with open(Path(output_dir) / "pass_at_k_report.md", "w") as f:
            f.write(report)


def main():
    """Main function with all three evaluation modes."""
    parser = argparse.ArgumentParser(description="Comprehensive Xform Generation Evaluation")

    parser.add_argument(
        "--mode",
        choices=["original", "pass-at-k"],
        default="original",
        help="Evaluation mode: 'original' for exact original format, 'pass-at-k' for multiple attempts"
    )

    parser.add_argument(
        "--k-values",
        nargs="+",
        type=int,
        default=[1, 3, 5, 10],
        help="K values for Pass@k evaluation (default: 1 3 5 10)"
    )

    parser.add_argument(
        "--model",
        default="llama3.2:1b",
        help="Ollama model to use (default: llama3.2:1b)"
    )

    parser.add_argument(
        "--output-dir",
        default="evaluation_results",
        help="Output directory for results"
    )

    args = parser.parse_args()

    # Initialize Ollama client with YOUR CORRECT PORT
    try:
        client = ollama.Client(host='http://127.0.0.1:11435')  # KEEPING YOUR PORT!
        client.list()
        print("✅ Connected to Ollama")
    except Exception as e:
        print(f"❌ Cannot connect to Ollama: {e}")
        print("🔧 Make sure Ollama is running: ollama serve")
        return 1

    # Create evaluator
    evaluator = ComprehensiveXformEvaluator(client, model=args.model)

    if args.mode == "original":
        print("🚀 Running ORIGINAL evaluation (exact same as first framework)")
        analysis = evaluator.run_original_evaluation(f"{args.output_dir}_original")

        print(f"\n=== ORIGINAL EVALUATION SUMMARY ===")
        print(f"Success Rate: {analysis['overall_success_rate']:.2%}")
        print(f"Total Tasks: {analysis['total_tasks']}")
        print(f"Successful Tasks: {analysis['successful_tasks']}")

    elif args.mode == "pass-at-k":
        print(f"🚀 Running PASS@K evaluation")
        print(f"   K values: {args.k_values}")

        analysis = evaluator.run_pass_at_k_evaluation(
            k_values=args.k_values,
            output_dir=f"{args.output_dir}_pass_at_k"
        )

        print(f"\n=== PASS@K EVALUATION SUMMARY ===")
        for k in args.k_values:
            score = analysis['overall_pass_at_k'][k]
            print(f"Pass@{k}: {score:.2%}")

    output_path = f"{args.output_dir}_{args.mode.replace('-', '_')}"
    print(f"\n📁 Results saved to: {output_path}/")
    print(
        f"📄 View report: {output_path}/evaluation_report.md" if args.mode == "original" else f"{output_path}/pass_at_k_report.md")

    return 0


if __name__ == "__main__":
    sys.exit(main())