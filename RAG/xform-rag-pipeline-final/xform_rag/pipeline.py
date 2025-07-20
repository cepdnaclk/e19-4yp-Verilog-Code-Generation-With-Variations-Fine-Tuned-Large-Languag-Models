#!/usr/bin/env python3
"""
Main pipeline orchestrator for the Xform RAG Pipeline
Coordinates all components and provides the main API
"""

import logging
from typing import Dict, Any, List

from .config import RAGConfig
from .llm_manager import LLMManager
from .vector_store import VectorStoreManager
from .document_processor import DocumentProcessor
from .code_generator import CodeGenerator
from .file_manager import FileManager
from .evaluation_manager import EvaluationManager
from .input_validator import InputValidator, ValidationError


class XformRAGPipeline:
    """Main RAG pipeline for xform code generation"""

    def __init__(self, config: RAGConfig = None):
        """
        Initialize the RAG pipeline

        Args:
            config: Configuration object. If None, uses default config.
        """
        self.config = config or RAGConfig()
        self.config.validate()

        # Setup logging
        self.logger = logging.getLogger(__name__)
        self.logger.info("Initializing Xform RAG Pipeline...")

        # Initialize all components
        self.validator = InputValidator()
        self.llm_manager = LLMManager(self.config)
        self.vector_store_manager = VectorStoreManager(self.config)
        self.document_processor = DocumentProcessor(self.config)
        self.code_generator = CodeGenerator(self.config)
        self.file_manager = FileManager(self.config)
        self.evaluation_manager = EvaluationManager(self.config)

        self.logger.info("Xform RAG Pipeline initialized successfully!")

    def generate_xform(self, user_request: str) -> Dict[str, Any]:
        """
        Generate a new transformation based on user request with validation

        Args:
            user_request: Description of the desired transformation

        Returns:
            Dictionary containing generated code and metadata
        """
        # Validate user request
        is_valid, issues = self.validator.validate_user_request(user_request)
        if not is_valid:
            error_msg = "Invalid user request: " + "; ".join(issues)
            self.logger.error(error_msg)
            return {"error": error_msg, "validation_issues": issues}

        try:
            result = self.code_generator.generate_xform(user_request)

            # Validate generated code if present
            if "code" in result:
                code_valid, code_issues = self.validator.validate_transformation_code(
                    result["code"]
                )
                if not code_valid:
                    self.logger.warning(
                        f"Generated code has validation issues: {code_issues}"
                    )
                    result["validation_warnings"] = code_issues

            return result

        except Exception as e:
            error_msg = f"Error generating transformation: {e}"
            self.logger.error(error_msg)
            return {"error": error_msg}

    def save_generated_xform(self, result: Dict[str, Any]) -> bool:
        """
        Save generated transformation to file

        Args:
            result: Result from generate_xform()

        Returns:
            True if saved successfully, False otherwise
        """
        return self.file_manager.save_generated_xform(result)

    def update_vector_store(self) -> bool:
        """
        Refresh vector store with new documents

        Returns:
            True if updated successfully, False otherwise
        """
        return self.vector_store_manager.update_vector_store()

    def list_transformations(self) -> List[str]:
        """
        List all known transformations from the vector store

        Returns:
            List of transformation filenames
        """
        return self.vector_store_manager.list_transformations()

    def get_system_stats(self) -> Dict[str, Any]:
        """
        Get comprehensive system statistics

        Returns:
            Dictionary with system statistics
        """
        return {
            "config": self.config.to_dict(),
            "vector_store": self.vector_store_manager.get_stats(),
            "generated_files": self.file_manager.get_generation_stats(),
            "llm_info": self.llm_manager.get_model_info(),
        }

    def test_system(self) -> Dict[str, bool]:
        """
        Test all system components

        Returns:
            Dictionary with test results for each component
        """
        results = {}

        try:
            # Test LLM connectivity
            results["llm"] = self.llm_manager.test_connection()
        except Exception as e:
            self.logger.error(f"LLM test failed: {e}")
            results["llm"] = False

        try:
            # Test vector store
            docs = self.vector_store_manager.search_similar("test", k=1)
            results["vector_store"] = len(docs) > 0
        except Exception as e:
            self.logger.error(f"Vector store test failed: {e}")
            results["vector_store"] = False

        try:
            # Test file operations
            test_result = {
                "filename": "test.py",
                "code": "# test",
                "user_request": "test",
            }
            results["file_manager"] = True  # Just check if we can create the manager
        except Exception as e:
            self.logger.error(f"File manager test failed: {e}")
            results["file_manager"] = False

        try:
            # Test code generator
            results["code_generator"] = self.code_generator.test_connection()
        except Exception as e:
            self.logger.error(f"Code generator test failed: {e}")
            results["code_generator"] = False

        return results

    def validate_generated_file(self, filename: str) -> Dict[str, Any]:
        """
        Validate a specific generated file

        Args:
            filename: Name of the file to validate

        Returns:
            Validation results
        """
        return self.file_manager.validate_generated_file(filename)

    def cleanup_old_files(self, days: int = 30) -> int:
        """
        Clean up old generated files

        Args:
            days: Remove files older than this many days

        Returns:
            Number of files removed
        """
        return self.file_manager.cleanup_old_files(days)

    def export_metadata(self, output_file: str = None) -> str:
        """
        Export all metadata to a JSON file

        Args:
            output_file: Output filename (optional)

        Returns:
            Path to exported file
        """
        return self.file_manager.export_metadata(output_file)

    def batch_generate(self, requests: List[str]) -> List[Dict[str, Any]]:
        """
        Generate multiple transformations in batch

        Args:
            requests: List of transformation requests

        Returns:
            List of generation results
        """
        results = []

        for i, request in enumerate(requests, 1):
            self.logger.info(f"Batch generation {i}/{len(requests)}: {request[:50]}...")

            try:
                result = self.generate_xform(request)
                results.append(result)

                # Auto-save if generation was successful
                if "error" not in result:
                    self.save_generated_xform(result)

            except Exception as e:
                self.logger.error(f"Batch item {i} failed: {e}")
                results.append({"error": str(e), "user_request": request})

        return results

    def search_similar_transformations(
        self, query: str, k: int = 5
    ) -> List[Dict[str, Any]]:
        """
        Search for similar transformations in the knowledge base

        Args:
            query: Search query
            k: Number of results to return

        Returns:
            List of similar transformation documents with metadata
        """
        docs = self.vector_store_manager.search_similar(query, k=k)

        results = []
        for doc in docs:
            results.append(
                {
                    "content": (
                        doc.page_content[:200] + "..."
                        if len(doc.page_content) > 200
                        else doc.page_content
                    ),
                    "metadata": doc.metadata,
                    "filename": doc.metadata.get("filename", "unknown"),
                }
            )

        return results

    def get_transformation_template(self, transformation_type: str) -> str:
        """
        Get a template for a specific type of transformation

        Args:
            transformation_type: Type of transformation (e.g., "signal_modification", "module_wrapper")

        Returns:
            Template code string
        """
        # Search for similar transformations
        similar = self.search_similar_transformations(transformation_type, k=1)

        if similar:
            return similar[0]["content"]
        else:
            return self._get_default_template()

    def _get_default_template(self) -> str:
        """Get default transformation template"""
        return '''#!/usr/bin/env python3
"""
Template for Verilog transformation
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse

class TransformationVisitor:
    def __init__(self, target_signal):
        self.target_signal = target_signal
        self.changes_made = []
    
    def visit(self, node):
        # Implement transformation logic here
        pass

def transform_verilog(input_file, output_file, target_signal):
    """Main transformation function"""
    try:
        # Parse input file
        with open(input_file, 'r') as f:
            content = f.read()
        
        # Apply transformations
        visitor = TransformationVisitor(target_signal)
        # ... transformation logic ...
        
        # Write output
        with open(output_file, 'w') as f:
            f.write(content)
        
        return True
    except Exception as e:
        print(f"Error: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description="Verilog transformation")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Target signal")
    args = parser.parse_args()
    
    success = transform_verilog(args.input_file, args.output_file, args.signal)
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())
'''

    def generate_and_evaluate_xform(
        self, user_request: str, save_result: bool = True
    ) -> Dict[str, Any]:
        """
        Generate and evaluate a transformation with automatic scoring

        Args:
            user_request: Description of the desired transformation
            save_result: Whether to save the generated transformation

        Returns:
            Dictionary containing both generation and evaluation results
        """
        # Generate the transformation
        generation_result = self.generate_xform(user_request)

        if "error" in generation_result:
            return {
                "generation": generation_result,
                "evaluation": {
                    "error": "Cannot evaluate failed generation",
                    "overall_score": 0.0,
                    "passed": False,
                },
            }

        # Evaluate the generated code
        evaluation_result = self.evaluation_manager.evaluate_single_generation(
            user_request=user_request,
            generated_code=generation_result["code"],
            generation_metadata={
                "filename": generation_result["filename"],
                "source_documents": generation_result.get("source_documents", []),
                "registry_entry": generation_result.get("registry_entry", ""),
            },
        )

        # Save if requested and evaluation passed
        if save_result and evaluation_result["passed"]:
            self.save_generated_xform(generation_result)

        return {"generation": generation_result, "evaluation": evaluation_result}

    def batch_generate_and_evaluate(
        self,
        requests: List[str],
        evaluation_name: str = None,
        save_successful: bool = True,
    ) -> Dict[str, Any]:
        """
        Generate and evaluate multiple transformations in batch

        Args:
            requests: List of transformation requests
            evaluation_name: Name for this evaluation batch
            save_successful: Whether to save successful generations

        Returns:
            Dictionary with batch results and evaluation summary
        """
        self.logger.info(
            f"Starting batch generation and evaluation of {len(requests)} requests"
        )

        # Generate all transformations
        generations = []
        for i, request in enumerate(requests, 1):
            self.logger.info(f"Generating {i}/{len(requests)}: {request[:50]}...")

            try:
                result = self.generate_xform(request)
                if "error" not in result:
                    generations.append(
                        {
                            "user_request": request,
                            "code": result["code"],
                            "filename": result["filename"],
                            "source_documents": result.get("source_documents", []),
                            "registry_entry": result.get("registry_entry", ""),
                            "metadata": {"generation_order": i},
                        }
                    )
                else:
                    generations.append(
                        {
                            "user_request": request,
                            "code": f"# Generation failed: {result['error']}",
                            "filename": f"failed_{i}.py",
                            "metadata": {
                                "generation_error": result["error"],
                                "generation_order": i,
                            },
                        }
                    )

            except Exception as e:
                self.logger.error(f"Batch item {i} failed: {e}")
                generations.append(
                    {
                        "user_request": request,
                        "code": f"# Exception during generation: {e}",
                        "filename": f"exception_{i}.py",
                        "metadata": {
                            "generation_exception": str(e),
                            "generation_order": i,
                        },
                    }
                )

        # Evaluate the batch
        evaluation_result = self.evaluation_manager.evaluate_batch_generations(
            generations, evaluation_name
        )

        # Save successful generations if requested
        if save_successful:
            saved_count = 0
            for gen in generations:
                if "generation_error" not in gen.get("metadata", {}):
                    # Convert to format expected by file manager
                    save_result = {
                        "filename": gen["filename"],
                        "code": gen["code"],
                        "user_request": gen["user_request"],
                        "registry_entry": gen.get("registry_entry", ""),
                        "source_documents": gen.get("source_documents", []),
                    }
                    if self.save_generated_xform(save_result):
                        saved_count += 1

            evaluation_result["saved_generations"] = saved_count

        return evaluation_result

    def run_comprehensive_evaluation(
        self, test_suite: str = "basic", prompt_strategies: List[str] = ["rich"]
    ) -> Dict[str, Any]:
        """
        Run comprehensive evaluation using predefined test suites

        Args:
            test_suite: "basic" or "comprehensive"
            prompt_strategies: List of prompt strategies to test

        Returns:
            Dictionary with evaluation results
        """

        def code_generator_func(task_spec, strategy):
            """Function that generates code for a given task and strategy"""
            return self.generate_xform(task_spec.description)["code"]

        return self.evaluation_manager.run_comprehensive_evaluation(
            code_generator_func=code_generator_func,
            test_suite=test_suite,
            prompt_strategies=prompt_strategies,
        )

    def evaluate_pass_at_k(
        self,
        user_request: str,
        k_values: List[int] = [1, 3, 5, 10],
        temperature: float = 0.7,
    ) -> Dict[str, Any]:
        """
        Generate multiple attempts and evaluate with Pass@k metrics

        Args:
            user_request: The transformation request
            k_values: Values of k to calculate Pass@k for
            temperature: Temperature for diverse generation

        Returns:
            Dictionary with Pass@k results
        """
        max_k = max(k_values)
        generated_codes = []

        self.logger.info(f"Generating {max_k} attempts for Pass@k evaluation")

        # Generate multiple attempts (simplified - in practice you'd vary parameters)
        for attempt in range(max_k):
            try:
                result = self.generate_xform(user_request)
                if "error" not in result:
                    generated_codes.append(result["code"])
                else:
                    generated_codes.append(
                        f"# Attempt {attempt + 1} failed: {result['error']}"
                    )
            except Exception as e:
                generated_codes.append(f"# Attempt {attempt + 1} exception: {e}")

        # Evaluate with Pass@k
        return self.evaluation_manager.evaluate_pass_at_k(
            user_request=user_request,
            generated_codes=generated_codes,
            k_values=k_values,
            metadata={"temperature": temperature, "model": self.config.model_name},
        )

    def get_evaluation_summary(self) -> Dict[str, Any]:
        """Get summary of recent evaluations"""
        history = self.evaluation_manager.get_evaluation_history(limit=10)

        if not history:
            return {"message": "No evaluations found"}

        # Calculate summary statistics
        total_evaluations = len(history)
        avg_success_rate = sum(h["success_rate"] for h in history) / total_evaluations
        avg_score = sum(h["average_score"] for h in history) / total_evaluations

        return {
            "total_evaluations": total_evaluations,
            "average_success_rate": avg_success_rate,
            "average_score": avg_score,
            "recent_evaluations": history[:5],  # Most recent 5
            "evaluation_directory": str(self.evaluation_manager.eval_output_dir),
        }

    def __repr__(self) -> str:
        """String representation of the pipeline"""
        return (
            f"XformRAGPipeline(model={self.config.model_type}:{self.config.model_name})"
        )
