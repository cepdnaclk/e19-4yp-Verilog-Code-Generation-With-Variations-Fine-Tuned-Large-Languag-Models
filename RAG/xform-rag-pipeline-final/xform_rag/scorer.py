#!/usr/bin/env python3
"""
Scoring system for generated xform transformations
Evaluates code quality across multiple dimensions
"""

import ast
import re
import logging
from typing import Dict, List, Tuple, Any
from dataclasses import dataclass

from .task_specs import TaskSpec


@dataclass
class ScoreBreakdown:
    """Detailed breakdown of scoring results"""

    metric_scores: Dict[str, float]
    overall_score: float
    passed: bool
    errors: List[str]
    warnings: List[str]
    suggestions: List[str]


class XformScorer:
    """Comprehensive scorer for generated xform transformations"""

    def __init__(self, pass_threshold: float = 0.6):
        self.logger = logging.getLogger(__name__)
        self.pass_threshold = pass_threshold

        # Scoring weights for different metrics
        self.weights = {
            "syntactic_correctness": 0.15,  # Can it be parsed as Python?
            "semantic_correctness": 0.20,  # Does it have required imports/patterns?
            "framework_compliance": 0.25,  # Follows xform framework patterns?
            "code_style": 0.10,  # Good coding practices?
            "robustness": 0.10,  # Error handling and validation?
            "maintainability": 0.10,  # Clean, readable code?
            "functional_correctness": 0.10,  # Likely to work for the task?
        }

    def score_transformation(
        self, generated_code: str, task_spec: TaskSpec
    ) -> ScoreBreakdown:
        """
        Comprehensive scoring of a generated transformation

        Args:
            generated_code: The generated Python code
            task_spec: The task specification

        Returns:
            ScoreBreakdown with detailed results
        """
        scores = {}
        errors = []
        warnings = []
        suggestions = []

        # Run all scoring metrics
        scores["syntactic_correctness"] = self._check_syntax(generated_code, errors)
        scores["semantic_correctness"] = self._check_semantics(
            generated_code, errors, warnings
        )
        scores["framework_compliance"] = self._check_framework_patterns(
            generated_code, errors, warnings
        )
        scores["code_style"] = self._assess_code_style(
            generated_code, warnings, suggestions
        )
        scores["robustness"] = self._check_robustness(generated_code, warnings)
        scores["maintainability"] = self._assess_maintainability(
            generated_code, suggestions
        )
        scores["functional_correctness"] = self._assess_functionality(
            generated_code, task_spec, warnings
        )

        # Calculate overall score
        overall_score = sum(scores[metric] * self.weights[metric] for metric in scores)
        passed = overall_score >= self.pass_threshold

        return ScoreBreakdown(
            metric_scores=scores,
            overall_score=overall_score,
            passed=passed,
            errors=errors,
            warnings=warnings,
            suggestions=suggestions,
        )

    def _check_syntax(self, code: str, errors: List[str]) -> float:
        """Check if the code is syntactically valid Python"""
        try:
            ast.parse(code)
            return 1.0
        except SyntaxError as e:
            errors.append(f"Syntax error at line {e.lineno}: {e.msg}")
            return 0.0
        except Exception as e:
            errors.append(f"Parse error: {e}")
            return 0.0

    def _check_semantics(
        self, code: str, errors: List[str], warnings: List[str]
    ) -> float:
        """Check semantic correctness - required imports and patterns"""
        score = 0.0
        max_points = 5

        # Check for PyVerilog imports
        if "from pyverilog.vparser.parser import parse" in code or "pyverilog" in code:
            score += 1
        else:
            errors.append("Missing PyVerilog parser import")

        # Check for AST imports
        if "from pyverilog.vparser.ast import" in code or "ast" in code:
            score += 1
        else:
            warnings.append("Missing PyVerilog AST imports")

        # Check for visitor pattern
        if "def visit(self, node):" in code or "visit" in code:
            score += 1
        else:
            warnings.append("Missing AST visitor method")

        # Check for proper node handling
        if "isinstance(node, " in code:
            score += 1
        else:
            warnings.append("Missing proper node type checking")

        # Check for regex usage
        if "re.sub(" in code or "regex" in code.lower() or "import re" in code:
            score += 1
        else:
            warnings.append("Missing regex transformations")

        return score / max_points

    def _check_framework_patterns(
        self, code: str, errors: List[str], warnings: List[str]
    ) -> float:
        """Check compliance with xform framework patterns"""
        score = 0.0
        total_checks = 8

        # Visitor class pattern
        if "class " in code and ("Visitor" in code or "visitor" in code):
            score += 1
        else:
            errors.append("Missing visitor class")

        # Main transformation function
        if "def transform_" in code or "def main" in code:
            score += 1
        else:
            errors.append("Missing main transform function")

        # Proper return values
        if "return True" in code and "return False" in code:
            score += 1
        else:
            warnings.append("Missing proper boolean return values")

        # Error handling
        if "try:" in code and "except" in code:
            score += 1
        else:
            warnings.append("Missing error handling")

        # File I/O
        if "open(" in code or "with open(" in code:
            score += 1
        else:
            warnings.append("Missing proper file I/O")

        # Command line interface
        if "argparse" in code or "ArgumentParser" in code:
            score += 1
        else:
            warnings.append("Missing command line interface")

        # Shebang line
        if code.startswith("#!/usr/bin/env python3") or "#!/usr/bin/env python" in code:
            score += 1
        else:
            warnings.append("Missing shebang line")

        # Main guard
        if 'if __name__ == "__main__":' in code:
            score += 1
        else:
            warnings.append("Missing main guard")

        return score / total_checks

    def _assess_code_style(
        self, code: str, warnings: List[str], suggestions: List[str]
    ) -> float:
        """Assess code style and formatting"""
        score = 0.0

        # Docstrings
        if '"""' in code or "'''" in code:
            score += 0.25
        else:
            suggestions.append("Add docstrings for better documentation")

        # Function/class naming
        if any(pattern in code for pattern in ["def transform_", "class ", "Visitor"]):
            score += 0.25

        # Comments
        if "#" in code:
            comment_lines = len([line for line in code.split("\n") if "#" in line])
            if comment_lines >= 3:
                score += 0.25
            elif comment_lines >= 1:
                score += 0.15
        else:
            suggestions.append("Add comments to explain complex logic")

        # Line length (reasonable)
        lines = code.split("\n")
        long_lines = [line for line in lines if len(line) > 120]
        if len(long_lines) / len(lines) < 0.1:
            score += 0.25
        elif long_lines:
            suggestions.append("Consider breaking long lines for readability")

        return min(score, 1.0)

    def _check_robustness(self, code: str, warnings: List[str]) -> float:
        """Check robustness - error handling, validation, edge cases"""
        score = 0.0

        # File existence checks
        if "os.path.exists" in code or "Path(" in code or ".exists()" in code:
            score += 0.3
        else:
            warnings.append("Consider checking file existence before processing")

        # Exception handling
        if "try:" in code and "except" in code:
            score += 0.4
            # Bonus for specific exception types
            if any(
                exc in code for exc in ["FileNotFoundError", "IOError", "Exception"]
            ):
                score += 0.1
        else:
            warnings.append("Add exception handling for robustness")

        # Input validation
        if "if not" in code or "assert" in code:
            score += 0.2
        else:
            warnings.append("Consider input validation")

        return min(score, 1.0)

    def _assess_maintainability(self, code: str, suggestions: List[str]) -> float:
        """Assess code maintainability"""
        score = 0.0

        # Function count (not too many, not too few)
        func_count = code.count("def ")
        if 2 <= func_count <= 8:
            score += 0.3
        elif func_count == 1:
            score += 0.2
        else:
            suggestions.append(
                "Consider breaking code into appropriate number of functions"
            )

        # Class usage
        if "class " in code:
            score += 0.3

        # Variable naming (avoid single letters for important vars)
        if not any(
            bad_name in code for bad_name in ["a =", "b =", "x =", "temp =", "tmp ="]
        ):
            score += 0.2
        else:
            suggestions.append("Use descriptive variable names")

        # Constants (uppercase naming)
        if re.search(r"[A-Z_]{2,}\s*=", code):
            score += 0.2

        return min(score, 1.0)

    def _assess_functionality(
        self, code: str, task_spec: TaskSpec, warnings: List[str]
    ) -> float:
        """Assess how well the code addresses the specific task"""
        score = 0.5  # Base score for generating code

        # Check if code addresses task description keywords
        description_words = set(task_spec.description.lower().split())
        code_lower = code.lower()

        # Key concept matching
        matched_concepts = 0
        total_concepts = len(description_words)

        for word in description_words:
            if len(word) > 3 and word in code_lower:  # Skip short words
                matched_concepts += 1

        if total_concepts > 0:
            concept_score = matched_concepts / total_concepts
            score += concept_score * 0.3

        # Check requirements fulfillment
        requirements_met = 0
        for requirement in task_spec.requirements:
            req_words = requirement.lower().split()
            if any(word in code_lower for word in req_words if len(word) > 3):
                requirements_met += 1

        if len(task_spec.requirements) > 0:
            req_score = requirements_met / len(task_spec.requirements)
            score += req_score * 0.2

        # Complexity appropriate patterns
        if task_spec.complexity == "simple":
            if "re.sub(" in code and "def " in code:
                score += 0.1
        elif task_spec.complexity == "medium":
            if "class" in code and "visit" in code:
                score += 0.1
        elif task_spec.complexity in ["complex", "novel"]:
            if "class" in code and "visit" in code and "try:" in code:
                score += 0.1

        return min(score, 1.0)

    def get_metric_weights(self) -> Dict[str, float]:
        """Get the current metric weights"""
        return self.weights.copy()

    def set_metric_weights(self, new_weights: Dict[str, float]):
        """Update metric weights (must sum to 1.0)"""
        total = sum(new_weights.values())
        if abs(total - 1.0) > 0.01:
            raise ValueError(f"Weights must sum to 1.0, got {total}")
        self.weights = new_weights.copy()

    def set_pass_threshold(self, threshold: float):
        """Set the pass/fail threshold (0.0 to 1.0)"""
        if not 0.0 <= threshold <= 1.0:
            raise ValueError("Threshold must be between 0.0 and 1.0")
        self.pass_threshold = threshold


