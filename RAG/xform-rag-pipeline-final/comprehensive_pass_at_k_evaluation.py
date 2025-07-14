#!/usr/bin/env python3
"""
Enhanced Comprehensive Pass@k Evaluation Script for Xform RAG Pipeline
Supports multiple models and saves detailed results with Pass@1,3,5,10

Usage:
    python comprehensive_pass_at_k_evaluation.py --model ollama:codellama
    python comprehensive_pass_at_k_evaluation.py --model ollama:deepseek-coder
    python comprehensive_pass_at_k_evaluation.py --model ec2 --endpoint https://your-endpoint.com
"""

import sys
import time
import json
import logging
import argparse
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any
from collections import defaultdict

# Add the package to the path
sys.path.insert(0, str(Path(__file__).parent))

from xform_rag import (
    create_pipeline,
    RAGConfig,
    TaskSpecBuilder,
    XformEvaluator,
    TestFileGenerator,
    PassAtKCalculator,
)


class ComprehensivePassAtKEvaluator:
    """Comprehensive Pass@k evaluation across all task categories"""

    def __init__(
        self, k_values: List[int] = [1, 3, 5, 10], model_config: Dict[str, Any] = None
    ):
        self.k_values = k_values
        self.max_k = max(k_values)
        self.model_config = model_config or {}
        self.logger = self._setup_logging()

        # Initialize pipeline with model configuration
        self.logger.info("🚀 Initializing Xform RAG Pipeline...")
        self.logger.info(f"   Model Config: {self.model_config}")

        # Create config from model_config
        config_dict = {
            "model_type": self.model_config.get("type", "ollama"),
            "model_name": self.model_config.get("name", "codellama"),
        }
        if self.model_config.get("endpoint"):
            config_dict["ec2_endpoint"] = self.model_config["endpoint"]

        config = RAGConfig.from_dict(config_dict)

        from xform_rag import XformRAGPipeline

        self.pipeline = XformRAGPipeline(config)

        # Test system connectivity
        self.logger.info("🧪 Testing system connectivity...")
        if not self.pipeline.code_generator.test_connection():
            raise RuntimeError(
                "❌ System connectivity test failed. Check model connection."
            )
        self.logger.info("✅ System connectivity confirmed")

        # Ensure test files exist
        self.logger.info("📁 Setting up test environment...")
        TestFileGenerator.create_test_files()
        self.logger.info("✅ Test files ready")

        # Initialize evaluator
        self.evaluator = XformEvaluator()
        self.pass_calculator = PassAtKCalculator()

        # Results storage with enhanced structure
        self.results = {
            "basic": {},  # Simple tasks
            "intermediate": {},  # Medium tasks
            "advanced": {},  # Complex + Novel tasks
        }
        self.overall_results = {}
        self.detailed_task_data = []  # Store all individual task results

        # Create results directory immediately
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        model_name = (
            f"{config_dict['model_type']}_{config_dict['model_name'].replace(':', '_')}"
        )
        self.results_dir = Path(f"pass_at_k_evaluation_{model_name}_{timestamp}")
        self.results_dir.mkdir(exist_ok=True)
        self.logger.info(f"📁 Results will be saved to: {self.results_dir}")

    def _setup_logging(self) -> logging.Logger:
        """Setup comprehensive logging with model-specific filename"""
        logger = logging.getLogger("pass_at_k_eval")
        logger.setLevel(logging.INFO)

        # Clear any existing handlers
        for handler in logger.handlers[:]:
            logger.removeHandler(handler)

        # Console handler
        console_handler = logging.StreamHandler()
        console_formatter = logging.Formatter(
            "%(asctime)s - %(levelname)s - %(message)s", datefmt="%H:%M:%S"
        )
        console_handler.setFormatter(console_formatter)
        logger.addHandler(console_handler)

        # File handler with model info in filename
        model_info = f"{self.model_config.get('type', 'unknown')}_{self.model_config.get('name', 'unknown').replace(':', '_')}"
        log_file = Path(
            f"pass_at_k_evaluation_{model_info}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
        )
        file_handler = logging.FileHandler(log_file)
        file_formatter = logging.Formatter(
            "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
        )
        file_handler.setFormatter(file_formatter)
        logger.addHandler(file_handler)

        logger.info(f"📝 Logging to: {log_file}")
        return logger

    def categorize_tasks(self) -> Dict[str, List]:
        """Categorize tasks into three main groups"""
        self.logger.info("📋 Loading and categorizing tasks...")

        all_tasks = TaskSpecBuilder.create_comprehensive_test_suite()

        categories = {
            "basic": [],  # Simple
            "intermediate": [],  # Medium
            "advanced": [],  # Complex + Novel
        }

        for task in all_tasks:
            if task.complexity == "simple":
                categories["basic"].append(task)
            elif task.complexity == "medium":
                categories["intermediate"].append(task)
            elif task.complexity in ["complex", "novel"]:
                categories["advanced"].append(task)

        # Log category breakdown
        for category, tasks in categories.items():
            self.logger.info(f"   {category.title()}: {len(tasks)} tasks")
            for task in tasks:
                self.logger.debug(f"      - {task.name} ({task.complexity})")

        self.logger.info(
            f"✅ Categorized {sum(len(tasks) for tasks in categories.values())} total tasks"
        )
        return categories

    def generate_multiple_attempts(self, task, attempts: int = 5) -> List[str]:
        """Generate multiple attempts for a task with some variation"""
        self.logger.debug(f"   Generating {attempts} attempts for {task.name}")

        generated_codes = []

        for attempt in range(attempts):
            try:
                # Add slight variation to the request for diversity
                variations = [
                    task.description,
                    f"Please {task.description.lower()}",
                    f"Create a transformation that will {task.description.lower()}",
                    f"Generate code to {task.description.lower()}",
                    f"Implement a solution to {task.description.lower()}",
                ]

                request = variations[attempt % len(variations)]

                # Generate the transformation
                result = self.pipeline.generate_xform(request)

                if "error" not in result:
                    generated_codes.append(result["code"])
                else:
                    self.logger.warning(
                        f"      Attempt {attempt + 1} failed: {result['error']}"
                    )
                    generated_codes.append(f"# Generation failed: {result['error']}")

                # Small delay between attempts
                time.sleep(0.5)

            except Exception as e:
                self.logger.warning(f"      Attempt {attempt + 1} exception: {e}")
                generated_codes.append(f"# Exception during generation: {e}")

        return generated_codes

    def evaluate_task_pass_at_k(self, task) -> Dict[str, Any]:
        """Evaluate a single task with Pass@k metrics"""
        self.logger.info(f"   📊 Evaluating: {task.name}")
        start_time = time.time()

        # Generate multiple attempts
        generated_codes = self.generate_multiple_attempts(task, self.max_k)

        # Evaluate each attempt
        attempt_results = []
        attempt_details = []
        scores = []

        for i, code in enumerate(generated_codes):
            try:
                result = self.evaluator.evaluate_single_generation(
                    task, code, attempt_number=i + 1
                )
                attempt_results.append(result.success)
                scores.append(result.overall_score)

                # Store detailed attempt information
                attempt_details.append(
                    {
                        "attempt_number": i + 1,
                        "success": result.success,
                        "overall_score": result.overall_score,
                        "metric_scores": result.score_breakdown.metric_scores,
                        "errors": result.score_breakdown.errors,
                        "warnings": result.score_breakdown.warnings,
                        "generated_code_length": len(code),
                        "execution_time": result.execution_time,
                    }
                )

                self.logger.debug(
                    f"      Attempt {i+1}: {'PASS' if result.success else 'FAIL'} (Score: {result.overall_score:.3f})"
                )

            except Exception as e:
                self.logger.warning(f"      Evaluation error for attempt {i+1}: {e}")
                attempt_results.append(False)
                scores.append(0.0)
                attempt_details.append(
                    {
                        "attempt_number": i + 1,
                        "success": False,
                        "overall_score": 0.0,
                        "error": str(e),
                        "generated_code_length": len(code),
                    }
                )

        # Calculate Pass@k scores
        pass_at_k_scores = self.pass_calculator.calculate_pass_at_k(
            attempt_results, self.k_values
        )

        evaluation_time = time.time() - start_time

        result = {
            "task_name": task.name,
            "task_description": task.description,
            "complexity": task.complexity,
            "category": getattr(task, "category", "unknown"),
            "requirements": task.requirements,
            "pass_at_k_scores": pass_at_k_scores,
            "attempt_results": attempt_results,
            "attempt_details": attempt_details,  # New: detailed attempt information
            "scores": scores,
            "best_score": max(scores) if scores else 0.0,
            "worst_score": min(scores) if scores else 0.0,
            "average_score": sum(scores) / len(scores) if scores else 0.0,
            "successful_attempts": [
                i + 1 for i, passed in enumerate(attempt_results) if passed
            ],
            "total_attempts": len(attempt_results),
            "evaluation_time": evaluation_time,
            "timestamp": datetime.now().isoformat(),
        }

        # Add to detailed task data for comprehensive saving
        self.detailed_task_data.append(result)

        # Save individual task result immediately (incremental saving)
        task_result_file = (
            self.results_dir
            / f"task_{task.name}_{datetime.now().strftime('%H%M%S')}.json"
        )
        with open(task_result_file, "w") as f:
            json.dump(result, f, indent=2)

        # Log task summary with all k values
        pass_summary = ", ".join(
            [f"Pass@{k}: {pass_at_k_scores[k]:.0%}" for k in self.k_values]
        )
        self.logger.info(
            f"      Results: {pass_summary}, Avg Score: {result['average_score']:.3f}"
        )

        return result

    def evaluate_category(self, category_name: str, tasks: List) -> Dict[str, Any]:
        """Evaluate all tasks in a category"""
        self.logger.info(
            f"🎯 Starting {category_name.upper()} category ({len(tasks)} tasks)"
        )

        category_start_time = time.time()
        task_results = []

        for i, task in enumerate(tasks, 1):
            self.logger.info(
                f"📝 Task {i}/{len(tasks)} in {category_name}: {task.name}"
            )

            try:
                task_result = self.evaluate_task_pass_at_k(task)
                task_results.append(task_result)

                # Progress update
                if i % 2 == 0 or i == len(tasks):
                    self.logger.info(
                        f"   Progress: {i}/{len(tasks)} tasks completed in {category_name}"
                    )

            except Exception as e:
                self.logger.error(f"   ❌ Failed to evaluate {task.name}: {e}")
                # Create failed result
                failed_result = {
                    "task_name": task.name,
                    "complexity": task.complexity,
                    "pass_at_k_scores": {k: 0.0 for k in self.k_values},
                    "attempt_results": [False] * self.max_k,
                    "scores": [0.0] * self.max_k,
                    "error": str(e),
                }
                task_results.append(failed_result)

        # Calculate category-level Pass@k aggregation
        category_pass_at_k = {}
        for k in self.k_values:
            k_scores = [
                task["pass_at_k_scores"][k]
                for task in task_results
                if "pass_at_k_scores" in task
            ]
            category_pass_at_k[k] = sum(k_scores) / len(k_scores) if k_scores else 0.0

        category_time = time.time() - category_start_time

        category_result = {
            "category_name": category_name,
            "total_tasks": len(tasks),
            "completed_tasks": len([r for r in task_results if "error" not in r]),
            "failed_tasks": len([r for r in task_results if "error" in r]),
            "category_pass_at_k": category_pass_at_k,
            "task_results": task_results,
            "average_best_score": sum(r.get("best_score", 0) for r in task_results)
            / len(task_results),
            "average_score": sum(r.get("average_score", 0) for r in task_results)
            / len(task_results),
            "evaluation_time": category_time,
        }

        # Log category summary
        self.logger.info(f"✅ {category_name.upper()} category complete!")
        self.logger.info(
            f"   Pass@1: {category_pass_at_k[1]:.1%}, Pass@3: {category_pass_at_k[3]:.1%}, Pass@5: {category_pass_at_k[5]:.1%}"
        )
        self.logger.info(
            f"   Time: {category_time:.1f}s, Tasks: {category_result['completed_tasks']}/{category_result['total_tasks']}"
        )

        return category_result

    def calculate_overall_results(self):
        """Calculate overall Pass@k scores across all categories"""
        self.logger.info("📊 Calculating overall results...")

        all_task_results = []
        for category_result in self.results.values():
            all_task_results.extend(category_result["task_results"])

        # Overall Pass@k
        overall_pass_at_k = {}
        for k in self.k_values:
            k_scores = [
                task["pass_at_k_scores"][k]
                for task in all_task_results
                if "pass_at_k_scores" in task
            ]
            overall_pass_at_k[k] = sum(k_scores) / len(k_scores) if k_scores else 0.0

        # Overall statistics
        all_scores = []
        all_best_scores = []
        successful_tasks = 0
        total_attempts = 0
        successful_attempts = 0

        for task in all_task_results:
            if "scores" in task:
                all_scores.extend(task["scores"])
                all_best_scores.append(task.get("best_score", 0))
                if task.get("best_score", 0) >= 0.6:  # Pass threshold
                    successful_tasks += 1
                total_attempts += task.get("total_attempts", 0)
                successful_attempts += len(task.get("successful_attempts", []))

        self.overall_results = {
            "total_tasks": len(all_task_results),
            "successful_tasks": successful_tasks,
            "overall_success_rate": (
                successful_tasks / len(all_task_results) if all_task_results else 0.0
            ),
            "overall_pass_at_k": overall_pass_at_k,
            "total_attempts": total_attempts,
            "successful_attempts": successful_attempts,
            "overall_attempt_success_rate": (
                successful_attempts / total_attempts if total_attempts else 0.0
            ),
            "average_score": sum(all_scores) / len(all_scores) if all_scores else 0.0,
            "average_best_score": (
                sum(all_best_scores) / len(all_best_scores) if all_best_scores else 0.0
            ),
            "max_score": max(all_scores) if all_scores else 0.0,
            "min_score": min(all_scores) if all_scores else 0.0,
        }

        self.logger.info("✅ Overall results calculated")

    def save_results(self):
        """Save comprehensive and clearly organized results"""
        self.logger.info(f"💾 Saving comprehensive results to {self.results_dir}")

        # 1. MAIN RESULTS FILE - Core pass@k scores and summary
        main_results = {
            "evaluation_metadata": {
                "timestamp": datetime.now().isoformat(),
                "model_config": self.model_config,
                "k_values": self.k_values,
                "max_attempts_per_task": self.max_k,
                "total_evaluation_time": sum(
                    cat.get("evaluation_time", 0) for cat in self.results.values()
                ),
                "pipeline_config": {
                    "model_type": self.pipeline.config.model_type,
                    "model_name": self.pipeline.config.model_name,
                    "embedding_model": self.pipeline.config.embedding_model,
                },
            },
            "overall_results": self.overall_results,
            "category_results": self.results,
        }

        with open(self.results_dir / "MAIN_RESULTS.json", "w") as f:
            json.dump(main_results, f, indent=2)
        self.logger.info("✅ Saved MAIN_RESULTS.json - Core pass@k scores and summary")

        # 2. DETAILED TASK RESULTS - All individual task data
        detailed_results = {
            "evaluation_metadata": main_results["evaluation_metadata"],
            "detailed_task_results": self.detailed_task_data,
        }

        with open(self.results_dir / "DETAILED_TASK_RESULTS.json", "w") as f:
            json.dump(detailed_results, f, indent=2)
        self.logger.info(
            "✅ Saved DETAILED_TASK_RESULTS.json - All individual task details"
        )

        # 3. PASS@K SUMMARY TABLE - Easy to read pass@k scores
        self._save_pass_at_k_summary_table()

        # 4. COMPREHENSIVE REPORT - Human readable markdown
        self._generate_comprehensive_report()

        # 5. CSV FILES - For data analysis
        self._generate_csv_files()

        # 6. STATISTICS SUMMARY - Key metrics
        self._save_statistics_summary()

        # 7. Copy log file to results directory
        log_files = list(Path(".").glob("pass_at_k_evaluation_*.log"))
        if log_files:
            latest_log = max(log_files, key=lambda x: x.stat().st_mtime)
            import shutil

            shutil.copy2(latest_log, self.results_dir / "evaluation.log")
            self.logger.info("✅ Copied log file to results directory")

        self.logger.info("✅ All results saved successfully!")
        self.logger.info(f"📁 Results location: {self.results_dir.absolute()}")

        return self.results_dir

    def _save_pass_at_k_summary_table(self):
        """Save a clear Pass@k summary table"""
        summary_data = {
            "overall_pass_at_k": self.overall_results["overall_pass_at_k"],
            "category_pass_at_k": {},
        }

        for category_name, category_data in self.results.items():
            if category_data:
                summary_data["category_pass_at_k"][category_name] = category_data[
                    "category_pass_at_k"
                ]

        # Also create a simple table format
        table_text = "PASS@K SUMMARY TABLE\n"
        table_text += "=" * 50 + "\n\n"

        # Header
        header = f"{'Category':<15}"
        for k in self.k_values:
            header += f"Pass@{k:<3}"
        table_text += header + "\n" + "-" * len(header) + "\n"

        # Overall row
        overall_row = f"{'OVERALL':<15}"
        for k in self.k_values:
            overall_row += f"{self.overall_results['overall_pass_at_k'][k]:.1%} "
        table_text += overall_row + "\n"

        # Category rows
        for category_name, category_data in self.results.items():
            if category_data:
                row = f"{category_name.title():<15}"
                for k in self.k_values:
                    row += f"{category_data['category_pass_at_k'][k]:.1%} "
                table_text += row + "\n"

        with open(self.results_dir / "PASS_AT_K_SUMMARY.json", "w") as f:
            json.dump(summary_data, f, indent=2)

        with open(self.results_dir / "PASS_AT_K_SUMMARY.txt", "w") as f:
            f.write(table_text)

        self.logger.info("✅ Saved PASS_AT_K_SUMMARY files - Clear pass@k tables")

    def _save_statistics_summary(self):
        """Save key statistics summary"""
        stats = {
            "model_info": {
                "type": self.model_config.get("type"),
                "name": self.model_config.get("name"),
                "endpoint": self.model_config.get("endpoint", "N/A"),
            },
            "evaluation_scope": {
                "total_tasks": self.overall_results["total_tasks"],
                "total_attempts": self.overall_results["total_attempts"],
                "k_values_tested": self.k_values,
                "categories_tested": list(self.results.keys()),
            },
            "key_metrics": {
                "overall_pass_at_k": self.overall_results["overall_pass_at_k"],
                "overall_success_rate": self.overall_results["overall_success_rate"],
                "average_score": self.overall_results["average_score"],
                "average_best_score": self.overall_results["average_best_score"],
            },
            "performance_by_category": {},
        }

        for category_name, category_data in self.results.items():
            if category_data:
                stats["performance_by_category"][category_name] = {
                    "pass_at_k": category_data["category_pass_at_k"],
                    "average_score": category_data["average_score"],
                    "tasks_completed": category_data["completed_tasks"],
                    "tasks_total": category_data["total_tasks"],
                }

        with open(self.results_dir / "STATISTICS_SUMMARY.json", "w") as f:
            json.dump(stats, f, indent=2)

        self.logger.info(
            "✅ Saved STATISTICS_SUMMARY.json - Key metrics and performance data"
        )

    def _generate_comprehensive_report(self):
        """Generate comprehensive human-readable report"""

        report = f"""# Comprehensive Pass@k Evaluation Report

**Generated:** {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
**Model:** {self.model_config.get('type')}:{self.model_config.get('name')}
**Endpoint:** {self.model_config.get('endpoint', 'N/A')}
**K Values:** {self.k_values}
**Max Attempts per Task:** {self.max_k}

## 🎯 Overall Results

"""
        for k in self.k_values:
            report += f"- **Overall Pass@{k}**: {self.overall_results['overall_pass_at_k'][k]:.1%}\n"

        report += f"""
- **Total Tasks**: {self.overall_results['total_tasks']}
- **Successful Tasks**: {self.overall_results['successful_tasks']} ({self.overall_results['overall_success_rate']:.1%})
- **Total Attempts**: {self.overall_results['total_attempts']}
- **Successful Attempts**: {self.overall_results['successful_attempts']} ({self.overall_results['overall_attempt_success_rate']:.1%})
- **Average Score**: {self.overall_results['average_score']:.3f}
- **Average Best Score**: {self.overall_results['average_best_score']:.3f}

## 📊 Results by Category

"""

        for category_name, category_data in self.results.items():
            if not category_data:
                continue

            report += f"""### {category_name.title()} Tasks

"""
            for k in self.k_values:
                report += (
                    f"- **Pass@{k}**: {category_data['category_pass_at_k'][k]:.1%}\n"
                )

            report += f"""- **Tasks**: {category_data['completed_tasks']}/{category_data['total_tasks']}
- **Average Score**: {category_data['average_score']:.3f}
- **Average Best Score**: {category_data['average_best_score']:.3f}
- **Evaluation Time**: {category_data['evaluation_time']:.1f}s

#### Individual Task Results:

"""
            for task in category_data["task_results"]:
                if "error" not in task:
                    pass_scores = ", ".join(
                        [
                            f"Pass@{k}: {task['pass_at_k_scores'][k]:.0%}"
                            for k in self.k_values
                        ]
                    )
                    report += f"- **{task['task_name']}**: {pass_scores}, Best: {task['best_score']:.3f}, Avg: {task['average_score']:.3f}\n"
                else:
                    report += f"- **{task['task_name']}**: ❌ FAILED - {task.get('error', 'Unknown error')}\n"

            report += "\n"

        # Add detailed task analysis
        report += """## 📋 Detailed Task Analysis

| Task Name | Category | Complexity | Pass@1 | Pass@3 | Pass@5 | Pass@10 | Best Score | Avg Score |
|-----------|----------|------------|--------|--------|--------|---------|------------|-----------|
"""

        for task_data in self.detailed_task_data:
            if "error" not in task_data:
                scores = task_data["pass_at_k_scores"]
                report += f"| {task_data['task_name']} | {task_data['category']} | {task_data['complexity']} |"
                for k in self.k_values:
                    report += f" {scores[k]:.0%} |"
                report += f" {task_data['best_score']:.3f} | {task_data['average_score']:.3f} |\n"

        # Add model configuration details
        report += f"""

## ⚙️ Configuration Details

**Model Configuration:**
- Type: {self.model_config.get('type')}
- Name: {self.model_config.get('name')}
- Endpoint: {self.model_config.get('endpoint', 'Local/Default')}

**Evaluation Configuration:**
- K Values: {self.k_values}
- Attempts per Task: {self.max_k}
- Pass Threshold: 0.6
- Embedding Model: {self.pipeline.config.embedding_model}

**Task Categories:**
- Basic: Simple transformations (wire-to-reg, renaming, etc.)
- Intermediate: Medium complexity (multi-signal, reset conditions, etc.)
- Advanced: Complex transformations (FSM, arrays, novel features)
"""

        with open(self.results_dir / "COMPREHENSIVE_REPORT.md", "w") as f:
            f.write(report)

        self.logger.info(
            "✅ Saved COMPREHENSIVE_REPORT.md - Detailed human-readable analysis"
        )

    def _generate_csv_files(self):
        """Generate CSV files for data analysis"""
        import csv

        # 1. Main results CSV
        with open(self.results_dir / "RESULTS_SUMMARY.csv", "w", newline="") as csvfile:
            fieldnames = (
                ["category", "task_name", "complexity", "task_category"]
                + [f"pass_at_{k}" for k in self.k_values]
                + [
                    "best_score",
                    "average_score",
                    "worst_score",
                    "successful_attempts",
                    "total_attempts",
                    "evaluation_time",
                ]
            )
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            writer.writeheader()

            for category_name, category_data in self.results.items():
                if not category_data:
                    continue
                for task in category_data["task_results"]:
                    if "error" not in task:
                        row = {
                            "category": category_name,
                            "task_name": task["task_name"],
                            "complexity": task["complexity"],
                            "task_category": task.get("category", "unknown"),
                            "best_score": task["best_score"],
                            "average_score": task["average_score"],
                            "worst_score": task["worst_score"],
                            "successful_attempts": len(task["successful_attempts"]),
                            "total_attempts": task["total_attempts"],
                            "evaluation_time": task.get("evaluation_time", 0),
                        }
                        for k in self.k_values:
                            row[f"pass_at_{k}"] = task["pass_at_k_scores"][k]
                        writer.writerow(row)

        # 2. Pass@k summary CSV
        with open(
            self.results_dir / "PASS_AT_K_SUMMARY.csv", "w", newline=""
        ) as csvfile:
            fieldnames = (
                ["category"]
                + [f"pass_at_{k}" for k in self.k_values]
                + ["avg_score", "tasks_completed"]
            )
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            writer.writeheader()

            # Overall row
            overall_row = {
                "category": "OVERALL",
                "avg_score": self.overall_results["average_score"],
                "tasks_completed": self.overall_results["total_tasks"],
            }
            for k in self.k_values:
                overall_row[f"pass_at_{k}"] = self.overall_results["overall_pass_at_k"][
                    k
                ]
            writer.writerow(overall_row)

            # Category rows
            for category_name, category_data in self.results.items():
                if category_data:
                    row = {
                        "category": category_name.title(),
                        "avg_score": category_data["average_score"],
                        "tasks_completed": category_data["completed_tasks"],
                    }
                    for k in self.k_values:
                        row[f"pass_at_{k}"] = category_data["category_pass_at_k"][k]
                    writer.writerow(row)

        self.logger.info(
            "✅ Saved CSV files - RESULTS_SUMMARY.csv and PASS_AT_K_SUMMARY.csv"
        )

    def run_comprehensive_evaluation(self):
        """Run the complete comprehensive Pass@k evaluation"""
        self.logger.info("🚀 Starting Comprehensive Pass@k Evaluation")
        self.logger.info(f"   K Values: {self.k_values}")
        self.logger.info(f"   Max Attempts per Task: {self.max_k}")

        total_start_time = time.time()

        # Get categorized tasks
        categorized_tasks = self.categorize_tasks()

        # Evaluate each category
        for category_name, tasks in categorized_tasks.items():
            if tasks:  # Only evaluate if there are tasks in the category
                category_result = self.evaluate_category(category_name, tasks)
                self.results[category_name] = category_result
            else:
                self.logger.warning(f"⚠️ No tasks found in {category_name} category")

        # Calculate overall results
        self.calculate_overall_results()

        # Save results
        results_dir = self.save_results()

        total_time = time.time() - total_start_time

        # Final summary with all k values
        self.logger.info("🎉 COMPREHENSIVE PASS@K EVALUATION COMPLETE!")
        self.logger.info(
            f"⏱️ Total Time: {total_time:.1f} seconds ({total_time/60:.1f} minutes)"
        )
        self.logger.info("📊 FINAL RESULTS:")
        for k in self.k_values:
            self.logger.info(
                f"   Overall Pass@{k}: {self.overall_results['overall_pass_at_k'][k]:.1%}"
            )
        self.logger.info(
            f"   Average Score: {self.overall_results['average_score']:.3f}"
        )
        self.logger.info(
            f"   Success Rate: {self.overall_results['overall_success_rate']:.1%}"
        )
        self.logger.info(f"📁 Results Directory: {results_dir}")

        return self.results, self.overall_results


