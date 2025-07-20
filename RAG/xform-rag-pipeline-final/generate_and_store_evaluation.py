#!/usr/bin/env python3
"""
Generate, Evaluate & Store Xform Files Script
Creates actual .py xform files and evaluates them with Pass@k metrics

Usage:
    python generate_and_store_evaluation.py
    python generate_and_store_evaluation.py --model ollama:deepseek-coder
    python generate_and_store_evaluation.py --k-values 1 3 5
"""

import sys
import time
import json
import logging
import argparse
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any

# Add the package to the path
sys.path.insert(0, str(Path(__file__).parent))

from xform_rag import (
    create_pipeline,
    RAGConfig,
    TaskSpec,
    XformEvaluator,
    TestFileGenerator,
    PassAtKCalculator,
)


class GenerateAndStoreEvaluator:
    """Generate xform files, evaluate them, and store everything"""

    def __init__(
        self, k_values: List[int] = [1, 3, 5], model_config: Dict[str, Any] = None
    ):
        self.k_values = k_values
        self.max_k = max(k_values)
        self.model_config = model_config or {"type": "ollama", "name": "codellama"}

        # Create results directory
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        model_name = (
            f"{self.model_config['type']}_{self.model_config['name'].replace(':', '_')}"
        )
        self.results_dir = Path(f"xform_generation_evaluation_{model_name}_{timestamp}")
        self.results_dir.mkdir(exist_ok=True)

        # Create subdirectories
        self.xforms_dir = self.results_dir / "generated_xforms"
        self.evaluations_dir = self.results_dir / "evaluations"
        self.xforms_dir.mkdir(exist_ok=True)
        self.evaluations_dir.mkdir(exist_ok=True)

        # Setup logging
        self.logger = self._setup_logging()

        # Initialize pipeline
        self.logger.info("🚀 Initializing pipeline...")
        config_dict = {
            "model_type": self.model_config["type"],
            "model_name": self.model_config["name"],
        }
        if self.model_config.get("endpoint"):
            config_dict["ec2_endpoint"] = self.model_config["endpoint"]

        config = RAGConfig.from_dict(config_dict)
        from xform_rag import XformRAGPipeline

        self.pipeline = XformRAGPipeline(config)

        # Test connectivity
        if not self.pipeline.code_generator.test_connection():
            raise RuntimeError("❌ System connectivity test failed")
        self.logger.info("✅ System ready")

        # Setup test environment
        TestFileGenerator.create_test_files()
        self.evaluator = XformEvaluator()
        self.pass_calculator = PassAtKCalculator()

        # Results storage
        self.all_results = []

    def _setup_logging(self):
        """Setup logging"""
        logger = logging.getLogger("generate_and_store")
        logger.setLevel(logging.INFO)

        # Clear handlers
        for handler in logger.handlers[:]:
            logger.removeHandler(handler)

        # Console handler
        console_handler = logging.StreamHandler()
        console_formatter = logging.Formatter(
            "%(asctime)s - %(levelname)s - %(message)s", datefmt="%H:%M:%S"
        )
        console_handler.setFormatter(console_formatter)
        logger.addHandler(console_handler)

        # File handler
        log_file = self.results_dir / "generation_evaluation.log"
        file_handler = logging.FileHandler(log_file)
        file_formatter = logging.Formatter(
            "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
        )
        file_handler.setFormatter(file_formatter)
        logger.addHandler(file_handler)

        logger.info(f"📁 Results directory: {self.results_dir}")
        logger.info(f"📁 Xforms will be saved to: {self.xforms_dir}")
        logger.info(f"📁 Evaluations will be saved to: {self.evaluations_dir}")

        return logger

    def get_selected_test_cases(self) -> List[TaskSpec]:
        """Get a curated selection of test cases covering different complexities"""

        test_cases = [
            # BASIC TASKS (2 tasks)
            TaskSpec(
                name="wire_to_reg_basic",
                description="Transform wire declarations to reg declarations",
                complexity="simple",
                category="signal_modification",
                requirements=[
                    "Find all wire declarations in the Verilog file",
                    "Replace 'wire' keyword with 'reg' keyword",
                    "Preserve bit widths and signal names",
                ],
                input_file="test_simple.v",
            ),
            TaskSpec(
                name="signal_rename_basic",
                description="Rename any signal throughout a Verilog module",
                complexity="simple",
                category="signal_modification",
                requirements=[
                    "Take old_name and new_name as parameters",
                    "Find all occurrences of the signal",
                    "Replace in declarations, assignments, and references",
                ],
                input_file="test_simple.v",
            ),
            # INTERMEDIATE TASKS (2 tasks)
            TaskSpec(
                name="add_enable_signal",
                description="Add an enable signal to control a counter",
                complexity="medium",
                category="feature_addition",
                requirements=[
                    "Find counter increment statements (counter <= counter + 1)",
                    "Add enable signal as new input port",
                    "Wrap counter increments with enable condition",
                ],
                input_file="test_medium.v",
            ),
            TaskSpec(
                name="reset_condition_change",
                description="Change reset condition from active-high to active-low or vice versa",
                complexity="medium",
                category="control_logic",
                requirements=[
                    "Find reset signal usage in if statements",
                    "Change if(rst) to if(!rst) or vice versa",
                    "Update sensitivity lists appropriately",
                ],
                input_file="test_medium.v",
            ),
            # ADVANCED TASKS (2 tasks)
            TaskSpec(
                name="fsm_state_rename",
                description="Systematically rename FSM state names throughout a module",
                complexity="complex",
                category="fsm_modification",
                requirements=[
                    "Identify FSM state enum/parameter declarations",
                    "Take old_prefix and new_prefix as parameters",
                    "Rename all states that match the prefix pattern",
                    "Update all references in case statements",
                ],
                input_file="test_complex.v",
            ),
            TaskSpec(
                name="add_debug_ports",
                description="Add comprehensive debug output ports to a module",
                complexity="complex",
                category="debug_enhancement",
                requirements=[
                    "Add debug output ports for internal signals",
                    "Add debug enable/disable functionality",
                    "Preserve original module functionality",
                    "Use proper port naming conventions",
                ],
                input_file="test_complex.v",
            ),
        ]

        self.logger.info(f"📋 Selected {len(test_cases)} test cases:")
        for task in test_cases:
            self.logger.info(f"   • {task.name} ({task.complexity})")

        return test_cases

    def generate_and_evaluate_task(self, task: TaskSpec) -> Dict[str, Any]:
        """Generate multiple attempts for a task, save xforms, and evaluate"""
        self.logger.info(f"🔧 Processing: {task.name}")
        start_time = time.time()

        attempts_data = []
        generated_files = []

        # Generate multiple attempts
        for attempt in range(self.max_k):
            self.logger.info(f"   Generating attempt {attempt + 1}/{self.max_k}")

            try:
                # Generate xform
                result = self.pipeline.generate_xform(task.description)

                if "error" not in result:
                    # Save the generated xform file
                    xform_filename = f"{task.name}_attempt_{attempt + 1}.py"
                    xform_path = self.xforms_dir / xform_filename

                    with open(xform_path, "w") as f:
                        f.write(f"#!/usr/bin/env python3\n")
                        f.write(f'"""\n')
                        f.write(f"Generated Xform: {task.name}\n")
                        f.write(f"Task: {task.description}\n")
                        f.write(f"Attempt: {attempt + 1}\n")
                        f.write(f"Generated: {datetime.now().isoformat()}\n")
                        f.write(f'"""\n\n')
                        f.write(result["code"])

                    generated_files.append(str(xform_path))

                    # Evaluate the generated code
                    eval_result = self.evaluator.evaluate_single_generation(
                        task, result["code"], attempt_number=attempt + 1
                    )

                    attempts_data.append(
                        {
                            "attempt_number": attempt + 1,
                            "success": eval_result.success,
                            "overall_score": eval_result.overall_score,
                            "metric_scores": eval_result.score_breakdown.metric_scores,
                            "errors": eval_result.score_breakdown.errors,
                            "warnings": eval_result.score_breakdown.warnings,
                            "xform_file": xform_filename,
                            "code_length": len(result["code"]),
                            "generation_metadata": {
                                "filename": result.get("filename", ""),
                                "source_documents": result.get("source_documents", []),
                            },
                        }
                    )

                    self.logger.info(
                        f"      ✅ Attempt {attempt + 1}: {'PASS' if eval_result.success else 'FAIL'} "
                        f"(Score: {eval_result.overall_score:.3f})"
                    )

                else:
                    # Generation failed
                    failed_xform_filename = (
                        f"{task.name}_attempt_{attempt + 1}_FAILED.py"
                    )
                    failed_xform_path = self.xforms_dir / failed_xform_filename

                    with open(failed_xform_path, "w") as f:
                        f.write(f"# GENERATION FAILED\n")
                        f.write(f"# Task: {task.description}\n")
                        f.write(f"# Attempt: {attempt + 1}\n")
                        f.write(f"# Error: {result['error']}\n")

                    attempts_data.append(
                        {
                            "attempt_number": attempt + 1,
                            "success": False,
                            "overall_score": 0.0,
                            "generation_error": result["error"],
                            "xform_file": failed_xform_filename,
                        }
                    )

                    self.logger.warning(
                        f"      ❌ Attempt {attempt + 1}: FAILED - {result['error']}"
                    )

                time.sleep(0.5)  # Small delay between attempts

            except Exception as e:
                self.logger.error(f"      💥 Attempt {attempt + 1}: EXCEPTION - {e}")
                attempts_data.append(
                    {
                        "attempt_number": attempt + 1,
                        "success": False,
                        "overall_score": 0.0,
                        "exception": str(e),
                    }
                )

        # Calculate Pass@k scores
        attempt_results = [attempt["success"] for attempt in attempts_data]
        pass_at_k_scores = self.pass_calculator.calculate_pass_at_k(
            attempt_results, self.k_values
        )

        # Calculate statistics
        scores = [attempt["overall_score"] for attempt in attempts_data]

        task_result = {
            "task_name": task.name,
            "task_description": task.description,
            "complexity": task.complexity,
            "category": task.category,
            "pass_at_k_scores": pass_at_k_scores,
            "attempts_data": attempts_data,
            "generated_files": generated_files,
            "statistics": {
                "best_score": max(scores) if scores else 0.0,
                "worst_score": min(scores) if scores else 0.0,
                "average_score": sum(scores) / len(scores) if scores else 0.0,
                "successful_attempts": sum(attempt_results),
                "total_attempts": len(attempt_results),
            },
            "evaluation_time": time.time() - start_time,
            "timestamp": datetime.now().isoformat(),
        }

        # Save individual task evaluation
        eval_file = self.evaluations_dir / f"{task.name}_evaluation.json"
        with open(eval_file, "w") as f:
            json.dump(task_result, f, indent=2)

        # Log task summary
        pass_summary = ", ".join(
            [f"Pass@{k}: {pass_at_k_scores[k]:.0%}" for k in self.k_values]
        )
        self.logger.info(f"   📊 Results: {pass_summary}")
        self.logger.info(f"   📁 Generated {len(generated_files)} xform files")

        return task_result

    def run_evaluation(self):
        """Run the complete evaluation"""
        self.logger.info("🎯 Starting Generate & Store Evaluation")
        self.logger.info(
            f"   Model: {self.model_config['type']}:{self.model_config['name']}"
        )
        self.logger.info(f"   K Values: {self.k_values}")

        total_start_time = time.time()

        # Get test cases
        test_cases = self.get_selected_test_cases()

        # Process each task
        for i, task in enumerate(test_cases, 1):
            self.logger.info(f"📝 Task {i}/{len(test_cases)}: {task.name}")

            try:
                task_result = self.generate_and_evaluate_task(task)
                self.all_results.append(task_result)
            except Exception as e:
                self.logger.error(f"❌ Task {task.name} failed completely: {e}")

        # Calculate overall results
        self._calculate_and_save_overall_results()

        total_time = time.time() - total_start_time

        # Final summary
        self.logger.info("🎉 EVALUATION COMPLETE!")
        self.logger.info(
            f"⏱️ Total Time: {total_time:.1f} seconds ({total_time/60:.1f} minutes)"
        )
        self.logger.info(f"📁 Results saved to: {self.results_dir}")
        self.logger.info(
            f"📁 Generated {len(list(self.xforms_dir.glob('*.py')))} xform files"
        )

        return self.results_dir

    def _calculate_and_save_overall_results(self):
        """Calculate and save overall results"""

        # Calculate overall Pass@k
        all_pass_results = []
        for task_result in self.all_results:
            for attempt in task_result["attempts_data"]:
                all_pass_results.append(attempt["success"])

        overall_pass_at_k = {}
        if all_pass_results:
            # Group by task for proper Pass@k calculation
            task_pass_results = []
            for task_result in self.all_results:
                task_attempts = [
                    attempt["success"] for attempt in task_result["attempts_data"]
                ]
                task_pass_at_k = self.pass_calculator.calculate_pass_at_k(
                    task_attempts, self.k_values
                )
                task_pass_results.append(task_pass_at_k)

            # Average across tasks
            for k in self.k_values:
                k_scores = [task_result[k] for task_result in task_pass_results]
                overall_pass_at_k[k] = (
                    sum(k_scores) / len(k_scores) if k_scores else 0.0
                )
        else:
            overall_pass_at_k = {k: 0.0 for k in self.k_values}

        # Overall statistics
        all_scores = []
        for task_result in self.all_results:
            for attempt in task_result["attempts_data"]:
                all_scores.append(attempt["overall_score"])

        overall_results = {
            "evaluation_metadata": {
                "timestamp": datetime.now().isoformat(),
                "model_config": self.model_config,
                "k_values": self.k_values,
                "total_tasks": len(self.all_results),
                "total_attempts": len(all_pass_results),
                "results_directory": str(self.results_dir),
                "xforms_directory": str(self.xforms_dir),
                "evaluations_directory": str(self.evaluations_dir),
            },
            "overall_pass_at_k": overall_pass_at_k,
            "overall_statistics": {
                "average_score": (
                    sum(all_scores) / len(all_scores) if all_scores else 0.0
                ),
                "best_score": max(all_scores) if all_scores else 0.0,
                "worst_score": min(all_scores) if all_scores else 0.0,
                "successful_attempts": sum(all_pass_results),
                "total_attempts": len(all_pass_results),
                "success_rate": (
                    sum(all_pass_results) / len(all_pass_results)
                    if all_pass_results
                    else 0.0
                ),
            },
            "task_results": self.all_results,
        }

        # Save main results
        with open(self.results_dir / "OVERALL_RESULTS.json", "w") as f:
            json.dump(overall_results, f, indent=2)

        # Save summary report
        self._save_summary_report(overall_results)

        # Save xform file index
        self._save_xform_index()

        self.logger.info("✅ Overall results calculated and saved")

    def _save_summary_report(self, overall_results):
        """Save human-readable summary report"""

        report = f"""# Generate & Store Evaluation Report

**Generated:** {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
**Model:** {self.model_config['type']}:{self.model_config['name']}
**K Values:** {self.k_values}

## 🎯 Overall Results

"""
        for k in self.k_values:
            report += f"- **Overall Pass@{k}**: {overall_results['overall_pass_at_k'][k]:.1%}\n"

        stats = overall_results["overall_statistics"]
        report += f"""
- **Total Tasks**: {overall_results['evaluation_metadata']['total_tasks']}
- **Total Attempts**: {stats['total_attempts']}
- **Successful Attempts**: {stats['successful_attempts']} ({stats['success_rate']:.1%})
- **Average Score**: {stats['average_score']:.3f}
- **Best Score**: {stats['best_score']:.3f}

## 📁 Generated Files

- **Xforms Directory**: `{self.xforms_dir.name}/`
- **Evaluations Directory**: `{self.evaluations_dir.name}/`
- **Total Xform Files**: {len(list(self.xforms_dir.glob('*.py')))}

## 📊 Task Results

| Task | Complexity | Pass@1 | Pass@{max(self.k_values)} | Best Score | Generated Files |
|------|------------|--------|---------|------------|-----------------|
"""

        for task_result in self.all_results:
            report += f"| {task_result['task_name']} | {task_result['complexity']} | "
            report += f"{task_result['pass_at_k_scores'][1]:.0%} | "
            report += f"{task_result['pass_at_k_scores'][max(self.k_values)]:.0%} | "
            report += f"{task_result['statistics']['best_score']:.3f} | "
            report += f"{len(task_result['generated_files'])} |\n"

        with open(self.results_dir / "SUMMARY_REPORT.md", "w") as f:
            f.write(report)

    def _save_xform_index(self):
        """Save index of all generated xform files"""
        xform_files = list(self.xforms_dir.glob("*.py"))

        index = {"total_files": len(xform_files), "files": []}

        for xform_file in sorted(xform_files):
            file_size = xform_file.stat().st_size
            index["files"].append(
                {
                    "filename": xform_file.name,
                    "size_bytes": file_size,
                    "path": str(xform_file.relative_to(self.results_dir)),
                }
            )

        with open(self.results_dir / "XFORM_FILES_INDEX.json", "w") as f:
            json.dump(index, f, indent=2)


