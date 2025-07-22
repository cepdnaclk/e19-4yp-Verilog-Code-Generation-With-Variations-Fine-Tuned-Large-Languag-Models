#!/usr/bin/env python3
"""
Command Line Interface for the Xform RAG Pipeline
"""

import argparse
import sys
import json
from pathlib import Path

from .config import RAGConfig
from .pipeline import XformRAGPipeline


class CLI:
    """Command line interface for the RAG pipeline"""

    def __init__(self):
        self.parser = self._create_parser()

    def _create_parser(self) -> argparse.ArgumentParser:
        """Create the argument parser"""
        parser = argparse.ArgumentParser(
            description="Xform RAG Pipeline - Generate Verilog transformations using AI",
            formatter_class=argparse.RawDescriptionHelpFormatter,
            epilog="""
Examples:
  %(prog)s generate "Add debug output ports to a module"
  %(prog)s list
  %(prog)s update
  %(prog)s stats
  %(prog)s --model-type ollama --model-name codellama generate "Convert register to wire"
            """,
        )

        # Global options
        parser.add_argument(
            "--data-dir",
            default=".",
            help="Directory containing xform files (default: current directory)",
        )
        parser.add_argument(
            "--vector-store-dir",
            default="./vector_store",
            help="Vector store directory (default: ./vector_store)",
        )
        parser.add_argument(
            "--output-dir",
            default="./generated",
            help="Output directory for generated xforms (default: ./generated)",
        )
        parser.add_argument(
            "--model-type",
            choices=["ollama", "ec2"],
            default="ollama",
            help="Model type (default: ollama)",
        )
        parser.add_argument(
            "--model-name", default="codellama", help="Model name (default: codellama)"
        )
        parser.add_argument(
            "--ec2-endpoint", help="EC2 endpoint URL (required for ec2 model type)"
        )
        parser.add_argument("--config-file", help="Load configuration from JSON file")
        parser.add_argument(
            "--verbose", "-v", action="store_true", help="Enable verbose logging"
        )

        # Subcommands
        subparsers = parser.add_subparsers(dest="command", help="Available commands")

        # Generate command
        gen_parser = subparsers.add_parser(
            "generate", help="Generate new xform transformation"
        )
        gen_parser.add_argument(
            "request", help="Description of the transformation needed"
        )
        gen_parser.add_argument(
            "--validate", action="store_true", help="Validate generated code"
        )
        gen_parser.add_argument(
            "--dry-run", action="store_true", help="Generate but don't save the file"
        )

        # Update command
        update_parser = subparsers.add_parser(
            "update", help="Update vector store with new documents"
        )
        update_parser.add_argument(
            "--force",
            action="store_true",
            help="Force update even if vector store exists",
        )

        # List command
        list_parser = subparsers.add_parser("list", help="List known transformations")
        list_parser.add_argument(
            "--format",
            choices=["simple", "detailed", "json"],
            default="simple",
            help="Output format",
        )

        # Stats command
        stats_parser = subparsers.add_parser("stats", help="Show system statistics")
        stats_parser.add_argument(
            "--format", choices=["text", "json"], default="text", help="Output format"
        )

        # Validate command
        validate_parser = subparsers.add_parser(
            "validate", help="Validate generated files"
        )
        validate_parser.add_argument(
            "filename", nargs="?", help="Specific file to validate (optional)"
        )

        # Test command
        test_parser = subparsers.add_parser("test", help="Test system connectivity")

        # Cleanup command
        cleanup_parser = subparsers.add_parser("cleanup", help="Clean up old files")
        cleanup_parser.add_argument(
            "--days",
            type=int,
            default=30,
            help="Remove files older than N days (default: 30)",
        )
        cleanup_parser.add_argument(
            "--dry-run",
            action="store_true",
            help="Show what would be removed without actually removing",
        )

        # ========== EVALUATION COMMANDS ==========

        # Evaluate command
        eval_parser = subparsers.add_parser(
            "evaluate", help="Evaluate generated transformations"
        )
        eval_parser.add_argument(
            "request", nargs="?", help="Generate and evaluate a single transformation"
        )
        eval_parser.add_argument(
            "--batch",
            action="store_true",
            help="Evaluate all files in generated directory",
        )
        eval_parser.add_argument(
            "--test-suite",
            choices=["basic", "comprehensive"],
            help="Run comprehensive evaluation with test suite",
        )
        eval_parser.add_argument(
            "--pass-at-k",
            nargs="+",
            type=int,
            help="Run Pass@k evaluation with specified k values",
        )
        eval_parser.add_argument("--eval-name", help="Name for this evaluation")

        # Evaluation history command
        eval_history_parser = subparsers.add_parser(
            "eval-history", help="Show evaluation history and statistics"
        )
        eval_history_parser.add_argument(
            "--limit", type=int, default=10, help="Number of recent evaluations to show"
        )
        eval_history_parser.add_argument(
            "--format", choices=["table", "json"], default="table", help="Output format"
        )

        return parser

    def run(self, args=None):
        """Run the CLI with given arguments"""
        parsed_args = self.parser.parse_args(args)

        try:
            # Load configuration
            config = self._load_config(parsed_args)

            # Setup logging
            self._setup_logging(parsed_args.verbose)

            # Execute command
            return self._execute_command(config, parsed_args)

        except KeyboardInterrupt:
            print("\n🛑 Operation cancelled by user")
            return 1
        except Exception as e:
            print(f"❌ Error: {e}")
            if parsed_args.verbose:
                import traceback

                traceback.print_exc()
            return 1

    def _load_config(self, args) -> RAGConfig:
        """Load configuration from arguments and config file"""
        config_dict = {}

        # Load from config file if specified
        if args.config_file:
            config_path = Path(args.config_file)
            if not config_path.exists():
                raise FileNotFoundError(f"Config file not found: {args.config_file}")

            with open(config_path) as f:
                config_dict = json.load(f)

        # Override with command line arguments
        arg_dict = {
            "data_dir": args.data_dir,
            "vector_store_dir": args.vector_store_dir,
            "output_dir": args.output_dir,
            "model_type": args.model_type,
            "model_name": args.model_name,
        }

        if args.ec2_endpoint:
            arg_dict["ec2_endpoint"] = args.ec2_endpoint

        # Merge configurations (command line takes precedence)
        config_dict.update(arg_dict)

        config = RAGConfig.from_dict(config_dict)
        config.validate()

        return config

    def _setup_logging(self, verbose: bool):
        """Setup logging configuration"""
        import logging

        level = logging.DEBUG if verbose else logging.INFO
        format_str = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"

        logging.basicConfig(level=level, format=format_str)

        # Suppress some noisy loggers
        logging.getLogger("urllib3").setLevel(logging.WARNING)
        logging.getLogger("chromadb").setLevel(logging.WARNING)

    def _execute_command(self, config: RAGConfig, args) -> int:
        """Execute the specified command"""
        if not args.command:
            self.parser.print_help()
            return 1

        # Initialize pipeline
        pipeline = XformRAGPipeline(config)

        # Route to appropriate handler
        handlers = {
            "generate": self._handle_generate,
            "update": self._handle_update,
            "list": self._handle_list,
            "stats": self._handle_stats,
            "validate": self._handle_validate,
            "test": self._handle_test,
            "cleanup": self._handle_cleanup,
            "evaluate": self._handle_evaluate,
            "eval-history": self._handle_eval_history,
        }

        handler = handlers.get(args.command)
        if handler:
            return handler(pipeline, args)
        else:
            print(f"❌ Unknown command: {args.command}")
            return 1

    def _handle_generate(self, pipeline: XformRAGPipeline, args) -> int:
        """Handle generate command"""
        print(f"🚀 Generating transformation for: {args.request}")

        result = pipeline.generate_xform(args.request)

        if "error" in result:
            print(f"❌ Generation failed: {result['error']}")
            return 1

        # Validate if requested
        if args.validate:
            validation = pipeline.code_generator.validate_generated_code(result["code"])
            if not validation["is_valid"]:
                print(f"⚠️ Generated code has issues:")
                for error in validation["syntax_errors"]:
                    print(f"  - {error}")
                for warning in validation["warnings"]:
                    print(f"  - Warning: {warning}")

        # Save unless dry run
        if not args.dry_run:
            if pipeline.file_manager.save_generated_xform(result):
                print(f"✅ Successfully generated: {result['filename']}")
                if result.get("registry_entry"):
                    print(f"📝 Registry entry:\n{result['registry_entry']}")
            else:
                print("❌ Failed to save generated xform")
                return 1
        else:
            print(f"🔍 Dry run - would generate: {result['filename']}")
            print(f"📊 Code length: {len(result['code'])} characters")

        return 0

    def _handle_update(self, pipeline: XformRAGPipeline, args) -> int:
        """Handle update command"""
        print("🔄 Updating vector store...")

        if pipeline.vector_store_manager.update_vector_store():
            print("✅ Vector store updated successfully!")
            return 0
        else:
            print("❌ Vector store update failed!")
            return 1

    def _handle_list(self, pipeline: XformRAGPipeline, args) -> int:
        """Handle list command"""
        transformations = pipeline.vector_store_manager.list_transformations()

        if args.format == "json":
            print(json.dumps(transformations, indent=2))
        elif args.format == "detailed":
            print(f"📋 Found {len(transformations)} transformations:")
            for xform in transformations:
                print(f"  • {xform}")
        else:  # simple
            print("Known transformations:")
            for xform in transformations:
                print(f"  {xform}")

        return 0

    def _handle_stats(self, pipeline: XformRAGPipeline, args) -> int:
        """Handle stats command"""
        vs_stats = pipeline.vector_store_manager.get_stats()
        file_stats = pipeline.file_manager.get_generation_stats()

        stats = {"vector_store": vs_stats, "generated_files": file_stats}

        if args.format == "json":
            print(json.dumps(stats, indent=2))
        else:
            print("📊 System Statistics")
            print("=" * 50)
            print(
                f"Vector Store Documents: {vs_stats.get('vector_store_documents', 'N/A')}"
            )
            print(f"Source Files: {vs_stats.get('xform_files', 'N/A')}")
            print(f"Generated Files: {file_stats.get('total_files', 0)}")
            print(
                f"Total Generated Size: {file_stats.get('total_size_bytes', 0)} bytes"
            )

        return 0

    def _handle_validate(self, pipeline: XformRAGPipeline, args) -> int:
        """Handle validate command"""
        if args.filename:
            # Validate specific file
            result = pipeline.file_manager.validate_generated_file(args.filename)
            if "error" in result:
                print(f"❌ {result['error']}")
                return 1

            print(f"📁 File: {result['filename']}")
            print(f"✅ Exists: {result['exists']}")
            print(f"📏 Size: {result['size']} bytes")
            print(f"🔧 Executable: {result['is_executable']}")
            print(f"✅ Valid Syntax: {result['syntax_valid']}")

            if not result["syntax_valid"] and "syntax_error" in result:
                print(f"❌ Syntax Error: {result['syntax_error']}")
        else:
            # Validate all files
            files = pipeline.file_manager.list_generated_files()
            valid_count = 0

            for file_info in files:
                result = pipeline.file_manager.validate_generated_file(
                    file_info["filename"]
                )
                if result.get("syntax_valid", False):
                    valid_count += 1
                    print(f"✅ {file_info['filename']}")
                else:
                    print(f"❌ {file_info['filename']}")

            print(f"\n📊 {valid_count}/{len(files)} files are valid")

        return 0

    def _handle_test(self, pipeline: XformRAGPipeline, args) -> int:
        """Handle test command"""
        print("🧪 Testing system connectivity...")

        if pipeline.code_generator.test_connection():
            print("✅ All systems operational!")
            return 0
        else:
            print("❌ System test failed!")
            return 1

    def _handle_cleanup(self, pipeline: XformRAGPipeline, args) -> int:
        """Handle cleanup command"""
        if args.dry_run:
            print(f"🔍 Dry run - would remove files older than {args.days} days")
            # TODO: Implement dry run logic
            return 0

        removed = pipeline.file_manager.cleanup_old_files(args.days)
        print(f"🧹 Removed {removed} old files")
        return 0

    def _handle_evaluate(self, pipeline: "XformRAGPipeline", args) -> int:
        """Handle evaluate command"""

        # Single request evaluation
        if args.request:
            print(f"🔍 Generating and evaluating: {args.request}")

            result = pipeline.generate_and_evaluate_xform(args.request)

            if "error" in result["generation"]:
                print(f"❌ Generation failed: {result['generation']['error']}")
                return 1

            evaluation = result["evaluation"]
            status = "✅ PASS" if evaluation["passed"] else "❌ FAIL"

            print(f"{status} Overall Score: {evaluation['overall_score']:.3f}")
            print(f"📄 Generated: {result['generation']['filename']}")

            if evaluation["errors"]:
                print(f"❌ Errors: {len(evaluation['errors'])}")
                for error in evaluation["errors"][:3]:  # Show first 3
                    print(f"   • {error}")

            if evaluation["warnings"]:
                print(f"⚠️ Warnings: {len(evaluation['warnings'])}")
                for warning in evaluation["warnings"][:3]:  # Show first 3
                    print(f"   • {warning}")

            return 0

        # Test suite evaluation
        elif args.test_suite:
            print(f"🧪 Running {args.test_suite} test suite evaluation")

            result = pipeline.run_comprehensive_evaluation(
                test_suite=args.test_suite, prompt_strategies=["rich"]
            )

            print(f"✅ Evaluation complete!")
            print(
                f"📊 Success Rate: {result['success_rate']:.2%} ({result['successful_tasks']}/{result['total_tasks']})"
            )
            print(
                f"📈 Average Score: {result['metric_averages'].get('overall', 0.0):.3f}"
            )
            print(f"📁 Results: {result['results_file']}")
            print(f"📝 Report: {result['report_file']}")

            # Show complexity breakdown
            if result.get("complexity_breakdown"):
                print(f"\n📋 Complexity Breakdown:")
                for complexity, stats in result["complexity_breakdown"].items():
                    print(
                        f"   {complexity}: {stats['success_rate']:.2%} ({stats['successful_tasks']}/{stats['total_tasks']})"
                    )

            return 0

        # Pass@k evaluation
        elif args.pass_at_k:
            if not args.request:
                print("❌ Pass@k evaluation requires a request")
                return 1

            print(f"🎯 Running Pass@{max(args.pass_at_k)} evaluation: {args.request}")

            result = pipeline.evaluate_pass_at_k(
                user_request=args.request, k_values=args.pass_at_k
            )

            print(f"🎯 Pass@k Results:")
            for k in args.pass_at_k:
                score = result["pass_at_k_scores"][k]
                print(f"   Pass@{k}: {score:.2%}")

            print(f"📊 Best Score: {result['best_score']:.3f}")
            print(f"📊 Average Score: {result['average_score']:.3f}")
            print(f"✅ Successful Attempts: {result['successful_attempts']}")

            return 0

        # Batch evaluation of existing generations
        elif args.batch:
            print("🔍 Evaluating all generated files...")

            files = pipeline.file_manager.list_generated_files()
            if not files:
                print("❌ No generated files found to evaluate")
                return 1

            # Create batch from existing files
            generations = []
            for file_info in files:
                file_path = pipeline.config.output_dir / file_info["filename"]
                try:
                    with open(file_path, "r") as f:
                        code = f.read()

                    # Try to get user request from metadata
                    user_request = "Unknown request"
                    if file_info.get("has_metadata"):
                        metadata = file_info.get("metadata", {})
                        user_request = metadata.get("user_request", user_request)

                    generations.append(
                        {
                            "user_request": user_request,
                            "code": code,
                            "filename": file_info["filename"],
                            "metadata": file_info.get("metadata", {}),
                        }
                    )

                except Exception as e:
                    print(f"⚠️ Could not read {file_info['filename']}: {e}")

            if not generations:
                print("❌ No readable generated files found")
                return 1

            result = pipeline.evaluation_manager.evaluate_batch_generations(
                generations, args.eval_name
            )

            print(f"✅ Batch evaluation complete!")
            print(
                f"📊 Success Rate: {result['success_rate']:.2%} ({result['successful_tasks']}/{result['total_tasks']})"
            )
            print(f"📁 Results: {result['results_file']}")
            print(f"📝 Report: {result['report_file']}")

            return 0

        else:
            print("❌ Please specify --request, --test-suite, --pass-at-k, or --batch")
            return 1

    def _handle_eval_history(self, pipeline: "XformRAGPipeline", args) -> int:
        """Handle eval-history command"""
        summary = pipeline.get_evaluation_summary()

        if "message" in summary:
            print(f"ℹ️ {summary['message']}")
            return 0

        if args.format == "json":
            print(json.dumps(summary, indent=2))
            return 0

        # Table format
        print("📊 Evaluation History Summary")
        print("=" * 50)
        print(f"Total Evaluations: {summary['total_evaluations']}")
        print(f"Average Success Rate: {summary['average_success_rate']:.2%}")
        print(f"Average Score: {summary['average_score']:.3f}")
        print(f"Evaluation Directory: {summary['evaluation_directory']}")

        print(f"\n📋 Recent Evaluations:")
        print(f"{'Name':<30} {'Date':<20} {'Success Rate':<15} {'Avg Score':<10}")
        print("-" * 75)

        for eval_info in summary["recent_evaluations"]:
            name = eval_info["evaluation_name"][:28]
            timestamp = eval_info["timestamp"][:18]
            success_rate = f"{eval_info['success_rate']:.1%}"
            avg_score = f"{eval_info['average_score']:.3f}"

            print(f"{name:<30} {timestamp:<20} {success_rate:<15} {avg_score:<10}")

        return 0


def main():
    """Main entry point for CLI"""
    cli = CLI()
    return cli.run()


if __name__ == "__main__":
    sys.exit(main())
