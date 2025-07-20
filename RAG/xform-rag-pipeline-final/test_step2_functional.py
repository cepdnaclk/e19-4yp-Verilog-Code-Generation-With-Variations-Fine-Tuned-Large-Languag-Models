#!/usr/bin/env python3
"""
Test Step 2: Functional Validation
This script tests whether generated transformations actually work with real Verilog code
"""

import sys
import os

sys.path.append(os.path.dirname(__file__))

from xform_rag import RAGConfig, XformRAGPipeline
import tempfile
import json


def test_step2_functional_validation():
    """Test Step 2: Enhanced functional validation"""

    print("🧪 Testing Step 2: Functional Validation")
    print("=" * 60)

    # Configure for testing
    config = RAGConfig(
        embedding_model="microsoft/codebert-base",
        model_type="ollama",
        model_name="codellama",
        vector_store_dir="vector_store",
    )

    try:
        # Initialize pipeline
        print("🔧 Initializing pipeline with CodeBERT...")
        pipeline = XformRAGPipeline(config)
        print("✅ Pipeline initialized successfully!")

        # Test cases with expected behaviors
        test_cases = [
            {
                "name": "Module Renaming",
                "request": "change module name from counter to timer",
                "expected_changes": ["module timer", "counter → timer"],
            },
            {
                "name": "Wire to Reg Conversion",
                "request": "convert wire declarations to reg declarations",
                "expected_changes": ["reg internal_wire", "wire → reg"],
            },
            {
                "name": "Signal Width Change",
                "request": "change signal width from 8 bits to 16 bits",
                "expected_changes": ["[15:0]", "8 → 16"],
            },
        ]

        results = []

        for i, test_case in enumerate(test_cases, 1):
            print(f"\n🔬 Test {i}: {test_case['name']}")
            print(f"Request: {test_case['request']}")

            try:
                # Generate transformation
                result = pipeline.generate_xform(test_case["request"])

                if "error" in result:
                    print(f"❌ Generation failed: {result['error']}")
                    results.append(
                        {
                            "test": test_case["name"],
                            "generation_success": False,
                            "functional_test": False,
                            "error": result["error"],
                        }
                    )
                    continue

                print("✅ Transformation generated successfully")

                # Check validation results
                validation = result.get("validation", {})
                execution_success = validation.get("execution_success", False)
                transformation_applied = validation.get("transformation_applied", False)
                output_valid = validation.get("output_valid", False)

                print(f"📊 Validation Results:")
                print(f"  • Execution Success: {'✅' if execution_success else '❌'}")
                print(
                    f"  • Transformation Applied: {'✅' if transformation_applied else '❌'}"
                )
                print(f"  • Output Valid: {'✅' if output_valid else '❌'}")

                if validation.get("execution_error"):
                    print(f"  • Error: {validation['execution_error']}")

                # Test results summary
                test_results = validation.get("test_results", [])
                if test_results:
                    for test_result in test_results:
                        print(f"  • Test: {test_result.get('test_type', 'unknown')}")
                        print(
                            f"    - Success: {'✅' if test_result.get('success') else '❌'}"
                        )
                        if test_result.get("transformation_detected"):
                            print(f"    - Transformation detected: ✅")

                results.append(
                    {
                        "test": test_case["name"],
                        "generation_success": True,
                        "execution_success": execution_success,
                        "transformation_applied": transformation_applied,
                        "output_valid": output_valid,
                        "quality_score": validation.get("quality_score", 0.0),
                        "code_length": len(result.get("code", "")),
                    }
                )

            except Exception as e:
                print(f"❌ Test failed with exception: {e}")
                results.append(
                    {
                        "test": test_case["name"],
                        "generation_success": False,
                        "functional_test": False,
                        "error": str(e),
                    }
                )

        # Summary
        print("\n" + "=" * 60)
        print("📈 STEP 2 FUNCTIONAL VALIDATION SUMMARY")
        print("=" * 60)

        successful_tests = sum(1 for r in results if r.get("execution_success", False))
        functional_tests = sum(
            1 for r in results if r.get("transformation_applied", False)
        )
        valid_outputs = sum(1 for r in results if r.get("output_valid", False))

        print(f"🧪 Total Tests: {len(results)}")
        print(f"✅ Successful Executions: {successful_tests}/{len(results)}")
        print(f"🔄 Applied Transformations: {functional_tests}/{len(results)}")
        print(f"✅ Valid Outputs: {valid_outputs}/{len(results)}")

        avg_quality = sum(r.get("quality_score", 0.0) for r in results) / len(results)
        print(f"📊 Average Quality Score: {avg_quality:.2f}")

        print(f"\n📋 Individual Results:")
        for result in results:
            status = "✅" if result.get("execution_success") else "❌"
            functional = "🔄" if result.get("transformation_applied") else "⭕"
            print(
                f"  {status} {functional} {result['test']}: Quality={result.get('quality_score', 0.0):.2f}"
            )

        # Save detailed results
        with open("step2_functional_results.json", "w") as f:
            json.dump(
                {
                    "step": "Step 2: Functional Validation",
                    "summary": {
                        "total_tests": len(results),
                        "successful_executions": successful_tests,
                        "applied_transformations": functional_tests,
                        "valid_outputs": valid_outputs,
                        "average_quality": avg_quality,
                    },
                    "results": results,
                },
                f,
                indent=2,
            )

        print(f"\n💾 Detailed results saved to: step2_functional_results.json")

        if successful_tests == len(results) and functional_tests >= len(results) * 0.8:
            print("\n🎉 STEP 2 FUNCTIONAL VALIDATION PASSED!")
            print(
                "✅ Generated transformations are executing and applying changes correctly!"
            )
            return True
        else:
            print("\n⚠️ STEP 2 FUNCTIONAL VALIDATION NEEDS IMPROVEMENT")
            print(
                "🔧 Some transformations are not executing or applying changes correctly"
            )
            return False

    except Exception as e:
        print(f"\n💥 Step 2 test failed with error: {e}")
        return False


if __name__ == "__main__":
    success = test_step2_functional_validation()
    sys.exit(0 if success else 1)