def parse_arguments():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(
        description="Generate & Store Xform Files with Evaluation",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python generate_and_store_evaluation.py
  python generate_and_store_evaluation.py --model ollama:deepseek-coder
  python generate_and_store_evaluation.py --k-values 1 3 5 10
        """,
    )

    parser.add_argument(
        "--model",
        default="ollama:codellama",
        help="Model specification (default: ollama:codellama)",
    )

    parser.add_argument("--endpoint", help="EC2 endpoint URL (required for ec2 model)")

    parser.add_argument(
        "--k-values",
        nargs="+",
        type=int,
        default=[1, 3, 5],
        help="K values for Pass@k evaluation (default: 1 3 5)",
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
    else:
        model_config["type"] = "ollama"
        model_config["name"] = args.model

    return args, model_config


def main():
    """Main entry point"""
    args, model_config = parse_arguments()

    print("🎯 Generate & Store Xform Evaluation")
    print("=" * 50)
    print(f"Model: {model_config['type']}:{model_config['name']}")
    print(f"K Values: {args.k_values}")
    print()
    print("📋 Selected Test Cases (6 tasks):")
    print("  📘 Basic: wire_to_reg, signal_rename")
    print("  📙 Intermediate: add_enable, reset_condition")
    print("  📕 Advanced: fsm_state_rename, add_debug_ports")
    print()
    print("🎯 What this script does:")
    print(f"  • Generates {max(args.k_values)} attempts per task")
    print("  • Saves all generated .py xform files")
    print("  • Evaluates each attempt")
    print("  • Calculates Pass@k scores")
    print("  • Stores everything in organized directories")
    print()
    print(f"⏱️ Estimated time: 10-20 minutes")
    print()

    try:
        response = input("Continue? (y/N): ").strip().lower()
        if response not in ["y", "yes"]:
            print("❌ Cancelled")
            return 1
    except KeyboardInterrupt:
        print("\n❌ Cancelled")
        return 1

    try:
        evaluator = GenerateAndStoreEvaluator(
            k_values=args.k_values, model_config=model_config
        )

        results_dir = evaluator.run_evaluation()

        print("\n" + "=" * 50)
        print("✅ EVALUATION COMPLETE!")
        print(f"📁 Results: {results_dir}")
        print("📄 Key files:")
        print("   - generated_xforms/ (all .py xform files)")
        print("   - evaluations/ (individual task evaluations)")
        print("   - OVERALL_RESULTS.json (complete results)")
        print("   - SUMMARY_REPORT.md (readable summary)")
        print("   - XFORM_FILES_INDEX.json (file index)")

        return 0

    except KeyboardInterrupt:
        print("\n⚠️ Interrupted")
        return 1
    except Exception as e:
        print(f"\n❌ Failed: {e}")
        import traceback

        traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())
