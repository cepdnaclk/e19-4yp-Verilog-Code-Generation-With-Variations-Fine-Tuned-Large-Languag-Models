#!/usr/bin/env python3
"""
Main evaluation orchestrator for xform transformations
Coordinates task execution, scoring, and result collection
"""

import time
import logging
from typing import List, Dict, Any, Optional
from dataclasses import dataclass
from pathlib import Path

from .task_specs import TaskSpec, TaskSpecBuilder, TestFileGenerator
from .scorer import XformScorer, ScoreBreakdown, PassAtKCalculator
from .config import RAGConfig


@dataclass
class EvaluationResult:
    """Results from evaluating a single generated transformation"""

    task_name: str
    task_spec: TaskSpec
    generated_code: str
    score_breakdown: ScoreBreakdown
    execution_time: float
    attempt_number: int = 1
    metadata: Dict[str, Any] = None

    @property
    def success(self) -> bool:
        return self.score_breakdown.passed

    @property
    def overall_score(self) -> float:
        return self.score_breakdown.overall_score


@dataclass
class BatchEvaluationResult:
    """Results from evaluating multiple tasks"""

    results: List[EvaluationResult]
    summary_stats: Dict[str, Any]
    execution_time: float
    timestamp: str

    @property
    def total_tasks(self) -> int:
        return len(self.results)

    @property
    def successful_tasks(self) -> int:
        return sum(1 for r in self.results if r.success)

    @property
    def success_rate(self) -> float:
        return self.successful_tasks / self.total_tasks if self.total_tasks > 0 else 0.0