def parse_arguments():
    """Parse command line arguments for model configuration"""
    parser = argparse.ArgumentParser(
        description="Comprehensive Pass@k Evaluation for Xform RAG Pipeline",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Default Ollama model
  python comprehensive_pass_at_k_evaluation.py
  
  # Specific Ollama model
  python comprehensive_pass_at_k_evaluation.py --model ollama:codellama:7b
  python comprehensive_pass_at_k_evaluation.py --model ollama:deepseek-coder:6.7b
  
  # EC2 hosted model
  python comprehensive_pass_at_k_evaluation.py --model ec2 --endpoint https://your-model.amazonaws.com
  
  # Custom k values
  python comprehensive_pass_at_k_evaluation.py --k-values 1 3 5 10 20
        """,
    )

    parser.add_argument(
        "--model",
        default="ollama:codellama",
        help='Model specification: "ollama:model_name" or "ec2" (default: ollama:codellama)',
    )

    parser.add_argument(
        "--endpoint", help="EC2 endpoint URL (required when using ec2 model)"
    )

    parser.add_argument(
        "--k-values",
        nargs="+",
        type=int,
        default=[1, 3, 5, 10],
        help="K values for Pass@k evaluation (default: 1 3 5 10)",
    )

    parser.add_argument(
        "--quick",
        action="store_true",
        help="Quick evaluation with fewer attempts (k=3 max)",
    )

    parser.add_argument(
        "--categories",
        nargs="+",
        choices=["basic", "intermediate", "advanced"],
        default=["basic", "intermediate", "advanced"],
        help="Categories to evaluate (default: all)",
    )

    args = parser.parse_args()

    # Parse model configuration
    model_config = {}
    if args.model.startswith("ollama:"):
        model_config["type"] = "ollama"
        model_config["name"] = args.model.split(":", 1)[1]
    elif args.model == "ec2":
        model_config["type"] = "ec2"
        model_config["name"] = "ec2_model"
        if not args.endpoint:
            parser.error("--endpoint is required when using ec2 model")
        model_config["endpoint"] = args.endpoint
    elif args.model == "ollama":
        model_config["type"] = "ollama"
        model_config["name"] = "codellama"
    else:
        # Assume it's an ollama model name
        model_config["type"] = "ollama"
        model_config["name"] = args.model

    # Adjust k values for quick mode
    if args.quick:
        args.k_values = [k for k in args.k_values if k <= 3]
        if not args.k_values:
            args.k_values = [1, 3]

    return args, model_config


def main():
    """Main entry point with argument parsing"""
    args, model_config = parse_arguments()

    print("🎯 Comprehensive Pass@k Evaluation for Xform RAG Pipeline")
    print("=" * 70)
    print(f"Model: {model_config['type']}:{model_config['name']}")
    if model_config.get("endpoint"):
        print(f"Endpoint: {model_config['endpoint']}")
    print(f"K Values: {args.k_values}")
    print(f"Categories: {args.categories}")
    print()
    print("This will evaluate tasks across three categories:")
    if "basic" in args.categories:
        print("  📘 Basic (Simple tasks)")
    if "intermediate" in args.categories:
        print("  📙 Intermediate (Medium complexity)")
    if "advanced" in args.categories:
        print("  📕 Advanced (Complex + Novel)")
    print()
    print("For each task, it will:")
    print(f"  • Generate {max(args.k_values)} different attempts")
    print(f"  • Calculate Pass@{', Pass@'.join(map(str, args.k_values))} scores")
    print(f"  • Provide comprehensive analysis and save detailed results")
    print()

    # Estimate time
    estimated_minutes = len(args.categories) * 5 * max(args.k_values) / 60
    print(
        f"⏱️ Estimated time: {estimated_minutes:.0f}-{estimated_minutes*2:.0f} minutes"
    )
    print()

    # Get user confirmation
    try:
        if not args.quick:
            response = (
                input("⚠️ This will take significant time. Continue? (y/N): ")
                .strip()
                .lower()
            )
            if response not in ["y", "yes"]:
                print("❌ Evaluation cancelled by user")
                return 1
    except KeyboardInterrupt:
        print("\n❌ Evaluation cancelled by user")
        return 1

    try:
        # Run comprehensive evaluation
        evaluator = ComprehensivePassAtKEvaluator(
            k_values=args.k_values, model_config=model_config
        )

        # Filter categories if specified
        if set(args.categories) != {"basic", "intermediate", "advanced"}:
            print(f"🎯 Evaluating selected categories: {args.categories}")

        category_results, overall_results = evaluator.run_comprehensive_evaluation()

        # Quick console summary
        print("\n" + "=" * 70)
        print("📊 QUICK SUMMARY")
        print("=" * 70)
        for k in args.k_values:
            print(f"Overall Pass@{k}: {overall_results['overall_pass_at_k'][k]:.1%}")
        print()

        for category_name, category_data in category_results.items():
            if category_data and category_name in args.categories:
                pass_summary = ", ".join(
                    [
                        f"Pass@{k}: {category_data['category_pass_at_k'][k]:.1%}"
                        for k in args.k_values
                    ]
                )
                print(f"{category_name.title()}: {pass_summary}")

        print(f"\n✅ Comprehensive evaluation completed successfully!")
        print(f"📁 Results saved to: {evaluator.results_dir}")
        print("📄 Key files:")
        print("   - MAIN_RESULTS.json (Core pass@k scores)")
        print("   - PASS_AT_K_SUMMARY.txt (Quick reference table)")
        print("   - COMPREHENSIVE_REPORT.md (Detailed analysis)")
        print("   - RESULTS_SUMMARY.csv (Data analysis)")

        return 0

    except KeyboardInterrupt:
        print("\n⚠️ Evaluation interrupted by user")
        return 1
    except Exception as e:
        print(f"\n❌ Evaluation failed: {e}")
        import traceback

        traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())
