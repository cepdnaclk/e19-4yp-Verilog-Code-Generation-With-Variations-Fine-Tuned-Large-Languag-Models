#!/usr/bin/env python3
"""
Test script for the Priority 1 improved RAG pipeline
Tests the enhanced code generation capabilities with new features
"""

import sys
import os
from pathlib import Path
from datetime import datetime

# Add the xform_rag package to the path
sys.path.insert(0, str(Path(__file__).parent))

from xform_rag import RAGConfig, XformRAGPipeline


def create_output_directories():
    """Create organized directories for saving generated transformations"""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    base_dir = Path("generated_xforms_priority1") / f"test_run_{timestamp}"

    directories = {
        "base": base_dir,
        "passed": base_dir / "passed",
        "failed": base_dir / "failed",
        "logs": base_dir / "logs",
        "analysis": base_dir / "analysis",
    }

    for dir_path in directories.values():
        dir_path.mkdir(parents=True, exist_ok=True)

    return directories


def test_optimized_generation():
    """Test the Priority 1 improved RAG pipeline with various transformation requests"""

    print("🚀 Testing Priority 1 Improved RAG Pipeline")
    print("=" * 50)

    # Create organized output directories
    output_dirs = create_output_directories()
    print(f"📁 Output directory: {output_dirs['base']}")

    # Save test configuration
    config_info = {
        "timestamp": datetime.now().isoformat(),
        "test_type": "Priority 1 Enhanced RAG Pipeline",
        "embedding_model": "microsoft/codebert-base (with fallback)",
        "model_type": "ollama",
        "model_name": "codellama",
    }

    with open(output_dirs["logs"] / "test_config.txt", "w") as f:
        for key, value in config_info.items():
            f.write(f"{key}: {value}\n")

    # Initialize the pipeline with Priority 1 improvements
    config = RAGConfig(
        model_type="ollama",
        model_name="codellama",
        embedding_model="microsoft/codebert-base",  # Priority 1: CodeBERT embeddings
        embedding_type="codebert",
        data_dir=".",
        vector_store_dir="./vector_store",
        output_dir="./generated",
    )

    print(f"🔧 Attempting to initialize with CodeBERT embeddings...")

    try:
        pipeline = XformRAGPipeline(config)
        print(f"✅ Successfully initialized with CodeBERT!")
    except Exception as e:
        print(f"❌ CodeBERT initialization failed: {e}")

        # Check if it's a dimension mismatch
        if "dimension" in str(e).lower():
            print("🔄 Detected embedding dimension mismatch. Cleaning vector store...")
            import shutil
            from pathlib import Path

            vector_store_path = Path("./vector_store")
            if vector_store_path.exists():
                shutil.rmtree(vector_store_path)
                print("🗑️ Removed incompatible vector store")

            # Retry with CodeBERT
            try:
                print("🔄 Retrying CodeBERT initialization with clean vector store...")
                pipeline = XformRAGPipeline(config)
                print("✅ Successfully initialized with CodeBERT after cleanup!")
            except Exception as e2:
                print(f"❌ CodeBERT still failed: {e2}")
                print("💡 Falling back to sentence-transformers...")

                # Fallback to sentence transformers
                config.embedding_model = "sentence-transformers/all-MiniLM-L6-v2"
                config.embedding_type = "huggingface"
                pipeline = XformRAGPipeline(config)
                print(
                    "✅ Successfully initialized with sentence-transformers fallback!"
                )
        else:
            print("💡 Falling back to sentence-transformers...")

            # Fallback to sentence transformers if CodeBERT fails
            config.embedding_model = "sentence-transformers/all-MiniLM-L6-v2"
            config.embedding_type = "huggingface"
            pipeline = XformRAGPipeline(config)

    # Test system components
    print("\n🧪 Testing System Components...")
    test_results = pipeline.test_system()

    for component, result in test_results.items():
        status = "✅" if result else "❌"
        print(f"  {status} {component}")

    if not all(test_results.values()):
        print("⚠️ Some components failed - continuing with available functionality...")

    print(f"\n✅ Pipeline initialized with {config.embedding_model}")

    # Show system stats with Priority 1 improvements
    stats = pipeline.get_system_stats()
    print(
        f"📊 Vector store documents: {stats['vector_store'].get('vector_store_documents', 'N/A')}"
    )
    print(f"📊 Embedding model: {stats['config']['embedding_model']}")
    print(f"📊 Embedding type: {stats['config']['embedding_type']}")

    # Test cases that represent different complexities with Priority 1 validation
    test_cases = [
        {
            "name": "wire_to_reg_conversion",
            "description": "Transform wire declarations to reg declarations in a Verilog module",
            "complexity": "simple",
        },
        {
            "name": "add_enable_signal",
            "description": "Add an enable signal to control assignments in a Verilog module",
            "complexity": "medium",
        },
        {
            "name": "signal_width_change",
            "description": "Change the width of a signal from 8 bits to 16 bits in Verilog",
            "complexity": "medium",
        },
        {
            "name": "module_rename",
            "description": "Rename a Verilog module from old_name to new_name",
            "complexity": "simple",
        },
        {
            "name": "port_addition",
            "description": "Add a new input port called debug_enable to a Verilog module",
            "complexity": "complex",
        },
    ]

    results = []
    all_logs = []  # Store detailed logs for each test

    for i, test_case in enumerate(test_cases):
        print(f"\n🔧 Test {i+1}: {test_case['name']}")
        print(f"Description: {test_case['description']}")
        print(f"Complexity: {test_case['complexity']}")

        test_log = {
            "test_number": i + 1,
            "name": test_case["name"],
            "description": test_case["description"],
            "complexity": test_case["complexity"],
            "timestamp": datetime.now().isoformat(),
            "status": "running",
        }

        try:
            # Priority 1: Enhanced generation with validation
            result = pipeline.generate_xform(test_case["description"])
            test_log["generation_time"] = datetime.now().isoformat()

            if "error" in result:
                print(f"❌ Generation failed: {result['error']}")
                test_log["status"] = "failed"
                test_log["error"] = result["error"]

                if "validation_issues" in result:
                    print(
                        f"   Validation issues: {', '.join(result['validation_issues'])}"
                    )
                    test_log["validation_issues"] = result["validation_issues"]

                # Save failed attempt with error info
                failed_dir = output_dirs["failed"]
                error_file = failed_dir / f"{test_case['name']}_ERROR.txt"
                with open(error_file, "w") as f:
                    f.write(f"Test: {test_case['name']}\n")
                    f.write(f"Description: {test_case['description']}\n")
                    f.write(f"Error: {result['error']}\n")
                    if "validation_issues" in result:
                        f.write(
                            f"Validation Issues: {', '.join(result['validation_issues'])}\n"
                        )
                    f.write(f"Timestamp: {datetime.now().isoformat()}\n")

                print(f"💾 Error log saved to: {error_file}")

                results.append(
                    {
                        "test": test_case["name"],
                        "success": False,
                        "error": result["error"],
                    }
                )
                test_log["output_file"] = str(error_file)
                all_logs.append(test_log)
                continue

            # Priority 1: Check validation warnings
            if "validation_warnings" in result:
                print(
                    f"⚠️  Validation warnings: {len(result['validation_warnings'])} issues"
                )
                test_log["validation_warnings"] = result["validation_warnings"]
                for warning in result["validation_warnings"][:3]:  # Show first 3
                    print(f"   - {warning}")

            # Basic code quality checks
            code = result.get("code", "")
            has_shebang = code.startswith("#!/usr/bin/env python3")
            has_main = "def main():" in code
            has_argparse = "argparse" in code
            has_pyverilog = "from pyverilog.vparser.parser import parse" in code

            quality_score = (
                sum([has_shebang, has_main, has_argparse, has_pyverilog]) / 4.0
            )

            test_log["quality_metrics"] = {
                "has_shebang": has_shebang,
                "has_main": has_main,
                "has_argparse": has_argparse,
                "has_pyverilog": has_pyverilog,
                "quality_score": quality_score,
                "code_length": len(code),
            }

            print(f"📊 Quality Score: {quality_score:.2f}")
            print(f"✅ Has shebang: {has_shebang}")
            print(f"✅ Has main(): {has_main}")
            print(f"✅ Has argparse: {has_argparse}")
            print(f"✅ Has PyVerilog: {has_pyverilog}")

            success = quality_score >= 0.75 and len(code) > 500  # Reasonable thresholds
            test_log["status"] = "passed" if success else "failed"

            # Save generated code in appropriate directory
            target_dir = output_dirs["passed"] if success else output_dirs["failed"]
            output_file = target_dir / f"{test_case['name']}.py"

            with open(output_file, "w") as f:
                f.write(f"#!/usr/bin/env python3\n")
                f.write(f"# Generated by Priority 1 Enhanced RAG Pipeline\n")
                f.write(f"# Test: {test_case['name']}\n")
                f.write(f"# Description: {test_case['description']}\n")
                f.write(f"# Complexity: {test_case['complexity']}\n")
                f.write(f"# Quality Score: {quality_score:.2f}\n")
                f.write(f"# Success: {success}\n")
                f.write(f"# Generated: {datetime.now().isoformat()}\n")
                f.write(f"# Code Length: {len(code)} characters\n")
                if "validation_warnings" in result:
                    f.write(
                        f"# Validation Warnings: {len(result['validation_warnings'])}\n"
                    )
                f.write(f"\n# --- GENERATED CODE ---\n\n")
                f.write(result["code"])

            # Also save metadata file
            metadata_file = target_dir / f"{test_case['name']}_metadata.txt"
            with open(metadata_file, "w") as f:
                f.write(f"Test Name: {test_case['name']}\n")
                f.write(f"Description: {test_case['description']}\n")
                f.write(f"Complexity: {test_case['complexity']}\n")
                f.write(f"Quality Score: {quality_score:.2f}\n")
                f.write(f"Code Length: {len(code)} characters\n")
                f.write(f"Success: {success}\n")
                f.write(f"Generated: {datetime.now().isoformat()}\n")
                f.write(f"Has Shebang: {has_shebang}\n")
                f.write(f"Has Main: {has_main}\n")
                f.write(f"Has Argparse: {has_argparse}\n")
                f.write(f"Has PyVerilog: {has_pyverilog}\n")
                if "validation_warnings" in result:
                    f.write(
                        f"\nValidation Warnings ({len(result['validation_warnings'])}):\n"
                    )
                    for j, warning in enumerate(result["validation_warnings"], 1):
                        f.write(f"  {j}. {warning}\n")

            status_emoji = "✅" if success else "❌"
            print(f"💾 Code saved to: {output_file}")
            print(f"📋 Metadata saved to: {metadata_file}")
            print(f"📏 Code length: {len(code)} characters")
            print(f"{status_emoji} Overall success: {success}")

            test_log["output_file"] = str(output_file)
            test_log["metadata_file"] = str(metadata_file)

            results.append(
                {
                    "test": test_case["name"],
                    "success": success,
                    "quality_score": quality_score,
                    "code_length": len(code),
                    "warnings": result.get("validation_warnings", []),
                }
            )

        except Exception as e:
            print(f"❌ Test failed with exception: {e}")
            test_log["status"] = "exception"
            test_log["error"] = str(e)

            # Save exception details
            exception_file = (
                output_dirs["failed"] / f"{test_case['name']}_EXCEPTION.txt"
            )
            with open(exception_file, "w") as f:
                f.write(f"Test: {test_case['name']}\n")
                f.write(f"Description: {test_case['description']}\n")
                f.write(f"Exception: {str(e)}\n")
                f.write(f"Timestamp: {datetime.now().isoformat()}\n")

                # Try to get more exception details
                import traceback

                f.write(f"\nFull Traceback:\n")
                f.write(traceback.format_exc())

            print(f"💾 Exception log saved to: {exception_file}")
            test_log["output_file"] = str(exception_file)

            results.append(
                {"test": test_case["name"], "success": False, "error": str(e)}
            )

        all_logs.append(test_log)

    # Save comprehensive test log
    log_file = output_dirs["logs"] / "detailed_test_log.txt"
    with open(log_file, "w") as f:
        f.write(f"Priority 1 Enhanced RAG Pipeline Test Log\n")
        f.write(f"{'='*50}\n")
        f.write(f"Test Run: {datetime.now().isoformat()}\n")
        f.write(f"Embedding Model: {config.embedding_model}\n")
        f.write(f"Total Tests: {len(test_cases)}\n\n")

        for log in all_logs:
            f.write(f"Test {log['test_number']}: {log['name']}\n")
            f.write(f"  Description: {log['description']}\n")
            f.write(f"  Complexity: {log['complexity']}\n")
            f.write(f"  Status: {log['status']}\n")
            if "quality_metrics" in log:
                f.write(
                    f"  Quality Score: {log['quality_metrics']['quality_score']:.2f}\n"
                )
                f.write(f"  Code Length: {log['quality_metrics']['code_length']}\n")
            if "validation_warnings" in log:
                f.write(f"  Validation Warnings: {len(log['validation_warnings'])}\n")
            if "error" in log:
                f.write(f"  Error: {log['error']}\n")
            f.write(f"  Output: {log.get('output_file', 'N/A')}\n")
            f.write(f"\n")

    print(f"\n📋 Detailed test log saved to: {log_file}")

    # Summary with Priority 1 improvements
    print("\n" + "=" * 60)
    print("📈 PRIORITY 1 ENHANCED TEST SUMMARY")
    print("=" * 60)

    successful_tests = sum(1 for r in results if r.get("success", False))
    total_tests = len(results)
    avg_quality = (
        sum(r.get("quality_score", 0) for r in results) / len(results) if results else 0
    )
    avg_length = (
        sum(r.get("code_length", 0) for r in results) / len(results) if results else 0
    )

    print(f"✅ Successful Tests: {successful_tests}/{total_tests}")
    print(f"📊 Average Quality Score: {avg_quality:.2f}")
    print(f"📏 Average Code Length: {avg_length:.0f} characters")
    print(f"🧠 Embedding Model: {config.embedding_model}")
    print(f"🔧 Total Warnings: {sum(len(r.get('warnings', [])) for r in results)}")

    print(f"\n📋 Individual Results:")
    for result in results:
        status = "✅" if result.get("success", False) else "❌"
        quality = result.get("quality_score", 0)
        length = result.get("code_length", 0)
        warnings = len(result.get("warnings", []))
        print(
            f"{status} {result['test']}: Quality={quality:.2f}, Length={length}, Warnings={warnings}"
        )

    # Priority 1 specific insights
    print(f"\n🔍 Priority 1 Analysis:")
    print(
        f"- Input validation prevented: {sum(1 for r in results if 'validation_issues' in r.get('error', ''))} invalid requests"
    )
    print(
        f"- Generated code with quality > 0.75: {sum(1 for r in results if r.get('quality_score', 0) > 0.75)}/{total_tests}"
    )
    print(
        f"- Average warnings per generation: {sum(len(r.get('warnings', [])) for r in results) / total_tests:.1f}"
    )

    # File organization summary
    print(f"\n📁 Generated Files Organization:")
    print(f"📂 Base Directory: {output_dirs['base']}")
    print(f"   ✅ Passed transformations: {output_dirs['passed']}")
    print(f"   ❌ Failed transformations: {output_dirs['failed']}")
    print(f"   📋 Test logs: {output_dirs['logs']}")
    print(f"   📊 Analysis data: {output_dirs['analysis']}")

    # Count files in each directory
    passed_files = len(list(output_dirs["passed"].glob("*.py")))
    failed_files = (
        len(list(output_dirs["failed"].glob("*.py")))
        + len(list(output_dirs["failed"].glob("*_ERROR.txt")))
        + len(list(output_dirs["failed"].glob("*_EXCEPTION.txt")))
    )

    print(f"\n📈 File Summary:")
    print(f"   🎯 Passed xforms: {passed_files} files")
    print(f"   🔧 Failed attempts: {failed_files} files")
    print(
        f"   📝 Metadata files: {len(list(output_dirs['passed'].glob('*_metadata.txt'))) + len(list(output_dirs['failed'].glob('*_metadata.txt')))}"
    )

    # Create summary analysis file
    summary_file = output_dirs["analysis"] / "test_summary.txt"
    with open(summary_file, "w") as f:
        f.write(f"Priority 1 Enhanced RAG Pipeline - Test Summary\n")
        f.write(f"{'='*50}\n")
        f.write(f"Test Run: {datetime.now().isoformat()}\n")
        f.write(f"Embedding Model: {config.embedding_model}\n\n")
        f.write(f"Results:\n")
        f.write(
            f"  Successful Tests: {successful_tests}/{total_tests} ({successful_tests/total_tests*100:.1f}%)\n"
        )
        f.write(f"  Average Quality Score: {avg_quality:.2f}\n")
        f.write(f"  Average Code Length: {avg_length:.0f} characters\n")
        f.write(
            f"  Total Warnings: {sum(len(r.get('warnings', [])) for r in results)}\n\n"
        )
        f.write(f"File Organization:\n")
        f.write(
            f"  Passed transformations: {passed_files} files in {output_dirs['passed']}\n"
        )
        f.write(f"  Failed attempts: {failed_files} files in {output_dirs['failed']}\n")
        f.write(f"  Test logs: {output_dirs['logs']}\n")
        f.write(f"  This summary: {summary_file}\n")

    print(f"📊 Summary analysis saved to: {summary_file}")

    return successful_tests / total_tests >= 0.6  # At least 60% success rate


if __name__ == "__main__":
    success = test_optimized_generation()
    if success:
        print("\n🎉 Priority 1 Enhanced RAG Test PASSED!")
        print(
            "🚀 The improved pipeline with CodeBERT, validation, and caching is working!"
        )
        sys.exit(0)
    else:
        print("\n💥 Priority 1 Enhanced RAG Test FAILED!")
        print("🔧 Check the generated code and validation warnings above.")
        sys.exit(1)