class PassAtKCalculator:
    """Calculate Pass@k metrics for multiple attempts"""

    @staticmethod
    def calculate_pass_at_k(
        results: List[bool], k_values: List[int]
    ) -> Dict[int, float]:
        """
        Calculate Pass@k scores given a list of pass/fail results

        Args:
            results: List of boolean results (True=pass, False=fail)
            k_values: List of k values to calculate for

        Returns:
            Dictionary mapping k values to Pass@k scores
        """
        n = len(results)
        pass_at_k = {}

        for k in k_values:
            if k > n:
                k = n

            if k <= 0:
                pass_at_k[k] = 0.0
            elif k == 1:
                pass_at_k[k] = 1.0 if results[0] else 0.0
            else:
                # Pass@k = 1 if any of the first k attempts passed
                pass_at_k[k] = 1.0 if any(results[:k]) else 0.0

        return pass_at_k

    @staticmethod
    def aggregate_pass_at_k_across_tasks(
        task_results: List[Dict[int, float]], k_values: List[int]
    ) -> Dict[int, float]:
        """
        Aggregate Pass@k scores across multiple tasks

        Args:
            task_results: List of Pass@k dictionaries for each task
            k_values: List of k values

        Returns:
            Average Pass@k scores across all tasks
        """
        if not task_results:
            return {k: 0.0 for k in k_values}

        aggregated = {}
        for k in k_values:
            k_scores = [task_result.get(k, 0.0) for task_result in task_results]
            aggregated[k] = sum(k_scores) / len(k_scores)

        return aggregated


