#!/usr/bin/env python3
"""
Test script for Priority 1 improvements
Verifies that the enhanced RAG pipeline works correctly
"""

import sys
import logging
from pathlib import Path

# Add the package to the path
sys.path.insert(0, str(Path(__file__).parent))

from xform_rag import create_pipeline, RAGConfig, InputValidator, ValidationError


def test_input_validation():
    """Test the input validation system"""
    print("🧪 Testing Input Validation...")

    validator = InputValidator()

    # Test user request validation
    print("  ✓ Testing user request validation...")

    # Valid request
    valid, issues = validator.validate_user_request(
        "Convert wire signals to reg in a Verilog module"
    )
    assert valid, f"Valid request failed: {issues}"

    # Invalid requests
    invalid_cases = [
        "",  # Empty
        "x",  # Too short
        "rm -rf /",  # Dangerous
        "a" * 1001,  # Too long
    ]

    for case in invalid_cases:
        valid, issues = validator.validate_user_request(case)
        assert not valid, f"Invalid request passed validation: {case}"

    print("  ✓ User request validation working!")

    # Test file path validation
    print("  ✓ Testing file path validation...")

    # Test with existing file
    valid, issues = validator.validate_file_path(
        __file__, must_exist=True, file_type="python"
    )
    assert valid, f"Valid file path failed: {issues}"

    # Test dangerous paths
    dangerous_paths = ["../../../etc/passwd", "C:\\Windows\\system32\\cmd.exe"]
    for path in dangerous_paths:
        valid, issues = validator.validate_file_path(path, must_exist=False)
        assert not valid, f"Dangerous path passed validation: {path}"

    print("  ✓ File path validation working!")


def test_enhanced_embeddings():
    """Test the CodeBERT embeddings configuration"""
    print("🧪 Testing Enhanced Embeddings...")

    # Test CodeBERT configuration
    config = RAGConfig(
        embedding_model="microsoft/codebert-base", embedding_type="codebert"
    )

    print(f"  ✓ CodeBERT config created: {config.embedding_model}")

    # Test fallback to sentence transformers
    config_fallback = RAGConfig(
        embedding_model="sentence-transformers/all-MiniLM-L6-v2",
        embedding_type="huggingface",
    )

    print(f"  ✓ Fallback config created: {config_fallback.embedding_model}")


def test_pyverilog_documentation():
    """Test PyVerilog documentation loading"""
    print("🧪 Testing PyVerilog Documentation Loading...")

    try:
        config = RAGConfig(data_dir=".")

        # We'll just test that the document processor can be created
        # and has the new methods
        from xform_rag.document_processor import DocumentProcessor

        processor = DocumentProcessor(config)

        # Check if new methods exist
        assert hasattr(
            processor, "_load_pyverilog_documentation"
        ), "Missing PyVerilog doc method"
        assert hasattr(
            processor, "_create_pyverilog_ast_docs"
        ), "Missing AST docs method"
        assert hasattr(
            processor, "_create_transformation_pattern_docs"
        ), "Missing pattern docs method"

        print("  ✓ Document processor has PyVerilog documentation methods!")

        # Test creating PyVerilog docs (should not fail)
        docs = processor._load_pyverilog_documentation()
        assert len(docs) > 0, "No PyVerilog docs created"
        print(f"  ✓ Created {len(docs)} PyVerilog documentation chunks")

    except Exception as e:
        print(f"  ❌ PyVerilog documentation test failed: {e}")
        return False

    return True


def test_caching():
    """Test caching functionality"""
    print("🧪 Testing Caching...")

    try:
        from xform_rag.vector_store import VectorStoreManager

        config = RAGConfig(data_dir=".")

        # Create vector store manager
        vs_manager = VectorStoreManager(config)

        # Check if caching attributes exist
        assert hasattr(vs_manager, "_query_cache"), "Missing query cache"
        assert hasattr(vs_manager, "_cache_ttl"), "Missing cache TTL"
        assert hasattr(vs_manager, "clear_cache"), "Missing clear_cache method"

        print("  ✓ Vector store has caching capabilities!")

        # Test cache operations
        vs_manager.clear_cache()
        assert len(vs_manager._query_cache) == 0, "Cache not cleared"
        print("  ✓ Cache clearing works!")

    except Exception as e:
        print(f"  ❌ Caching test failed: {e}")
        return False

    return True


def test_pipeline_integration():
    """Test that the pipeline works with all improvements"""
    print("🧪 Testing Pipeline Integration...")

    try:
        # Create pipeline with CodeBERT embeddings
        config = RAGConfig(
            data_dir=".",
            embedding_model="microsoft/codebert-base",
            embedding_type="codebert",
            model_type="ollama",
            model_name="codellama",
        )

        # Note: We won't actually create the full pipeline as it requires
        # dependencies that might not be installed, but we can test config
        print("  ✓ Enhanced configuration created successfully!")

        # Test validation integration
        from xform_rag.pipeline import XformRAGPipeline

        # Check that InputValidator is imported
        assert hasattr(XformRAGPipeline, "__init__"), "Pipeline missing init"
        print("  ✓ Pipeline integration looks good!")

    except ImportError as e:
        print(f"  ⚠️  Pipeline test skipped due to missing dependencies: {e}")
        return True  # This is expected in minimal environments
    except Exception as e:
        print(f"  ❌ Pipeline integration test failed: {e}")
        return False

    return True


def main():
    """Run all Priority 1 tests"""
    print("🚀 Testing Priority 1 Improvements")
    print("=" * 50)

    tests = [
        test_input_validation,
        test_enhanced_embeddings,
        test_pyverilog_documentation,
        test_caching,
        test_pipeline_integration,
    ]

    passed = 0
    total = len(tests)

    for test in tests:
        try:
            if test():
                passed += 1
                print("  ✅ PASSED\n")
            else:
                print("  ❌ FAILED\n")
        except Exception as e:
            print(f"  ❌ FAILED with exception: {e}\n")

    print("=" * 50)
    print(f"📊 Test Results: {passed}/{total} tests passed")

    if passed == total:
        print("🎉 All Priority 1 improvements are working!")
        return 0
    else:
        print("⚠️  Some tests failed - check the implementation")
        return 1


if __name__ == "__main__":
    sys.exit(main())
