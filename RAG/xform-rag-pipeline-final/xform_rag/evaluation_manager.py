#!/usr/bin/env python3
"""
Evaluation manager for integrating scoring with the main RAG pipeline
Handles evaluation of single and batch generations
"""

import json
import logging
import time
from pathlib import Path
from typing import Dict, Any, List, Optional, Union
from datetime import datetime

from .config import RAGConfig
from .evaluator import XformEvaluator, BatchEvaluationResult, EvaluationResult
from .task_specs import TaskSpec, TaskSpecBuilder
from .scorer import ScoreBreakdown


class EvaluationManager:
    """Manages evaluation integration with the main RAG pipeline"""

    def __init__(self, config: RAGConfig):
        self.config = config
        self.logger = logging.getLogger(__name__)
        self.evaluator = XformEvaluator(config)

        # Create evaluation output directory
        self.eval_output_dir = self.config.output_dir / "evaluations"
        self.eval_output_dir.mkdir(parents=True, exist_ok=True)

    def evaluate_single_generation(
        self,
        user_request: str,
        generated_code: str,
        generation_metadata: Dict[str, Any] = None,
    ) -> Dict[str, Any]:
        """
        Evaluate a single generated transformation

        Args:
            user_request: The original user request
            generated_code: The generated transformation code
            generation_metadata: Additional metadata from generation

        Returns:
            Dictionary with evaluation results
        """
        # Create a task spec from the user request
        task_spec = self._create_task_spec_from_request(
            user_request, generation_metadata
        )

        # Evaluate the generation
        result = self.evaluator.evaluate_single_generation(task_spec, generated_code)

        # Format result for pipeline integration
        evaluation_data = {
            "evaluation_timestamp": datetime.now().isoformat(),
            "user_request": user_request,
            "task_spec": {
                "name": task_spec.name,
                "description": task_spec.description,
                "complexity": task_spec.complexity,
                "requirements": task_spec.requirements,
            },
            "scores": result.score_breakdown.metric_scores,
            "overall_score": result.overall_score,
            "passed": result.success,
            "errors": result.score_breakdown.errors,
            "warnings": result.score_breakdown.warnings,
            "suggestions": result.score_breakdown.suggestions,
            "execution_time": result.execution_time,
            "generation_metadata": generation_metadata or {},
        }

        # Save detailed evaluation
        self._save_single_evaluation(evaluation_data, result)

        return evaluation_data

    def evaluate_batch_generations(
        self, generations: List[Dict[str, Any]], evaluation_name: str = None
    ) -> Dict[str, Any]:
        """
        Evaluate a batch of generated transformations

        Args:
            generations: List of generation results from the pipeline
            evaluation_name: Name for this evaluation batch

        Returns:
            Dictionary with batch evaluation results
        """
        self.logger.info(f"Starting batch evaluation of {len(generations)} generations")

        # Convert pipeline generations to evaluator format
        evaluator_input = []
        for gen in generations:
            task_spec = self._create_task_spec_from_request(
                gen.get("user_request", "Unknown request"), gen.get("metadata", {})
            )

            evaluator_input.append(
                {
                    "task_spec": task_spec,
                    "generated_code": gen.get("code", ""),
                    "metadata": {
                        "filename": gen.get("filename", ""),
                        "source_documents": gen.get("source_documents", []),
                        "generation_time": gen.get("execution_time", 0.0),
                        **gen.get("metadata", {}),
                    },
                }
            )

        # Run batch evaluation
        batch_result = self.evaluator.evaluate_batch_generations(evaluator_input)

        # Save batch results
        evaluation_name = (
            evaluation_name or f"batch_eval_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        )
        self._save_batch_evaluation(batch_result, evaluation_name)

        # Return summary for pipeline
        return {
            "evaluation_name": evaluation_name,
            "total_tasks": batch_result.total_tasks,
            "successful_tasks": batch_result.successful_tasks,
            "success_rate": batch_result.success_rate,
            "average_score": batch_result.summary_stats.get(
                "average_overall_score", 0.0
            ),
            "evaluation_time": batch_result.execution_time,
            "results_file": str(
                self.eval_output_dir / f"{evaluation_name}_results.json"
            ),
            "report_file": str(self.eval_output_dir / f"{evaluation_name}_report.md"),
        }

    def run_comprehensive_evaluation(
        self,
        code_generator_func,
        test_suite: str = "basic",
        prompt_strategies: List[str] = ["rich"],
    ) -> Dict[str, Any]:
        """
        Run a comprehensive evaluation using predefined test suites

        Args:
            code_generator_func: Function that generates code given (task_spec, strategy)
            test_suite: "basic" or "comprehensive"
            prompt_strategies: List of prompt strategies to test

        Returns:
            Dictionary with evaluation results
        """
        self.logger.info(
            f"Running comprehensive evaluation with {test_suite} test suite"
        )

        batch_result = self.evaluator.evaluate_with_test_suite(
            code_generator_func=code_generator_func,
            test_suite=test_suite,
            prompt_strategies=prompt_strategies,
        )

        # Save results
        evaluation_name = (
            f"comprehensive_{test_suite}_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        )
        self._save_batch_evaluation(batch_result, evaluation_name)

        return {
            "evaluation_name": evaluation_name,
            "test_suite": test_suite,
            "prompt_strategies": prompt_strategies,
            "total_tasks": batch_result.total_tasks,
            "successful_tasks": batch_result.successful_tasks,
            "success_rate": batch_result.success_rate,
            "complexity_breakdown": batch_result.summary_stats.get(
                "complexity_breakdown", {}
            ),
            "metric_averages": batch_result.summary_stats.get("metric_averages", {}),
            "evaluation_time": batch_result.execution_time,
            "results_file": str(
                self.eval_output_dir / f"{evaluation_name}_results.json"
            ),
            "report_file": str(self.eval_output_dir / f"{evaluation_name}_report.md"),
        }

    def evaluate_pass_at_k(
        self,
        user_request: str,
        generated_codes: List[str],
        k_values: List[int] = [1, 3, 5, 10],
        metadata: Dict[str, Any] = None,
    ) -> Dict[str, Any]:
        """
        Evaluate multiple attempts for Pass@k scoring

        Args:
            user_request: The original user request
            generated_codes: List of generated code attempts
            k_values: Values of k to calculate Pass@k for
            metadata: Additional metadata

        Returns:
            Dictionary with Pass@k results
        """
        task_spec = self._create_task_spec_from_request(user_request, metadata)

        pass_at_k_result = self.evaluator.evaluate_pass_at_k(
            task_spec=task_spec, generated_codes=generated_codes, k_values=k_values
        )

        # Save Pass@k results
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"pass_at_k_{task_spec.name}_{timestamp}"

        result_data = {
            "evaluation_timestamp": datetime.now().isoformat(),
            "user_request": user_request,
            "task_spec": {
                "name": task_spec.name,
                "description": task_spec.description,
                "complexity": task_spec.complexity,
            },
            "k_values": k_values,
            "pass_at_k_scores": pass_at_k_result["pass_at_k"],
            "total_attempts": len(generated_codes),
            "successful_attempts": pass_at_k_result["successful_attempts"],
            "best_score": pass_at_k_result["best_score"],
            "worst_score": pass_at_k_result["worst_score"],
            "average_score": pass_at_k_result["average_score"],
            "metadata": metadata or {},
        }

        # Save to file
        with open(self.eval_output_dir / f"{filename}.json", "w") as f:
            json.dump(result_data, f, indent=2)

        return result_data

    def get_evaluation_history(self, limit: int = 10) -> List[Dict[str, Any]]:
        """Get recent evaluation history"""
        eval_files = list(self.eval_output_dir.glob("*_results.json"))
        eval_files.sort(key=lambda x: x.stat().st_mtime, reverse=True)

        history = []
        for file_path in eval_files[:limit]:
            try:
                with open(file_path) as f:
                    data = json.load(f)

                # Extract summary info
                summary = {
                    "evaluation_name": file_path.stem.replace("_results", ""),
                    "timestamp": data.get("timestamp", "Unknown"),
                    "total_tasks": data.get("total_tasks", 0),
                    "success_rate": data.get("success_rate", 0.0),
                    "average_score": data.get("summary_stats", {}).get(
                        "average_overall_score", 0.0
                    ),
                    "file_path": str(file_path),
                }
                history.append(summary)

            except Exception as e:
                self.logger.warning(f"Could not read evaluation file {file_path}: {e}")

        return history

    def _create_task_spec_from_request(
        self, user_request: str, metadata: Dict[str, Any] = None
    ) -> TaskSpec:
        """Create a TaskSpec from a user request"""
        # Extract or infer task properties
        name = self._generate_task_name(user_request)
        complexity = self._infer_complexity(user_request, metadata)
        requirements = self._extract_requirements(user_request)
        category = self._infer_category(user_request)

        return TaskSpec(
            name=name,
            description=user_request,
            complexity=complexity,
            requirements=requirements,
            input_file="generated_task.v",
            category=category,
        )

    def _generate_task_name(self, user_request: str) -> str:
        """Generate a task name from user request"""
        # Clean and create name
        import re

        clean_request = re.sub(r"[^a-zA-Z0-9\s]", "", user_request.lower())
        words = clean_request.split()[:4]  # Take first 4 words
        return "_".join(words)

    def _infer_complexity(
        self, user_request: str, metadata: Dict[str, Any] = None
    ) -> str:
        """Infer complexity level from request"""
        request_lower = user_request.lower()

        # Simple patterns
        simple_keywords = [
            "add",
            "rename",
            "change",
            "replace",
            "convert",
            "wire",
            "reg",
        ]
        medium_keywords = ["enable", "reset", "multiple", "width", "array", "counter"]
        complex_keywords = [
            "fsm",
            "state",
            "conversion",
            "dynamic",
            "associative",
            "queue",
        ]
        novel_keywords = [
            "coverage",
            "optimization",
            "debug",
            "performance",
            "comprehensive",
        ]

        if any(kw in request_lower for kw in novel_keywords):
            return "novel"
        elif any(kw in request_lower for kw in complex_keywords):
            return "complex"
        elif any(kw in request_lower for kw in medium_keywords):
            return "medium"
        else:
            return "simple"

    def _extract_requirements(self, user_request: str) -> List[str]:
        """Extract requirements from user request"""
        # Basic requirement extraction
        requirements = []

        # Look for action words and create requirements
        if "add" in user_request.lower():
            requirements.append("Add new functionality to the module")
        if "rename" in user_request.lower():
            requirements.append("Rename signals or modules")
        if "convert" in user_request.lower():
            requirements.append("Convert between different types or formats")
        if "change" in user_request.lower():
            requirements.append("Modify existing code structures")

        # Add general requirements
        requirements.extend(
            [
                "Preserve existing functionality",
                "Generate syntactically correct Verilog",
                "Follow proper coding standards",
            ]
        )

        return requirements

    def _infer_category(self, user_request: str) -> str:
        """Infer category from user request"""
        request_lower = user_request.lower()

        category_keywords = {
            "signal_modification": ["signal", "wire", "reg", "rename", "width"],
            "structural_modification": ["module", "port", "interface"],
            "control_logic": ["reset", "enable", "condition", "control"],
            "feature_addition": ["add", "insert", "enhance"],
            "fsm_modification": ["fsm", "state", "machine"],
            "advanced_arrays": ["array", "dynamic", "queue", "associative"],
            "verification": ["coverage", "test", "verify"],
            "debug_enhancement": ["debug", "trace", "monitor"],
            "optimization": ["optimize", "performance", "critical"],
        }

        for category, keywords in category_keywords.items():
            if any(kw in request_lower for kw in keywords):
                return category

        return "general"

    def _save_single_evaluation(
        self, evaluation_data: Dict[str, Any], result: EvaluationResult
    ):
        """Save single evaluation result"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"single_eval_{result.task_name}_{timestamp}"

        # Save JSON data
        with open(self.eval_output_dir / f"{filename}.json", "w") as f:
            json.dump(evaluation_data, f, indent=2)

        # Save generated code with evaluation info
        code_file = self.eval_output_dir / f"{filename}_code.py"
        with open(code_file, "w") as f:
            f.write(f"# Evaluation Results\n")
            f.write(f"# Task: {result.task_name}\n")
            f.write(f"# Overall Score: {result.overall_score:.3f}\n")
            f.write(f"# Passed: {result.success}\n")
            f.write(f"# Errors: {len(result.score_breakdown.errors)}\n")
            f.write(f"# Warnings: {len(result.score_breakdown.warnings)}\n\n")
            f.write(result.generated_code)

    def _save_batch_evaluation(
        self, batch_result: BatchEvaluationResult, evaluation_name: str
    ):
        """Save batch evaluation results"""
        # Save detailed JSON results
        detailed_data = {
            "evaluation_name": evaluation_name,
            "timestamp": batch_result.timestamp,
            "execution_time": batch_result.execution_time,
            "total_tasks": batch_result.total_tasks,
            "successful_tasks": batch_result.successful_tasks,
            "success_rate": batch_result.success_rate,
            "summary_stats": batch_result.summary_stats,
            "detailed_results": [],
        }

        for result in batch_result.results:
            detailed_data["detailed_results"].append(
                {
                    "task_name": result.task_name,
                    "success": result.success,
                    "overall_score": result.overall_score,
                    "metric_scores": result.score_breakdown.metric_scores,
                    "errors": result.score_breakdown.errors,
                    "warnings": result.score_breakdown.warnings,
                    "execution_time": result.execution_time,
                    "metadata": result.metadata,
                }
            )

        with open(self.eval_output_dir / f"{evaluation_name}_results.json", "w") as f:
            json.dump(detailed_data, f, indent=2)

        # Save markdown report
        report = self.evaluator.create_evaluation_report(batch_result)
        with open(self.eval_output_dir / f"{evaluation_name}_report.md", "w") as f:
            f.write(report)

        # Save individual generated codes
        codes_dir = self.eval_output_dir / f"{evaluation_name}_codes"
        codes_dir.mkdir(exist_ok=True)

        for result in batch_result.results:
            code_file = codes_dir / f"{result.task_name}.py"
            with open(code_file, "w") as f:
                f.write(f"# Task: {result.task_name}\n")
                f.write(f"# Score: {result.overall_score:.3f}\n")
                f.write(f"# Passed: {result.success}\n\n")
                f.write(result.generated_code)

        self.logger.info(
            f"Batch evaluation results saved to {self.eval_output_dir}/{evaluation_name}_*"
        )
