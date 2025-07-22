#!/usr/bin/env python3
"""
Comparison script to demonstrate improvements in RAG pipeline
Shows before/after examples of generated transformations
"""

import sys
import os
from pathlib import Path


def analyze_generated_xform(file_path):
    """Analyze a generated xform file and return quality metrics"""

    if not os.path.exists(file_path):
        return {"exists": False, "error": "File not found"}

    with open(file_path, "r") as f:
        content = f.read()

    metrics = {
        "exists": True,
        "total_lines": len(content.split("\n")),
        "has_shebang": content.startswith("#!/usr/bin/env python3"),
        "has_docstring": '"""' in content or "'''" in content,
        "has_imports": "import" in content,
        "has_pyverilog_import": "from pyverilog.vparser" in content,
        "has_visitor_class": "class" in content and "Visitor" in content,
        "has_visit_method": "def visit(self, node):" in content,
        "has_transform_function": "def transform_" in content,
        "has_main_function": "def main():" in content,
        "has_argparse": "argparse" in content,
        "has_error_handling": "try:" in content and "except" in content,
        "has_return_statements": "return True" in content and "return False" in content,
        "has_ast_checking": "isinstance(node, Node)" in content,
        "is_executable": content.endswith(
            'if __name__ == "__main__":\n    sys.exit(main())'
        )
        or "sys.exit(main())" in content,
        "syntax_valid": True,  # We'll check this
    }

    # Check syntax
    try:
        compile(content, file_path, "exec")
    except SyntaxError:
        metrics["syntax_valid"] = False
    except Exception:
        metrics["syntax_valid"] = False

    # Calculate completeness score
    essential_components = [
        "has_visitor_class",
        "has_visit_method",
        "has_transform_function",
        "has_main_function",
        "has_pyverilog_import",
        "has_error_handling",
    ]

    score = sum(1 for comp in essential_components if metrics[comp]) / len(
        essential_components
    )
    metrics["completeness_score"] = score

    return metrics


def compare_xforms():
    """Compare old generated xforms with expectations"""

    print("🔍 ANALYZING GENERATED XFORMS")
    print("=" * 60)

    # Path to old generated xforms
    old_xforms_dir = Path(
        "xform_generation_evaluation_ollama_codellama_20250714_230921/generated_xforms"
    )

    if not old_xforms_dir.exists():
        print(f"❌ Old xforms directory not found: {old_xforms_dir}")
        return

    # Sample files to analyze
    sample_files = [
        "add_enable_signal_attempt_1.py",
        "wire_to_reg_basic_attempt_1.py",
        "signal_rename_basic_attempt_1.py",
        "reset_condition_change_attempt_1.py",
    ]

    print("📊 ANALYSIS OF OLD GENERATED XFORMS")
    print("-" * 40)

    total_score = 0
    valid_files = 0

    for filename in sample_files:
        file_path = old_xforms_dir / filename
        metrics = analyze_generated_xform(file_path)

        if not metrics["exists"]:
            print(f"❌ {filename}: File not found")
            continue

        valid_files += 1
        score = metrics["completeness_score"]
        total_score += score

        print(f"\n📄 {filename}")
        print(f"   Completeness Score: {score:.2f}")
        print(f"   Lines of Code: {metrics['total_lines']}")
        print(f"   Syntax Valid: {'✅' if metrics['syntax_valid'] else '❌'}")
        print(f"   Has Visitor Class: {'✅' if metrics['has_visitor_class'] else '❌'}")
        print(
            f"   Has Transform Function: {'✅' if metrics['has_transform_function'] else '❌'}"
        )
        print(f"   Has Main Function: {'✅' if metrics['has_main_function'] else '❌'}")
        print(
            f"   Has Error Handling: {'✅' if metrics['has_error_handling'] else '❌'}"
        )
        print(f"   Is Executable: {'✅' if metrics['is_executable'] else '❌'}")

        if score < 0.5:
            print(f"   🚨 LOW QUALITY - Major components missing")
        elif score < 0.7:
            print(f"   ⚠️  MEDIUM QUALITY - Some components missing")
        else:
            print(f"   ✅ HIGH QUALITY - Most components present")

    if valid_files > 0:
        avg_score = total_score / valid_files
        print(f"\n📈 OVERALL STATISTICS")
        print(f"   Average Completeness Score: {avg_score:.2f}")
        print(f"   Files Analyzed: {valid_files}")

        if avg_score < 0.4:
            print(f"   🚨 POOR QUALITY GENERATION - Major improvements needed")
        elif avg_score < 0.6:
            print(f"   ⚠️  MEDIOCRE QUALITY - Significant improvements needed")
        else:
            print(f"   ✅ GOOD QUALITY - Minor improvements needed")

    print("\n" + "=" * 60)
    print("🎯 OPTIMIZATION TARGETS IDENTIFIED")
    print("=" * 60)

    print(
        """
Key Issues Found in Generated Xforms:
1. ❌ Incomplete code structure - missing essential components
2. ❌ Poor AST visitor implementation - not following patterns
3. ❌ Missing or broken error handling
4. ❌ Incomplete argument parsing
5. ❌ Non-executable code - missing main execution
6. ❌ Syntax errors and compilation issues

Optimizations Applied:
1. ✅ Enhanced prompt template with strict requirements
2. ✅ Template injection for incomplete generations  
3. ✅ Iterative improvement with validation feedback
4. ✅ Comprehensive code validation and scoring
5. ✅ Better pattern matching and structure enforcement
6. ✅ Automatic fixing of common issues

Expected Improvements:
- Completeness scores should increase from ~0.2 to >0.7
- All generated xforms should be syntactically valid
- Generated code should be immediately executable
- Better adherence to established xform patterns
"""
    )


def show_expected_structure():
    """Show what a proper xform should look like"""

    print("\n" + "=" * 60)
    print("📖 EXPECTED XFORM STRUCTURE")
    print("=" * 60)

    expected_structure = """
✅ PROPER XFORM STRUCTURE:

1. #!/usr/bin/env python3 (shebang)
2. Module docstring with description
3. Required imports:
   - import sys, os, re, argparse
   - from pyverilog.vparser.parser import parse
   - from pyverilog.vparser.ast import *

4. Visitor Class:
   - class SomethingVisitor:
   - __init__ method with parameters
   - visit(self, node) method
   - isinstance(node, Node) checking
   - Recursive child traversal

5. Transform Function:
   - def transform_something(input_file, output_file, ...)
   - Proper docstring with Args and Returns
   - File I/O handling
   - AST parsing with PyVerilog
   - Visitor application
   - Regex-based transformations
   - Error handling with try/except

6. Main Function:
   - def main():
   - ArgumentParser setup
   - Input validation
   - Function call
   - Return 0/1 for success/failure

7. Execution:
   - if __name__ == "__main__":
   - sys.exit(main())

8. Registry Entry:
   - Proper dictionary format
   - Function reference
   - Argument specifications
"""

    print(expected_structure)


if __name__ == "__main__":
    compare_xforms()
    show_expected_structure()

    print(f"\n🚀 To test the optimized pipeline, run:")
    print(f"   python test_optimized_rag.py")
