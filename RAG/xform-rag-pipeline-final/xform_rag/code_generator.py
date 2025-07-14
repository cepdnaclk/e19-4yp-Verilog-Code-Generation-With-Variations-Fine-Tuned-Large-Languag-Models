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
        """Create the prompt template for code generation"""
        template_text = """
        You are an expert Verilog transformation code generator. You specialize in creating Python scripts that transform Verilog code using PyVerilog AST parsing and regex-based modifications.

        CONTEXT: Here are examples of existing transformations and framework patterns:
        {context}

        TASK: Generate a complete Python transformation script based on the user's request.

        USER REQUEST: {question}

        REQUIREMENTS:
        1. Follow the exact pattern from existing xform files
        2. Use PyVerilog AST for analysis and regex for transformations
        3. Include proper error handling and logging
        4. Follow the naming convention: xform_[descriptive_name].py
        5. Include a visitor class that inherits the pattern shown in examples
        6. Include a main transformation function
        7. Include proper command-line argument parsing
        8. Add the transformation to the registry format

        IMPORTANT PATTERNS TO FOLLOW:
        - Use AST visitor pattern for analysis
        - Store original signal information (width, dimensions, type)
        - Use regex for actual code modifications
        - Include comprehensive error handling
        - Follow the exact function signature patterns
        - Include proper docstrings and comments

        Generate a complete, working Python file that implements the requested transformation:

        ```python
        #!/usr/bin/env python3
        \"\"\"
        # [Include proper docstring describing the transformation]
        \"\"\"

        [Your complete implementation here]
        ```

        Also provide the registry entry for this transformation:

        ```python
        "[transformation_name]": {{
            "description": "[description]",
            "function": [function_name],
            "args": {{
                [argument definitions following the pattern]
            }},
        }},
        ```
        """

        return PromptTemplate(
            template=template_text, input_variables=["context", "question"]
        )

    def generate_xform(self, user_request: str) -> Dict[str, Any]:
        """
        Generate a new transformation based on user request

        Args:
            user_request: Description of the desired transformation

        Returns:
            Dictionary containing generated code and metadata
        """
        self.logger.info(f"Generating xform for request: {user_request}")

        try:
            # Query the RAG system using the newer invoke method
            result = self.qa_chain.invoke({"query": user_request})

            # Parse the response
            parsed_result = self._parse_llm_response(result["result"])

            # Generate filename
            filename = self._generate_filename(user_request)

            return {
                "filename": filename,
                "code": parsed_result["code"],
                "registry_entry": parsed_result["registry_entry"],
                "source_documents": [
                    doc.metadata.get("filename") for doc in result["source_documents"]
                ],
                "user_request": user_request,
                "llm_response": result["result"],
            }

        except Exception as e:
            self.logger.error(f"Error generating xform: {e}")
            return {"error": str(e), "user_request": user_request}

    def _parse_llm_response(self, response_text: str) -> Dict[str, str]:
        """Parse the LLM response to extract code and registry entry"""
        # Extract code from python code blocks
        code_match = re.search(r"```python\n(.*?)\n```", response_text, re.DOTALL)

        # Extract registry entry
        registry_match = re.search(
            r'"([^"]+)":\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}', response_text, re.DOTALL
        )

        # Determine the generated code
        if code_match:
            generated_code = code_match.group(1)
        else:
            # Fallback: look for shebang line as start of code
            shebang_match = re.search(
                r"(#!/usr/bin/env python3.*?)(?=```|\Z)", response_text, re.DOTALL
            )
            if shebang_match:
                generated_code = shebang_match.group(1)
            else:
                # Use the whole response as fallback
                generated_code = response_text

        registry_entry = registry_match.group(0) if registry_match else ""

        # Clean up the code
        generated_code = self._clean_generated_code(generated_code)

        return {"code": generated_code, "registry_entry": registry_entry}

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

    def validate_generated_code(self, code: str) -> Dict[str, Any]:
        """Validate the generated code"""
        validation_result = {
            "is_valid": True,
            "syntax_errors": [],
            "warnings": [],
            "has_main": False,
            "has_docstring": False,
            "has_visitor": False,
        }

        try:
            # Check syntax
            compile(code, "<generated>", "exec")
        except SyntaxError as e:
            validation_result["is_valid"] = False
            validation_result["syntax_errors"].append(f"Line {e.lineno}: {e.msg}")

        # Check for required patterns
        if "def main(" in code:
            validation_result["has_main"] = True
        else:
            validation_result["warnings"].append("No main() function found")

        if '"""' in code or "'''" in code:
            validation_result["has_docstring"] = True
        else:
            validation_result["warnings"].append("No docstring found")

        if "class" in code and "Visitor" in code:
            validation_result["has_visitor"] = True
        else:
            validation_result["warnings"].append("No visitor class found")

        return validation_result

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
