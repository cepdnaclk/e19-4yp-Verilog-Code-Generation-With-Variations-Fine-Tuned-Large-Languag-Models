#!/usr/bin/env python3
"""
Main entry point for the Xform RAG Pipeline
Provides both CLI and programmatic interfaces
"""

import sys
import logging
from pathlib import Path

# Add the package to the path if running as script
if __name__ == "__main__":
    package_dir = Path(__file__).parent
    if str(package_dir) not in sys.path:
        sys.path.insert(0, str(package_dir))

from xform_rag import CLI, create_pipeline, get_version_info


def main():
    """Main entry point"""
    try:
        # Use the CLI
        cli = CLI()
        return cli.run()
    except KeyboardInterrupt:
        print("\n🛑 Operation cancelled by user")
        return 1
    except ImportError as e:
        print(f"❌ Import error: {e}")
        print("Please ensure all dependencies are installed:")
        print("  pip install langchain chromadb sentence-transformers")
        return 1
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        return 1


def demo_programmatic_usage():
    """Demonstrate programmatic usage of the pipeline"""
    print("🚀 Xform RAG Pipeline - Programmatic Demo")
    print("=" * 50)

    try:
        # Create pipeline with simple configuration
        pipeline = create_pipeline(
            data_dir=".", model_type="ollama", model_name="codellama"
        )

        # Test system
        print("🧪 Testing system...")
        test_results = pipeline.test_system()

        for component, result in test_results.items():
            status = "✅" if result else "❌"
            print(f"  {status} {component}")

        if not all(test_results.values()):
            print("⚠️ Some components failed tests. Check configuration.")
            return

        # List existing transformations
        print("\n📋 Existing transformations:")
        transformations = pipeline.list_transformations()
        for xform in transformations[:5]:  # Show first 5
            print(f"  • {xform}")

        if len(transformations) > 5:
            print(f"  ... and {len(transformations) - 5} more")

        # Generate a simple transformation
        print("\n🔧 Generating new transformation...")
        request = "Add enable signal to module inputs"

        result = pipeline.generate_xform(request)

        if "error" in result:
            print(f"❌ Generation failed: {result['error']}")
            return

        print(f"✅ Generated: {result['filename']}")
        print(f"📏 Code length: {len(result['code'])} characters")

        # Save the result
        if pipeline.save_generated_xform(result):
            print(f"💾 Saved to: {pipeline.config.output_dir / result['filename']}")

        # Show stats
        print("\n📊 System Statistics:")
        stats = pipeline.get_system_stats()
        print(
            f"  Vector store documents: {stats['vector_store'].get('vector_store_documents', 'N/A')}"
        )
        print(f"  Generated files: {stats['generated_files'].get('total_files', 0)}")

        print("\n🎉 Demo completed successfully!")

    except Exception as e:
        print(f"❌ Demo failed: {e}")
        import traceback

        traceback.print_exc()


def show_version():
    """Show version information"""
    print("Xform RAG Pipeline")
    print("=" * 30)

    version_info = get_version_info()
    for key, value in version_info.items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    # Check for special commands
    if len(sys.argv) > 1:
        if sys.argv[1] == "--demo":
            demo_programmatic_usage()
            sys.exit(0)
        elif sys.argv[1] == "--version":
            show_version()
            sys.exit(0)
        elif sys.argv[1] == "--help-dev":
            print(
                """
Xform RAG Pipeline - Developer Help
================================

Available modes:
  python main.py                    # Normal CLI mode
  python main.py --demo            # Run programmatic demo
  python main.py --version         # Show version info
  python main.py --help-dev        # This help

Example usage:
  python main.py generate "Add debug ports to module"
  python main.py list
  python main.py update
  python main.py stats

Programmatic usage:
  from xform_rag import create_pipeline
  pipeline = create_pipeline()
  result = pipeline.generate_xform("your request")
            """
            )
            sys.exit(0)

    # Run normal CLI
    sys.exit(main())
