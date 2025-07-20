#!/usr/bin/env python3
"""
Setup verification script for the optimized RAG pipeline
Checks if all components are properly configured before testing
"""

import sys
import os
from pathlib import Path


def check_environment():
    """Check if the environment is properly set up"""
    print("🔍 Checking RAG Pipeline Environment")
    print("=" * 40)

    checks_passed = 0
    total_checks = 6

    # 1. Check if xform_rag package exists
    xform_rag_path = Path(__file__).parent / "xform_rag"
    if xform_rag_path.exists():
        print("✅ xform_rag package found")
        checks_passed += 1
    else:
        print("❌ xform_rag package not found")

    # 2. Check if vector store exists
    vector_store_path = Path(__file__).parent / "vector_store"
    if vector_store_path.exists():
        print("✅ Vector store directory found")
        checks_passed += 1
    else:
        print("❌ Vector store directory not found")

    # 3. Check for actual xform files (examples)
    xform_files = list(Path(__file__).parent.glob("xform_*.py"))
    if len(xform_files) >= 5:
        print(f"✅ Found {len(xform_files)} example xform files")
        checks_passed += 1
    else:
        print(f"⚠️  Only found {len(xform_files)} example xform files (recommended: 5+)")

    # 4. Try importing the package
    try:
        sys.path.insert(0, str(Path(__file__).parent / "xform_rag"))
        from xform_rag import RAGConfig, XformRAGPipeline

        print("✅ xform_rag package imports successfully")
        checks_passed += 1
    except ImportError as e:
        print(f"❌ Failed to import xform_rag: {e}")

    # 5. Check if Ollama can be reached (basic check)
    try:
        import requests

        # Just check if we can create config without errors
        config = RAGConfig.from_dict(
            {"model_type": "ollama", "model_name": "codellama"}
        )
        print("✅ RAG configuration created successfully")
        checks_passed += 1
    except Exception as e:
        print(f"❌ Failed to create RAG configuration: {e}")

    # 6. Check if we can initialize pipeline (without model connection)
    try:
        pipeline = XformRAGPipeline(config)
        print("✅ RAG pipeline initialized successfully")
        checks_passed += 1
    except Exception as e:
        print(f"❌ Failed to initialize RAG pipeline: {e}")

    print("\n" + "=" * 40)
    print(f"📊 Environment Check: {checks_passed}/{total_checks} passed")

    if checks_passed >= 4:
        print("🎉 Environment looks good! Ready to test.")
        return True
    else:
        print("⚠️  Some issues found. Please fix before testing.")
        return False


def show_test_commands():
    """Show the commands to run tests"""
    print("\n🚀 Ready to Test!")
    print("=" * 40)
    print("Run the following command to test the optimized pipeline:")
    print()
    print("  python test_optimized_rag.py")
    print()
    print("Expected behavior:")
    print("- Will test 3 different transformation types")
    print("- Each should achieve >60% completeness score")
    print("- Generated files will be saved to test_outputs/")
    print()
    print("If you want to compare with original pipeline:")
    print("  python compare_old_vs_new.py")


if __name__ == "__main__":
    if check_environment():
        show_test_commands()
        sys.exit(0)
    else:
        print("\n💡 Suggestions:")
        print("- Ensure you're in the correct directory")
        print("- Make sure Ollama is running")
        print("- Check that the vector store is built")
        sys.exit(1)
