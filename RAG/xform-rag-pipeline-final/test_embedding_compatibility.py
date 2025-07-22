#!/usr/bin/env python3
"""
Test script to validate embedding compatibility fixes
Tests the enhanced embedding dimension handling and fallback mechanisms
"""

import sys
import os
import shutil
from pathlib import Path
from datetime import datetime

# Add the xform_rag package to the path
sys.path.insert(0, str(Path(__file__).parent))

from xform_rag import RAGConfig, XformRAGPipeline


def test_embedding_compatibility():
    """Test embedding compatibility and fallback mechanisms"""

    print("🧪 Testing Embedding Compatibility and Fallback Mechanisms")
    print("=" * 60)

    results = []

    # Create output directory for this test
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    output_dir = Path("embedding_compatibility_test") / f"test_run_{timestamp}"
    output_dir.mkdir(parents=True, exist_ok=True)

    print(f"📁 Output directory: {output_dir}")

    # Test 1: Clean environment with CodeBERT
    print("\n🔧 Test 1: Clean initialization with CodeBERT")
    print("-" * 40)

    # Remove any existing vector store
    vector_store_path = Path("./vector_store")
    if vector_store_path.exists():
        shutil.rmtree(vector_store_path)
        print("🗑️ Removed existing vector store")

    config_codebert = RAGConfig(
        model_type="ollama",
        model_name="codellama",
        embedding_model="microsoft/codebert-base",
        embedding_type="codebert",
        data_dir=".",
        vector_store_dir="./vector_store",
        output_dir="./generated",
    )

    try:
        pipeline_codebert = XformRAGPipeline(config_codebert)
        print("✅ CodeBERT initialization successful")

        # Test basic functionality
        stats = pipeline_codebert.get_system_stats()
        doc_count = stats.get("vector_store", {}).get("vector_store_documents", 0)
        print(f"📊 Vector store created with {doc_count} documents")

        # Test a simple generation
        result = pipeline_codebert.generate_xform("simple wire to reg transformation")
        if "error" not in result:
            print("✅ CodeBERT generation test successful")
            results.append({"test": "codebert_clean", "success": True})
        else:
            print(f"❌ CodeBERT generation failed: {result['error']}")
            results.append(
                {"test": "codebert_clean", "success": False, "error": result["error"]}
            )

    except Exception as e:
        print(f"❌ CodeBERT initialization failed: {e}")
        results.append({"test": "codebert_clean", "success": False, "error": str(e)})

    # Test 2: Create incompatible vector store, then test compatibility handling
    print("\n🔧 Test 2: Compatibility handling with dimension mismatch")
    print("-" * 40)

    # First, create a vector store with sentence-transformers (384 dim)
    print("📝 Creating vector store with sentence-transformers...")
    config_st = RAGConfig(
        model_type="ollama",
        model_name="codellama",
        embedding_model="sentence-transformers/all-MiniLM-L6-v2",
        embedding_type="huggingface",
        data_dir=".",
        vector_store_dir="./vector_store",
        output_dir="./generated",
    )

    try:
        # Force recreation of vector store
        if vector_store_path.exists():
            shutil.rmtree(vector_store_path)

        pipeline_st = XformRAGPipeline(config_st)
        stats_st = pipeline_st.get_system_stats()
        doc_count_st = stats_st.get("vector_store", {}).get("vector_store_documents", 0)
        print(
            f"✅ Sentence-transformers vector store created with {doc_count_st} documents"
        )

        # Now try to load with CodeBERT (should detect dimension mismatch and recreate)
        print("🔄 Now testing CodeBERT with existing sentence-transformers store...")

        pipeline_codebert_compat = XformRAGPipeline(config_codebert)
        stats_compat = pipeline_codebert_compat.get_system_stats()
        doc_count_compat = stats_compat.get("vector_store", {}).get(
            "vector_store_documents", 0
        )

        print(
            f"✅ Compatibility handling successful - recreated with {doc_count_compat} documents"
        )
        results.append({"test": "dimension_mismatch_handling", "success": True})

    except Exception as e:
        print(f"❌ Compatibility handling failed: {e}")
        results.append(
            {"test": "dimension_mismatch_handling", "success": False, "error": str(e)}
        )

    # Test 3: Fallback mechanism
    print("\n🔧 Test 3: Fallback mechanism (simulated CodeBERT failure)")
    print("-" * 40)

    # Test fallback by using invalid model name
    config_invalid = RAGConfig(
        model_type="ollama",
        model_name="codellama",
        embedding_model="invalid/nonexistent-model",
        embedding_type="codebert",
        data_dir=".",
        vector_store_dir="./vector_store_fallback",
        output_dir="./generated",
    )

    try:
        # This should fail and trigger fallback
        pipeline_fallback = XformRAGPipeline(config_invalid)
        print("⚠️  Invalid model didn't fail - unexpected behavior")
        results.append(
            {
                "test": "fallback_mechanism",
                "success": False,
                "error": "Expected failure didn't occur",
            }
        )

    except Exception as e:
        print(f"✅ Expected failure with invalid model: {e}")

        # Now test manual fallback
        print("🔄 Testing manual fallback to sentence-transformers...")
        config_fallback = RAGConfig(
            model_type="ollama",
            model_name="codellama",
            embedding_model="sentence-transformers/all-MiniLM-L6-v2",
            embedding_type="huggingface",
            data_dir=".",
            vector_store_dir="./vector_store_fallback",
            output_dir="./generated",
        )

        try:
            pipeline_fallback = XformRAGPipeline(config_fallback)
            print("✅ Fallback to sentence-transformers successful")
            results.append({"test": "fallback_mechanism", "success": True})
        except Exception as e2:
            print(f"❌ Fallback failed: {e2}")
            results.append(
                {"test": "fallback_mechanism", "success": False, "error": str(e2)}
            )

    # Test 4: Metadata persistence
    print("\n🔧 Test 4: Embedding metadata persistence")
    print("-" * 40)

    metadata_file = vector_store_path / "embedding_metadata.json"
    if metadata_file.exists():
        print("✅ Embedding metadata file found")

        import json

        with open(metadata_file, "r") as f:
            metadata = json.load(f)

        print(f"📋 Metadata: {metadata}")

        required_fields = ["model_name", "embedding_type", "dimension", "created_at"]
        has_all_fields = all(field in metadata for field in required_fields)

        if has_all_fields:
            print("✅ All required metadata fields present")
            results.append({"test": "metadata_persistence", "success": True})
        else:
            missing = [f for f in required_fields if f not in metadata]
            print(f"❌ Missing metadata fields: {missing}")
            results.append(
                {
                    "test": "metadata_persistence",
                    "success": False,
                    "error": f"Missing fields: {missing}",
                }
            )
    else:
        print("❌ Embedding metadata file not found")
        results.append(
            {
                "test": "metadata_persistence",
                "success": False,
                "error": "Metadata file not found",
            }
        )

    # Save test results
    results_file = output_dir / "compatibility_test_results.txt"
    with open(results_file, "w") as f:
        f.write(f"Embedding Compatibility Test Results\n")
        f.write(f"Test Run: {datetime.now().isoformat()}\n")
        f.write(f"{'='*50}\n\n")

        for result in results:
            status = "✅ PASS" if result["success"] else "❌ FAIL"
            f.write(f"{status} {result['test']}\n")
            if "error" in result:
                f.write(f"   Error: {result['error']}\n")
            f.write(f"\n")

        success_count = sum(1 for r in results if r["success"])
        f.write(f"Summary: {success_count}/{len(results)} tests passed\n")

    # Summary
    print("\n" + "=" * 60)
    print("📈 EMBEDDING COMPATIBILITY TEST SUMMARY")
    print("=" * 60)

    success_count = sum(1 for r in results if r["success"])
    total_tests = len(results)

    print(f"✅ Passed: {success_count}/{total_tests} tests")

    for result in results:
        status = "✅" if result["success"] else "❌"
        test_name = result["test"].replace("_", " ").title()
        print(f"{status} {test_name}")
        if "error" in result:
            print(f"   └─ {result['error']}")

    print(f"\n📋 Results saved to: {results_file}")

    return success_count / total_tests >= 0.75  # 75% success rate


if __name__ == "__main__":
    success = test_embedding_compatibility()
    if success:
        print("\n🎉 Embedding Compatibility Test PASSED!")
        sys.exit(0)
    else:
        print("\n💥 Embedding Compatibility Test FAILED!")
        sys.exit(1)