class ScoringMetrics:
    """Utility class for scoring-related calculations and statistics"""

    @staticmethod
    def calculate_score_statistics(scores: List[float]) -> Dict[str, float]:
        """Calculate statistics for a list of scores"""
        if not scores:
            return {"mean": 0.0, "min": 0.0, "max": 0.0, "std": 0.0}

        import statistics

        return {
            "mean": statistics.mean(scores),
            "median": statistics.median(scores),
            "min": min(scores),
            "max": max(scores),
            "std": statistics.stdev(scores) if len(scores) > 1 else 0.0,
        }

    @staticmethod
    def calculate_complexity_breakdown(
        results: List[Tuple[str, ScoreBreakdown]],
    ) -> Dict[str, Dict[str, float]]:
        """Calculate score breakdown by complexity level"""
        complexity_groups = {}

        for task_name, breakdown in results:
            # Extract complexity from task name or use default
            complexity = "unknown"
            if "simple" in task_name or any(
                x in task_name for x in ["wire_to_reg", "signal_rename"]
            ):
                complexity = "simple"
            elif "medium" in task_name or any(
                x in task_name for x in ["multi_signal", "reset_condition"]
            ):
                complexity = "medium"
            elif "complex" in task_name or any(
                x in task_name for x in ["fsm", "mda_conversion"]
            ):
                complexity = "complex"
            elif "novel" in task_name or any(
                x in task_name for x in ["coverage", "debug", "optimization"]
            ):
                complexity = "novel"

            if complexity not in complexity_groups:
                complexity_groups[complexity] = []

            complexity_groups[complexity].append(breakdown.overall_score)

        # Calculate statistics for each complexity level
        complexity_stats = {}
        for complexity, scores in complexity_groups.items():
            complexity_stats[complexity] = ScoringMetrics.calculate_score_statistics(
                scores
            )
            complexity_stats[complexity]["pass_rate"] = sum(
                1 for s in scores if s >= 0.6
            ) / len(scores)

        return complexity_stats