class XformEvaluator:
    """Main evaluator for xform transformations"""

    def __init__(self, config: RAGConfig = None):
        self.config = config or RAGConfig()
        self.logger = logging.getLogger(__name__)
        self.scorer = XformScorer()
        self.pass_calculator = PassAtKCalculator()

        # Ensure test files exist
        TestFileGenerator.create_test_files()

    def evaluate_single_generation(
        self, task_spec: TaskSpec, generated_code: str, attempt_number: int = 1
    ) -> EvaluationResult:
        """
        Evaluate a single generated transformation

        Args:
            task_spec: The task specification
            generated_code: The generated code to evaluate
            attempt_number: Attempt number (for Pass@k evaluation)

        Returns:
            EvaluationResult with detailed scoring
        """
        start_time = time.time()

        try:
            # Score the generated code
            score_breakdown = self.scorer.score_transformation(
                generated_code, task_spec
            )

            execution_time = time.time() - start_time

            return EvaluationResult(
                task_name=task_spec.name,
                task_spec=task_spec,
                generated_code=generated_code,
                score_breakdown=score_breakdown,
                execution_time=execution_time,
                attempt_number=attempt_number,
                metadata={
                    "complexity": task_spec.complexity,
                    "category": task_spec.category,
                    "requirements_count": len(task_spec.requirements),
                },
            )

        except Exception as e:
            self.logger.error(f"Error evaluating {task_spec.name}: {e}")

            # Create a failed result
            failed_breakdown = ScoreBreakdown(
                metric_scores={metric: 0.0 for metric in self.scorer.weights.keys()},
                overall_score=0.0,
                passed=False,
                errors=[f"Evaluation failed: {str(e)}"],
                warnings=[],
                suggestions=[],
            )

            return EvaluationResult(
                task_name=task_spec.name,
                task_spec=task_spec,
                generated_code=generated_code,
                score_breakdown=failed_breakdown,
                execution_time=time.time() - start_time,
                attempt_number=attempt_number,
                metadata={"error": str(e)},
            )

    def evaluate_batch_generations(
        self, generations: List[Dict[str, Any]]
    ) -> BatchEvaluationResult:
        """
        Evaluate a batch of generated transformations

        Args:
            generations: List of dicts with 'task_spec', 'generated_code', and optional metadata

        Returns:
            BatchEvaluationResult with comprehensive analysis
        """
        start_time = time.time()
        results = []

        self.logger.info(f"Evaluating batch of {len(generations)} generations")

        for i, generation in enumerate(generations):
            task_spec = generation["task_spec"]
            generated_code = generation.get("generated_code", "")
            attempt_number = generation.get("attempt_number", 1)

            self.logger.info(f"Evaluating {i+1}/{len(generations)}: {task_spec.name}")

            result = self.evaluate_single_generation(
                task_spec=task_spec,
                generated_code=generated_code,
                attempt_number=attempt_number,
            )

            # Add any additional metadata from the generation
            if "metadata" in generation:
                if result.metadata is None:
                    result.metadata = {}
                result.metadata.update(generation["metadata"])

            results.append(result)

        # Calculate summary statistics
        summary_stats = self._calculate_summary_stats(results)

        execution_time = time.time() - start_time
        timestamp = time.strftime("%Y-%m-%d %H:%M:%S")

        return BatchEvaluationResult(
            results=results,
            summary_stats=summary_stats,
            execution_time=execution_time,
            timestamp=timestamp,
        )

    def evaluate_with_test_suite(
        self,
        code_generator_func,
        test_suite: str = "comprehensive",
        prompt_strategies: List[str] = ["rich"],
    ) -> BatchEvaluationResult:
        """
        Evaluate using a predefined test suite

        Args:
            code_generator_func: Function that takes (task_spec, strategy) and returns generated code
            test_suite: "basic", "comprehensive", or "custom"
            prompt_strategies: List of prompt strategies to test

        Returns:
            BatchEvaluationResult
        """
        # Get test suite
        if test_suite == "basic":
            tasks = TaskSpecBuilder.create_basic_test_suite()
        elif test_suite == "comprehensive":
            tasks = TaskSpecBuilder.create_comprehensive_test_suite()
        else:
            raise ValueError(f"Unknown test suite: {test_suite}")

        generations = []

        for task in tasks:
            for strategy in prompt_strategies:
                try:
                    # Generate code using the provided function
                    generated_code = code_generator_func(task, strategy)

                    generations.append(
                        {
                            "task_spec": task,
                            "generated_code": generated_code,
                            "metadata": {
                                "prompt_strategy": strategy,
                                "test_suite": test_suite,
                            },
                        }
                    )

                except Exception as e:
                    self.logger.error(
                        f"Code generation failed for {task.name} with {strategy}: {e}"
                    )
                    generations.append(
                        {
                            "task_spec": task,
                            "generated_code": f"# Code generation failed: {e}",
                            "metadata": {
                                "prompt_strategy": strategy,
                                "test_suite": test_suite,
                                "generation_error": str(e),
                            },
                        }
                    )

        return self.evaluate_batch_generations(generations)

    def evaluate_pass_at_k(
        self,
        task_spec: TaskSpec,
        generated_codes: List[str],
        k_values: List[int] = [1, 3, 5, 10],
    ) -> Dict[str, Any]:
        """
        Evaluate multiple attempts for Pass@k scoring

        Args:
            task_spec: The task specification
            generated_codes: List of generated code attempts
            k_values: Values of k to calculate Pass@k for

        Returns:
            Dictionary with Pass@k results
        """
        if not generated_codes:
            return {
                "pass_at_k": {k: 0.0 for k in k_values},
                "attempts": [],
                "best_score": 0.0,
                "worst_score": 0.0,
                "average_score": 0.0,
            }

        # Evaluate each attempt
        attempt_results = []
        pass_results = []
        scores = []

        for i, code in enumerate(generated_codes):
            result = self.evaluate_single_generation(
                task_spec, code, attempt_number=i + 1
            )
            attempt_results.append(result)
            pass_results.append(result.success)
            scores.append(result.overall_score)

        # Calculate Pass@k
        pass_at_k = self.pass_calculator.calculate_pass_at_k(pass_results, k_values)

        return {
            "pass_at_k": pass_at_k,
            "attempts": attempt_results,
            "best_score": max(scores) if scores else 0.0,
            "worst_score": min(scores) if scores else 0.0,
            "average_score": sum(scores) / len(scores) if scores else 0.0,
            "successful_attempts": [
                i + 1 for i, passed in enumerate(pass_results) if passed
            ],
        }

    def _calculate_summary_stats(
        self, results: List[EvaluationResult]
    ) -> Dict[str, Any]:
        """Calculate comprehensive summary statistics"""
        if not results:
            return {}

        # Basic stats
        total_tasks = len(results)
        successful_tasks = sum(1 for r in results if r.success)
        success_rate = successful_tasks / total_tasks

        # Score statistics
        overall_scores = [r.overall_score for r in results]
        avg_overall_score = sum(overall_scores) / len(overall_scores)

        # Metric-wise average scores
        metric_averages = {}
        for metric in self.scorer.weights.keys():
            metric_scores = [
                r.score_breakdown.metric_scores.get(metric, 0.0) for r in results
            ]
            metric_averages[metric] = sum(metric_scores) / len(metric_scores)

        # Complexity breakdown
        complexity_stats = {}
        complexity_groups = {}
        for result in results:
            complexity = result.task_spec.complexity
            if complexity not in complexity_groups:
                complexity_groups[complexity] = []
            complexity_groups[complexity].append(result)

        for complexity, group_results in complexity_groups.items():
            group_success_rate = sum(1 for r in group_results if r.success) / len(
                group_results
            )
            group_avg_score = sum(r.overall_score for r in group_results) / len(
                group_results
            )

            complexity_stats[complexity] = {
                "total_tasks": len(group_results),
                "successful_tasks": sum(1 for r in group_results if r.success),
                "success_rate": group_success_rate,
                "average_score": group_avg_score,
            }

        # Category breakdown (if categories are available)
        category_stats = {}
        category_groups = {}
        for result in results:
            category = getattr(result.task_spec, "category", "unknown")
            if category not in category_groups:
                category_groups[category] = []
            category_groups[category].append(result)

        for category, group_results in category_groups.items():
            group_success_rate = sum(1 for r in group_results if r.success) / len(
                group_results
            )
            group_avg_score = sum(r.overall_score for r in group_results) / len(
                group_results
            )

            category_stats[category] = {
                "total_tasks": len(group_results),
                "successful_tasks": sum(1 for r in group_results if r.success),
                "success_rate": group_success_rate,
                "average_score": group_avg_score,
            }

        # Error analysis
        all_errors = []
        all_warnings = []
        for result in results:
            all_errors.extend(result.score_breakdown.errors)
            all_warnings.extend(result.score_breakdown.warnings)

        # Common error patterns
        error_patterns = {}
        for error in all_errors:
            error_type = error.split(":")[0] if ":" in error else error
            error_patterns[error_type] = error_patterns.get(error_type, 0) + 1

        return {
            "total_tasks": total_tasks,
            "successful_tasks": successful_tasks,
            "success_rate": success_rate,
            "average_overall_score": avg_overall_score,
            "metric_averages": metric_averages,
            "complexity_breakdown": complexity_stats,
            "category_breakdown": category_stats,
            "common_errors": error_patterns,
            "total_errors": len(all_errors),
            "total_warnings": len(all_warnings),
            "best_performing_task": max(
                results, key=lambda r: r.overall_score
            ).task_name,
            "worst_performing_task": min(
                results, key=lambda r: r.overall_score
            ).task_name,
        }

    def create_evaluation_report(self, batch_result: BatchEvaluationResult) -> str:
        """Create a comprehensive evaluation report"""
        stats = batch_result.summary_stats

        report = f"""# Xform Generation Evaluation Report

Generated: {batch_result.timestamp}
Evaluation Time: {batch_result.execution_time:.2f} seconds

## Overall Results
- **Success Rate**: {batch_result.success_rate:.2%} ({batch_result.successful_tasks}/{batch_result.total_tasks})
- **Average Score**: {stats.get('average_overall_score', 0):.3f}
- **Total Errors**: {stats.get('total_errors', 0)}
- **Total Warnings**: {stats.get('total_warnings', 0)}

## Metric Breakdown
"""

        for metric, score in stats.get("metric_averages", {}).items():
            report += f"- **{metric.replace('_', ' ').title()}**: {score:.3f}\n"

        report += "\n## Performance by Complexity\n"
        for complexity, data in stats.get("complexity_breakdown", {}).items():
            report += f"- **{complexity.title()}**: {data['success_rate']:.2%} ({data['successful_tasks']}/{data['total_tasks']}) - Avg: {data['average_score']:.3f}\n"

        if stats.get("category_breakdown"):
            report += "\n## Performance by Category\n"
            for category, data in stats.get("category_breakdown", {}).items():
                report += f"- **{category.replace('_', ' ').title()}**: {data['success_rate']:.2%} ({data['successful_tasks']}/{data['total_tasks']}) - Avg: {data['average_score']:.3f}\n"

        report += f"\n## Top Performers\n"
        report += f"- **Best**: {stats.get('best_performing_task', 'N/A')}\n"
        report += f"- **Worst**: {stats.get('worst_performing_task', 'N/A')}\n"

        if stats.get("common_errors"):
            report += "\n## Common Error Patterns\n"
            sorted_errors = sorted(
                stats["common_errors"].items(), key=lambda x: x[1], reverse=True
            )
            for error_type, count in sorted_errors[:5]:  # Top 5 errors
                report += f"- **{error_type}**: {count} occurrences\n"

        report += "\n## Detailed Results\n"
        for result in batch_result.results:
            status = "✅ PASS" if result.success else "❌ FAIL"
            report += f"- **{result.task_name}** {status} (Score: {result.overall_score:.3f}, Time: {result.execution_time:.2f}s)\n"

            if result.score_breakdown.errors:
                report += (
                    f"  - Errors: {'; '.join(result.score_breakdown.errors[:2])}\n"
                )

        return report
