#!/usr/bin/env python3
"""
Code generation engine for the Xform RAG Pipeline
Handles the core RAG logic for generating transformations
"""

import logging
import re
from typing import Dict, Any
from langchain.chains import RetrievalQA
from langchain.prompts import PromptTemplate

from .config import RAGConfig
from .llm_manager import LLMManager
from .vector_store import VectorStoreManager


class CodeGenerator:
    """Generates xform code using RAG pipeline"""

    def __init__(self, config: RAGConfig):
        self.config = config
        self.logger = logging.getLogger(__name__)

        # Initialize components
        self.llm_manager = LLMManager(config)
        self.vector_store_manager = VectorStoreManager(config)
        self.qa_chain = None

        # Setup the QA chain
        self._setup_qa_chain()

    def _setup_qa_chain(self):
        """Setup the QA chain with custom prompt"""
        prompt_template = self._create_prompt_template()

        self.qa_chain = RetrievalQA.from_chain_type(
            llm=self.llm_manager.get_llm(),
            chain_type="stuff",
            retriever=self.vector_store_manager.get_retriever(),
            chain_type_kwargs={"prompt": prompt_template},
            return_source_documents=True,
        )

    def _create_prompt_template(self) -> PromptTemplate:
        """Create an enhanced prompt template with few-shot examples and better guidance"""

        template_text = """You are an expert Verilog transformation code generator. You must create COMPLETE, EXECUTABLE Python scripts that transform Verilog code using PyVerilog AST parsing and regex-based modifications.

EXISTING TRANSFORMATION EXAMPLES:
{context}

USER REQUEST: {question}

CRITICAL REQUIREMENTS - FOLLOW EXACTLY:
1. START with proper shebang: #!/usr/bin/env python3
2. CREATE a visitor class (plain Python class, no inheritance)
3. IMPLEMENT complete transform function with proper signature
4. INCLUDE complete main() function with argparse
5. USE PyVerilog AST for ANALYSIS ONLY - identify what to change
6. USE regex for ACTUAL TRANSFORMATIONS - modify the text directly
7. HANDLE all errors with try/except blocks
8. RETURN True/False for success/failure
9. ABSOLUTELY NO TODO COMMENTS - implement everything completely
10. NO PLACEHOLDER CODE - all logic must be functional

PROVEN TRANSFORMATION PATTERN - FOLLOW THIS STRUCTURE:

#!/usr/bin/env python3
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

class TransformationVisitor:
    def __init__(self, target_param=None):
        self.target_param = target_param
        self.changes_made = []
        self.target_elements = []

    def visit(self, node):
        if isinstance(node, Node):
            # ANALYZE based on transformation type:
            # Wire/Reg: Check isinstance(node, Decl) and look for Wire/Reg items
            # Renaming: Check isinstance(node, Identifier) for target names
            # Modules: Check isinstance(node, ModuleDef) for module operations
            # Ports: Check isinstance(node, Ioport) for port modifications
            
            # ALWAYS visit children
            for child in node.children():
                self.visit(child)

def transform_operation(input_file, output_file, target_param=None):
    try:
        with open(input_file, "r") as f:
            content = f.read()
        
        ast, directives = parse([input_file])
        visitor = TransformationVisitor(target_param)
        visitor.visit(ast)
        
        if not visitor.changes_made:
            print("Warning: No targets found for transformation")
            return False
        
        modified_content = content
        # Apply regex transformations based on visitor findings
        
        with open(output_file, "w") as f:
            f.write(modified_content)
        return True
        
    except Exception as e:
        print(f"Error: {{e}}")
        return False

def main():
    parser = argparse.ArgumentParser(description="Verilog transformation tool")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--target", help="Target parameter for transformation")
    
    args = parser.parse_args()
    if not os.path.exists(args.input_file):
        print(f"Error: Input file not found: {{args.input_file}}")
        return 1
    
    success = transform_operation(args.input_file, args.output_file, args.target)
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())

COMMON REGEX PATTERNS:
- Wire to reg: r'\\bwire\\s+' + re.escape(signal_name) + r'\\b' → 'reg ' + signal_name
- Signal rename: r'\\b' + re.escape(old_name) + r'\\b' → new_name
- Module rename: r'\\bmodule\\s+' + re.escape(module_name) + r'\\b' → 'module ' + new_name

Generate the COMPLETE transformation now, implementing all logic without any TODO comments:"""

        return PromptTemplate(
            template=template_text, input_variables=["context", "question"]
        )

    def generate_xform(self, user_request: str) -> Dict[str, Any]:
        """
        Generate a new transformation based on user request
        This method now uses the enhanced generation with validation

        Args:
            user_request: Description of the desired transformation

        Returns:
            Dictionary containing generated code and metadata
        """
        return self.generate_xform_enhanced(user_request, max_iterations=2)

    def _parse_llm_response(self, response_text: str) -> Dict[str, str]:
        """Parse the LLM response to extract code and registry entry"""
        # Extract the main code block from python code blocks
        code_pattern = r"```python\n(#!/usr/bin/env python3.*?)\n```"
        code_match = re.search(code_pattern, response_text, re.DOTALL)

        if code_match:
            generated_code = code_match.group(1)
        else:
            # Fallback: look for shebang line as start of code
            shebang_pattern = r"(#!/usr/bin/env python3.*?)(?=```|\n```|\Z)"
            shebang_match = re.search(shebang_pattern, response_text, re.DOTALL)
            if shebang_match:
                generated_code = shebang_match.group(1)
            else:
                # Last resort: use the whole response
                generated_code = response_text

        # Extract registry entry with better pattern matching
        registry_pattern = r'"([^"]+)":\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}'
        registry_match = re.search(registry_pattern, response_text, re.DOTALL)
        registry_entry = registry_match.group(0) if registry_match else ""

        # Clean up the code more thoroughly
        generated_code = self._clean_generated_code(generated_code)

        # Additional validation and fixing
        generated_code = self._fix_common_issues(generated_code)

        # If code is still incomplete, inject template structure
        # (This will be passed the user_request when available)

        return {"code": generated_code, "registry_entry": registry_entry}

    def _fix_common_issues(self, code: str) -> str:
        """Fix common issues in generated code and eliminate ALL TODO sections"""

        # AGGRESSIVELY remove ANY TODO comments
        if "TODO" in code or "# TODO" in code:
            self.logger.warning("Found TODO comments in generated code, removing them")

            lines = code.split("\n")
            filtered_lines = []

            for line in lines:
                if "TODO" in line or "# TODO" in line:
                    # Skip TODO lines entirely
                    self.logger.warning(f"Removed TODO line: {line.strip()}")
                    continue
                else:
                    filtered_lines.append(line)

            code = "\n".join(filtered_lines)

        # Ensure proper imports are present
        required_imports = [
            "import sys",
            "import os",
            "import re",
            "import argparse",
            "from pyverilog.vparser.parser import parse",
            "from pyverilog.vparser.ast import *",
        ]

        # Check if imports are missing and add them after shebang/docstring
        for import_stmt in required_imports:
            if import_stmt not in code:
                # Find insertion point (after docstring if present)
                docstring_end = code.find('"""', code.find('"""') + 3)
                if docstring_end != -1:
                    docstring_end += 3
                    while docstring_end < len(code) and code[docstring_end] in " \n":
                        docstring_end += 1
                    code = (
                        code[:docstring_end] + import_stmt + "\n" + code[docstring_end:]
                    )
                else:
                    # No docstring, add after shebang
                    shebang_end = code.find("\n") + 1
                    code = code[:shebang_end] + import_stmt + "\n" + code[shebang_end:]

        # Ensure proper main execution
        if "def main():" in code and "sys.exit(main())" not in code:
            if not code.strip().endswith("sys.exit(main())"):
                code = (
                    code.rstrip()
                    + '\n\nif __name__ == "__main__":\n    sys.exit(main())\n'
                )

        # Ensure visitor classes have proper node checking
        if "def visit(self, node):" in code and "isinstance(node, Node)" not in code:
            # Add proper node type checking to visit methods
            visit_pattern = (
                r"(def visit\(self, node\):\s*\n)(.*?)(\n.*?for.*?node\.children)"
            )

            def add_node_check(match):
                method_def = match.group(1)
                docstring = match.group(2) if '"""' in match.group(2) else ""
                children_visit = match.group(3)

                node_check = "        if isinstance(node, Node):\n            # Process the node based on its type\n"
                return method_def + docstring + node_check + children_visit

            code = re.sub(visit_pattern, add_node_check, code, flags=re.DOTALL)

        return code

    def _clean_generated_code(self, code: str) -> str:
        """Clean up generated code"""
        # Remove any extra markdown formatting
        code = re.sub(r"^```python\n?", "", code)
        code = re.sub(r"\n?```$", "", code)

        # Ensure proper shebang
        if not code.startswith("#!/usr/bin/env python3"):
            code = "#!/usr/bin/env python3\n" + code

        # Remove excessive blank lines
        code = re.sub(r"\n{3,}", "\n\n", code)

        return code.strip()

    def _generate_filename(self, user_request: str) -> str:
        """Generate appropriate filename from user request"""
        # Clean and create filename
        clean_request = re.sub(r"[^a-zA-Z0-9\s]", "", user_request.lower())
        words = clean_request.split()[:4]  # Take first 4 words
        filename = f"xform_{'_'.join(words)}.py"

        # Ensure it's a valid filename
        filename = re.sub(r"[^a-zA-Z0-9_.]", "_", filename)

        return filename

    def _validate_code_quality(self, code: str) -> Dict[str, Any]:
        """Comprehensive validation of the generated code"""
        validation_result = {
            "is_valid": True,
            "syntax_errors": [],
            "warnings": [],
            "missing_components": [],
            "has_main": False,
            "has_docstring": False,
            "has_visitor": False,
            "has_transform_function": False,
            "has_proper_imports": False,
            "has_error_handling": False,
            "has_argparse": False,
            "completeness_score": 0.0,
        }

        try:
            # Check syntax
            compile(code, "<generated>", "exec")
        except SyntaxError as e:
            validation_result["is_valid"] = False
            validation_result["syntax_errors"].append(f"Line {e.lineno}: {e.msg}")
            return validation_result  # Return early if syntax is broken
        except Exception as e:
            validation_result["is_valid"] = False
            validation_result["syntax_errors"].append(f"Compilation error: {e}")
            return validation_result

        # Check for required components
        components_found = 0
        total_components = 7

        # 1. Check for main function
        if "def main(" in code:
            validation_result["has_main"] = True
            components_found += 1
        else:
            validation_result["missing_components"].append("main() function")

        # 2. Check for docstring
        if '"""' in code or "'''" in code:
            validation_result["has_docstring"] = True
            components_found += 1
        else:
            validation_result["missing_components"].append("module docstring")

        # 3. Check for visitor class
        if "class" in code and "Visitor" in code:
            validation_result["has_visitor"] = True
            components_found += 1
        else:
            validation_result["missing_components"].append("visitor class")

        # 4. Check for transform function
        if "def transform_" in code:
            validation_result["has_transform_function"] = True
            components_found += 1
        else:
            validation_result["missing_components"].append("transform function")

        # 5. Check for proper imports
        required_imports = [
            "from pyverilog.vparser.parser import parse",
            "from pyverilog.vparser.ast import",
            "import argparse",
        ]
        import_count = sum(1 for imp in required_imports if imp in code)
        if import_count >= 2:  # At least pyverilog imports
            validation_result["has_proper_imports"] = True
            components_found += 1
        else:
            validation_result["missing_components"].append("required imports")

        # 6. Check for error handling
        if "try:" in code and "except" in code:
            validation_result["has_error_handling"] = True
            components_found += 1
        else:
            validation_result["missing_components"].append("error handling")

        # 7. Check for argument parsing
        if "argparse.ArgumentParser" in code or "parser.add_argument" in code:
            validation_result["has_argparse"] = True
            components_found += 1
        else:
            validation_result["missing_components"].append("argument parsing")

        # Calculate completeness score
        validation_result["completeness_score"] = components_found / total_components

        # Additional warnings for quality
        if "def visit(self, node):" in code and "isinstance(node, Node)" not in code:
            validation_result["warnings"].append(
                "Visitor method missing proper node type checking"
            )

        if "return True" not in code or "return False" not in code:
            validation_result["warnings"].append(
                "Transform function missing proper return values"
            )

        if "changes_made" not in code:
            validation_result["warnings"].append("No tracking of changes made")

        # Check for TODO comments - this should fail validation
        if "TODO" in code or "# TODO" in code:
            validation_result["is_valid"] = False
            validation_result["warnings"].append(
                "Code contains TODO comments - must be complete"
            )

        if validation_result["completeness_score"] < 0.6:
            validation_result["is_valid"] = False

        return validation_result

    def validate_generated_code(self, code: str) -> Dict[str, Any]:
        """Legacy method name for backward compatibility"""
        return self._validate_code_quality(code)

    def test_connection(self) -> bool:
        """Test if the code generator is working"""
        try:
            # Test LLM connection
            if not self.llm_manager.test_connection():
                return False

            # Test vector store
            docs = self.vector_store_manager.search_similar("test", k=1)
            if not docs:
                self.logger.warning("No documents found in vector store")
                return False

            self.logger.info("Code generator test successful")
            return True

        except Exception as e:
            self.logger.error(f"Code generator test failed: {e}")
            return False

    def generate_xform_enhanced(
        self, user_request: str, max_iterations: int = 3
    ) -> Dict[str, Any]:
        """
        Generate a new transformation with iterative improvement

        Args:
            user_request: Description of the desired transformation
            max_iterations: Maximum number of improvement iterations

        Returns:
            Dictionary containing generated code and metadata
        """
        self.logger.info(f"Generating enhanced xform for request: {user_request}")

        best_result = None
        best_score = 0.0

        for iteration in range(max_iterations):
            self.logger.info(f"Iteration {iteration + 1}/{max_iterations}")

            try:
                # Modify the request for subsequent iterations
                if iteration > 0 and best_result:
                    # Add feedback from previous iteration
                    validation = best_result.get("validation", {})
                    missing_components = validation.get("missing_components", [])

                    if missing_components:
                        enhanced_request = f"""
                        {{user_request}}
                        
                        IMPORTANT: The previous attempt was missing these critical components:
                        {', '.join(missing_components)}
                        
                        Ensure the generated code includes ALL required components:
                        - Complete visitor class with proper AST traversal
                        - Main transform function with correct signature  
                        - Proper error handling with try/except blocks
                        - Complete argument parsing with argparse
                        - All required imports (pyverilog, sys, os, re, argparse)
                        - Executable main() function that calls sys.exit()
                        """
                    else:
                        enhanced_request = user_request
                else:
                    enhanced_request = user_request

                # Query the RAG system
                result = self.qa_chain.invoke({"query": enhanced_request})

                # Parse the response
                parsed_result = self._parse_llm_response(result["result"])

                # Apply template injection if needed
                parsed_result["code"] = self._inject_template_structure(
                    parsed_result["code"], user_request
                )

                # Validate the generated code with enhanced functional testing
                validation_result = self._validate_code_enhanced(
                    parsed_result["code"], user_request
                )

                # Generate filename
                filename = self._generate_filename(user_request)

                current_result = {
                    "filename": filename,
                    "code": parsed_result["code"],
                    "registry_entry": parsed_result["registry_entry"],
                    "source_documents": [
                        doc.metadata.get("filename")
                        for doc in result["source_documents"]
                    ],
                    "user_request": user_request,
                    "llm_response": result["result"],
                    "validation": validation_result,
                    "iteration": iteration + 1,
                    "completeness_score": validation_result.get(
                        "completeness_score", 0.0
                    ),
                }

                # Check if this is the best result so far
                current_score = validation_result.get("completeness_score", 0.0)
                if current_score > best_score:
                    best_score = current_score
                    best_result = current_result

                # If we achieved high quality, stop early
                if validation_result.get("is_valid", False) and current_score >= 0.85:
                    self.logger.info(
                        f"High quality result achieved in iteration {iteration + 1}"
                    )
                    break

            except Exception as e:
                self.logger.error(f"Error in iteration {iteration + 1}: {e}")
                if best_result is None:
                    return {"error": str(e), "user_request": user_request}

        if best_result:
            self.logger.info(
                f"Best result: score {best_score:.2f} from iteration {best_result['iteration']}"
            )
            return best_result
        else:
            return {
                "error": "Failed to generate valid code after all iterations",
                "user_request": user_request,
            }

    def _inject_template_structure(self, code: str, user_request: str) -> str:
        """Inject minimal template structure if the generated code is incomplete"""

        # Only inject if code is severely incomplete (missing basic structure)
        if not code.strip() or len(code.strip()) < 100:
            # Generate a minimal template based on user request
            transform_name = self._generate_transform_name(user_request)

            template = f'''#!/usr/bin/env python3
"""
{{user_request}}
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

class {transform_name.title()}Visitor:
    """AST visitor for transformation analysis."""
    
    def __init__(self):
        self.changes_made = []
        self.target_elements = []
    
    def visit(self, node):
        """Visit AST nodes and identify transformation targets."""
        if isinstance(node, Node):
            # Analysis logic will be generated by LLM
            for child in node.children():
                self.visit(child)

def transform_{{transform_name}}(input_file, output_file):
    """Main transformation function."""
    try:
        with open(input_file, "r") as f:
            content = f.read()
        
        ast, directives = parse([input_file])
        visitor = {{transform_name.title()}}Visitor()
        visitor.visit(ast)
        
        # Transformation logic will be generated by LLM
        modified_content = content
        
        with open(output_file, "w") as f:
            f.write(modified_content)
        
        return True
    except Exception as e:
        print(f"Error: {{e}}")
        return False

def main():
    """Command line interface."""
    parser = argparse.ArgumentParser(description="{{user_request}}")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    
    args = parser.parse_args()
    
    if not os.path.exists(args.input_file):
        print(f"Error: Input file not found")
        return 1
    
    success = transform_{{transform_name}}(args.input_file, args.output_file)
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())
'''
            return template

        return code

    def _generate_transform_name(self, user_request: str) -> str:
        """Generate a transform name from user request"""
        # Extract key words and create a name
        words = re.findall(r"\b\w+\b", user_request.lower())
        # Filter out common words
        filtered_words = [
            w
            for w in words
            if w
            not in [
                "a",
                "an",
                "the",
                "to",
                "from",
                "and",
                "or",
                "with",
                "in",
                "on",
                "for",
            ]
        ]
        # Take first few meaningful words
        name_words = filtered_words[:3] if len(filtered_words) >= 3 else filtered_words
        return "_".join(name_words) if name_words else "custom_transform"

    def _fix_generated_code(self, code_content: str, xform_type: str) -> str:
        """Fix common issues in generated code based on actual testing"""
        fixed_code = code_content

        # Fix 1: Remove NodeVisitor inheritance if present
        fixed_code = re.sub(
            r"class\s+TransformationVisitor\s*\(\s*NodeVisitor\s*\):",
            "class TransformationVisitor:",
            fixed_code,
        )

        # Fix 2: Add required imports if missing
        if "from pyverilog.vparser.ast import *" not in fixed_code:
            import_section = """#!/usr/bin/env python3
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *"""

            # Replace existing import section
            fixed_code = re.sub(
                r"#!/usr/bin/env python3.*?(?=class)",
                import_section + "\n\n",
                fixed_code,
                flags=re.DOTALL,
            )

        # Fix 3: Correct argument patterns and function logic based on transformation type
        if "wire" in xform_type.lower() and "reg" in xform_type.lower():
            # Wire to reg transformation - complete rewrite of problematic logic

            # Fix arguments
            fixed_code = re.sub(
                r'parser\.add_argument\("--old-name".*?\n.*?parser\.add_argument\("--new-name".*?\n',
                'parser.add_argument("--signal", help="Specific signal name to convert")\n',
                fixed_code,
                flags=re.DOTALL,
            )

            # Fix visitor class for wire detection
            visitor_fix = """class TransformationVisitor:
    def __init__(self, signal=None, width=None):
        self.signal = signal
        self.width = width
        self.changes_made = []
        self.wire_signals = []

    def visit(self, node):
        if isinstance(node, Decl):
            for child in node.children():
                if isinstance(child, Wire):
                    signal_name = str(child.name)
                    self.wire_signals.append(signal_name)
                    if not self.signal or signal_name == self.signal:
                        self.changes_made.append(f"Found wire '{signal_name}' to convert")
        
        if isinstance(node, Node):
            for child in node.children():
                self.visit(child)"""

            # Replace visitor class
            fixed_code = re.sub(
                r"class TransformationVisitor:.*?(?=def transform_operation)",
                visitor_fix + "\n\n",
                fixed_code,
                flags=re.DOTALL,
            )

            # Fix transform function signature
            fixed_code = re.sub(
                r"def transform_operation\(input_file, output_file[^)]*\):",
                "def transform_operation(input_file, output_file, signal=None, width=None):",
                fixed_code,
            )

            # Fix visitor initialization
            fixed_code = re.sub(
                r"visitor = TransformationVisitor\([^)]*\)",
                "visitor = TransformationVisitor(signal, width)",
                fixed_code,
            )

            # Fix transformation logic
            transform_logic = """        modified_content = content
        
        if signal:
            # Convert specific signal
            pattern = r'\\bwire\\s+' + re.escape(signal) + r'\\b'
            replacement = f'reg {signal}'
            modified_content = re.sub(pattern, replacement, modified_content)
            print(f"Converted wire '{signal}' to reg")
        else:
            # Convert all wires found by visitor
            for wire_name in visitor.wire_signals:
                pattern = r'\\bwire\\s+' + re.escape(wire_name) + r'\\b'
                replacement = f'reg {wire_name}'
                modified_content = re.sub(pattern, replacement, modified_content)
            print(f"Converted {len(visitor.wire_signals)} wires to regs")"""

            # Replace transformation logic (look for pattern starting with if old_name or similar)
            fixed_code = re.sub(
                r'if old_name.*?else:.*?print\("No renaming parameters provided"\)',
                transform_logic,
                fixed_code,
                flags=re.DOTALL,
            )

            # Fix main function call
            fixed_code = re.sub(
                r"success = transform_operation\(args\.input_file, args\.output_file[^)]*\)",
                'success = transform_operation(args.input_file, args.output_file, args.signal, getattr(args, "width", None))',
                fixed_code,
            )

        elif "signal" in xform_type.lower() and "width" in xform_type.lower():
            # Signal width transformation - should use --signal and --width
            fixed_code = re.sub(
                r'parser\.add_argument\("--old-name".*?\n.*?parser\.add_argument\("--new-name".*?\n',
                'parser.add_argument("--signal", help="Signal name to modify")\n    parser.add_argument("--width", help="New width value")\n',
                fixed_code,
                flags=re.DOTALL,
            )

            # Fix function signatures and calls for signal width
            fixed_code = re.sub(
                r"def transform_operation\(input_file, output_file[^)]*\):",
                "def transform_operation(input_file, output_file, signal=None, width=None):",
                fixed_code,
            )

            fixed_code = re.sub(
                r"success = transform_operation\(args\.input_file, args\.output_file[^)]*\)",
                "success = transform_operation(args.input_file, args.output_file, args.signal, args.width)",
                fixed_code,
            )

        return fixed_code

    def _validate_code_enhanced(
        self, code: str, user_request: str = ""
    ) -> Dict[str, Any]:
        """Enhanced validation including functional testing with automatic code fixing"""

        # Try to fix common issues first
        fixed_code = self._fix_generated_code(code, user_request)

        # First do static validation on fixed code
        validation_result = self._validate_code_quality(fixed_code)

        # Add functional validation
        functional_result = self._validate_functional_execution(
            fixed_code, user_request
        )

        # Combine results
        validation_result.update(functional_result)
        validation_result["fixed_code"] = fixed_code  # Store the fixed version

        # Update overall quality score based on functional testing
        base_score = validation_result.get("completeness_score", 0.0)
        if functional_result.get("execution_success", False):
            validation_result["quality_score"] = min(1.0, base_score + 0.2)
            validation_result["completeness_score"] = validation_result["quality_score"]
        else:
            validation_result["quality_score"] = max(0.0, base_score - 0.3)
            validation_result["completeness_score"] = validation_result["quality_score"]

        return validation_result

    def _validate_functional_execution(
        self, code: str, user_request: str = ""
    ) -> Dict[str, Any]:
        """Step 2: Functional validation - actually execute the transformation with test Verilog"""
        import tempfile
        import subprocess
        import os

        result = {
            "execution_success": False,
            "execution_error": None,
            "test_results": [],
            "output_valid": False,
            "transformation_applied": False,
        }

        try:
            # Create temporary files
            with tempfile.NamedTemporaryFile(
                mode="w", suffix=".py", delete=False
            ) as temp_script:
                temp_script.write(code)
                script_path = temp_script.name

            # Create test Verilog files based on transformation type
            test_verilog = self._create_test_verilog(user_request)

            with tempfile.NamedTemporaryFile(
                mode="w", suffix=".v", delete=False
            ) as temp_input:
                temp_input.write(test_verilog)
                input_path = temp_input.name

            with tempfile.NamedTemporaryFile(
                mode="w", suffix=".v", delete=False
            ) as temp_output:
                output_path = temp_output.name

            # Execute the transformation script
            try:
                # Determine arguments based on transformation type and generated code
                args = self._determine_transformation_args(
                    user_request, input_path, output_path, code
                )

                # Use sys.executable to get the current Python interpreter
                import sys

                cmd = [sys.executable, script_path] + args

                process = subprocess.run(
                    cmd,
                    capture_output=True,
                    text=True,
                    timeout=30,
                    cwd=os.path.dirname(script_path),
                )

                if process.returncode == 0:
                    result["execution_success"] = True

                    # Check if output file was created and modified
                    if os.path.exists(output_path):
                        with open(output_path, "r") as f:
                            output_content = f.read()

                        # Compare input and output to see if transformation was applied
                        if output_content != test_verilog:
                            result["transformation_applied"] = True

                            # Basic syntax validation of output Verilog
                            if self._validate_verilog_syntax(output_content):
                                result["output_valid"] = True

                        result["test_results"].append(
                            {
                                "test_type": "basic_execution",
                                "success": True,
                                "input_size": len(test_verilog),
                                "output_size": len(output_content),
                                "transformation_detected": result[
                                    "transformation_applied"
                                ],
                            }
                        )

                else:
                    result["execution_error"] = f"Script failed: {process.stderr}"

            except subprocess.TimeoutExpired:
                result["execution_error"] = "Script execution timed out"
            except Exception as e:
                result["execution_error"] = f"Execution error: {str(e)}"

        except Exception as e:
            result["execution_error"] = f"Setup error: {str(e)}"

        finally:
            # Cleanup temporary files
            for filepath in [script_path, input_path, output_path]:
                try:
                    if os.path.exists(filepath):
                        os.unlink(filepath)
                except:
                    pass

        return result

    def _create_test_verilog(self, user_request: str) -> str:
        """Create appropriate test Verilog code based on transformation type"""
        request_lower = user_request.lower()

        if "module" in request_lower and "rename" in request_lower:
            return """module counter(
    input clk,
    input reset,
    output reg [7:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 8'b0;
        else
            count <= count + 1;
    end
endmodule"""

        elif "wire" in request_lower and "reg" in request_lower:
            return """module test_module(
    input clk,
    output data_out
);
    wire internal_signal;
    wire [7:0] data_bus;
    
    assign internal_signal = clk;
    assign data_out = internal_signal;
endmodule"""

        elif "port" in request_lower and "add" in request_lower:
            return """module simple_module(
    input clk,
    input reset,
    output reg data_out
);
    always @(posedge clk) begin
        if (reset)
            data_out <= 1'b0;
        else
            data_out <= ~data_out;
    end
endmodule"""

        elif "signal" in request_lower and "width" in request_lower:
            return """module width_test(
    input clk,
    input [7:0] data_in,
    output reg [7:0] data_out
);
    always @(posedge clk) begin
        data_out <= data_in;
    end
endmodule"""

        else:
            # Generic test module
            return """module generic_test(
    input clk,
    input reset,
    input [7:0] data_in,
    output reg [7:0] data_out
);
    wire internal_wire;
    
    always @(posedge clk) begin
        if (reset)
            data_out <= 8'b0;
        else
            data_out <= data_in;
    end
    
    assign internal_wire = clk;
endmodule"""

    def _determine_transformation_args(
        self,
        user_request: str,
        input_path: str,
        output_path: str,
        generated_code: str = "",
    ) -> list:
        """Determine appropriate command line arguments for the transformation"""
        args = [input_path, output_path]

        # First, try to detect what arguments the generated code actually accepts
        detected_args = self._detect_script_arguments(generated_code)

        if detected_args:
            # Use detected arguments with appropriate values
            request_lower = user_request.lower()

            if "module" in request_lower and "rename" in request_lower:
                if "--old-name" in detected_args and "--new-name" in detected_args:
                    args.extend(["--old-name", "counter", "--new-name", "timer"])
                elif "--target" in detected_args:
                    args.extend(["--target", "counter"])

            elif "wire" in request_lower and "reg" in request_lower:
                if "--signal" in detected_args:
                    args.extend(["--signal", "internal_wire"])
                elif "--target" in detected_args:
                    args.extend(["--target", "internal_wire"])

            elif "port" in request_lower and "add" in request_lower:
                if "--port-name" in detected_args:
                    args.extend(["--port-name", "debug_enable"])
                elif "--target" in detected_args:
                    args.extend(["--target", "debug_enable"])

            elif "signal" in request_lower and "width" in request_lower:
                if "--signal" in detected_args and "--new-width" in detected_args:
                    args.extend(["--signal", "data_out", "--new-width", "16"])
                elif "--target" in detected_args:
                    args.extend(["--target", "data_out"])
        else:
            # Fallback to original logic if detection fails
            request_lower = user_request.lower()

            if "module" in request_lower and "rename" in request_lower:
                if "counter" in request_lower and "timer" in request_lower:
                    args.extend(["--old-name", "counter", "--new-name", "timer"])
                else:
                    args.extend(
                        ["--old-name", "generic_test", "--new-name", "renamed_module"]
                    )

            elif "wire" in request_lower and "reg" in request_lower:
                if "specific" in request_lower:
                    args.extend(["--signal", "internal_wire"])
                # For general wire-to-reg, no additional args needed

            elif "port" in request_lower and "add" in request_lower:
                if "enable" in request_lower:
                    args.extend(["--port-name", "debug_enable", "--port-type", "input"])

            elif "signal" in request_lower and "width" in request_lower:
                args.extend(["--signal", "data_out", "--new-width", "16"])

        return args

    def _detect_script_arguments(self, code: str) -> list:
        """Detect what command line arguments the generated script actually accepts"""
        detected_args = []

        # Look for add_argument calls
        import re

        arg_patterns = [
            r'parser\.add_argument\(["\']([^"\']+)["\']',
            r'add_argument\(["\']([^"\']+)["\']',
        ]

        for pattern in arg_patterns:
            matches = re.findall(pattern, code)
            detected_args.extend(matches)

        # Filter out positional arguments
        detected_args = [arg for arg in detected_args if arg.startswith("--")]

        return detected_args

    def _validate_verilog_syntax(self, verilog_code: str) -> bool:
        """Basic Verilog syntax validation"""
        try:
            # Check for basic Verilog structure
            required_patterns = [
                r"module\s+\w+",  # Module declaration
                r"endmodule",  # Module end
            ]

            for pattern in required_patterns:
                if not re.search(pattern, verilog_code):
                    return False

            # Check for balanced parentheses and brackets
            paren_count = verilog_code.count("(") - verilog_code.count(")")
            bracket_count = verilog_code.count("[") - verilog_code.count("]")
            brace_count = verilog_code.count("{") - verilog_code.count("}")

            if paren_count != 0 or bracket_count != 0 or brace_count != 0:
                return False

            return True

        except Exception:
            return False
