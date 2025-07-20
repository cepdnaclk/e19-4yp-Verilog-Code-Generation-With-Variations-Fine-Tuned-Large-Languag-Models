#!/usr/bin/env python3
"""
Compare old vs new RAG pipeline generations
Shows the improvements made in the optimization
"""

import sys
from pathlib import Path

# Add the xform_rag package to the path
sys.path.insert(0, str(Path(__file__).parent / "xform_rag"))


def analyze_generated_files():
    """Analyze previously generated files to show improvements"""

    print("🔍 Analyzing Generated Xform Files")
    print("=" * 50)

    # Check old generated files
    old_generated_dir = Path(
        "xform_generation_evaluation_ollama_codellama_20250714_230921/generated_xforms"
    )
    new_generated_dir = Path("test_outputs")

    if old_generated_dir.exists():
        old_files = list(old_generated_dir.glob("*.py"))
        print(f"📁 Found {len(old_files)} old generated files")

        # Analyze a sample old file
        if old_files:
            sample_old = old_files[0]
            with open(sample_old, "r") as f:
                old_content = f.read()

            print(f"\n📄 Sample old file: {sample_old.name}")
            print(f"   Length: {len(old_content)} characters")
            print(f"   Has main(): {'def main(' in old_content}")
            print(
                f"   Has visitor class: {'class' in old_content and 'Visitor' in old_content}"
            )
            print(f"   Has imports: {'from pyverilog' in old_content}")
            print(
                f"   Has error handling: {'try:' in old_content and 'except' in old_content}"
            )
    else:
        print("⚠️  Old generated files not found")

    if new_generated_dir.exists():
        new_files = list(new_generated_dir.glob("*.py"))
        print(f"📁 Found {len(new_files)} new generated files")

        # Analyze a sample new file if exists
        if new_files:
            sample_new = new_files[0]
            with open(sample_new, "r") as f:
                new_content = f.read()

            print(f"\n📄 Sample new file: {sample_new.name}")
            print(f"   Length: {len(new_content)} characters")
            print(f"   Has main(): {'def main(' in new_content}")
            print(
                f"   Has visitor class: {'class' in new_content and 'Visitor' in new_content}"
            )
            print(f"   Has imports: {'from pyverilog' in new_content}")
            print(
                f"   Has error handling: {'try:' in new_content and 'except' in new_content}"
            )
            print(f"   Has argparse: {'argparse' in new_content}")
    else:
        print("ℹ️  New generated files not found (run test_optimized_rag.py first)")


def show_key_improvements():
    """Show the key improvements made to the pipeline"""

    print("\n🚀 Key Optimizations Made")
    print("=" * 50)

    improvements = [
        {
            "area": "Prompt Engineering",
            "improvements": [
                "Added mandatory code structure template",
                "Explicit requirements for all components",
                "Step-by-step implementation guidance",
                "Clear error prevention instructions",
            ],
        },
        {
            "area": "Code Validation",
            "improvements": [
                "Comprehensive syntax checking",
                "Component completeness validation",
                "Missing import detection and fixing",
                "Proper error handling verification",
            ],
        },
        {
            "area": "Template Injection",
            "improvements": [
                "Automatic template structure for incomplete code",
                "Pattern-based code completion",
                "Preserved logic extraction from partial generations",
                "Guaranteed executable output structure",
            ],
        },
        {
            "area": "Iterative Improvement",
            "improvements": [
                "Multi-iteration generation with feedback",
                "Automatic retry with improved prompts",
                "Quality scoring and best result selection",
                "Early stopping for high-quality results",
            ],
        },
    ]

    for improvement in improvements:
        print(f"\n🔧 {improvement['area']}:")
        for item in improvement["improvements"]:
            print(f"   ✅ {item}")


def show_expected_results():
    """Show what to expect from the optimized pipeline"""

    print("\n📈 Expected Results")
    print("=" * 50)

    print("🎯 Target Metrics:")
    print("   • Completeness Score: >60% (was ~20-30%)")
    print("   • Syntax Validity: >90% (was ~40-50%)")
    print("   • Executable Code: >80% (was ~20-30%)")
    print("   • All Required Components: >70% (was ~10-20%)")

    print("\n📊 Quality Improvements:")
    print("   • Proper PyVerilog AST visitor patterns")
    print("   • Complete main() functions with argument parsing")
    print("   • Comprehensive error handling")
    print("   • Valid registry entries")
    print("   • Executable transformation logic")

    print("\n🚀 To Test:")
    print("   1. Run: python verify_setup.py")
    print("   2. Run: python test_optimized_rag.py")
    print("   3. Check generated files in test_outputs/")
    print("   4. Compare with old files if available")


if __name__ == "__main__":
    analyze_generated_files()
    show_key_improvements()
    show_expected_results()
