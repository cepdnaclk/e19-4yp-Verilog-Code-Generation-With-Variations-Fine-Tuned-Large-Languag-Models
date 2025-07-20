#!/usr/bin/env python3
"""
Xform RAG Pipeline - AI-powered Verilog transformation code generation

This package provides a Retrieval-Augmented Generation (RAG) pipeline
for automatically generating Verilog transformation scripts based on
natural language descriptions.
"""

__version__ = "1.0.0"
__author__ = "Xform RAG Team"
__description__ = "AI-powered Verilog transformation code generation"

# Main exports
from .config import RAGConfig
from .pipeline import XformRAGPipeline
from .llm_manager import LLMManager, EC2ModelLLM
from .vector_store import VectorStoreManager
from .document_processor import DocumentProcessor
from .code_generator import CodeGenerator
from .file_manager import FileManager
from .cli import CLI
from .input_validator import InputValidator, ValidationError

# Evaluation system exports
from .task_specs import TaskSpec, TaskSpecBuilder, TestFileGenerator
from .scorer import XformScorer, ScoreBreakdown, PassAtKCalculator
from .evaluator import XformEvaluator, EvaluationResult, BatchEvaluationResult
from .evaluation_manager import EvaluationManager


# Convenience functions
def create_pipeline(
    data_dir=".", model_type="ollama", model_name="codellama", **kwargs
) -> XformRAGPipeline:
    """
    Create a RAG pipeline with simple configuration

    Args:
        data_dir: Directory containing xform files
        model_type: "ollama" or "ec2"
        model_name: Name of the model to use
        **kwargs: Additional configuration options

    Returns:
        Configured XformRAGPipeline instance
    """
    config_dict = {
        "data_dir": data_dir,
        "model_type": model_type,
        "model_name": model_name,
        **kwargs,
    }

    config = RAGConfig.from_dict(config_dict)
    return XformRAGPipeline(config)


def quick_generate(request: str, **config_kwargs) -> dict:
    """
    Quick generation function for one-off transformations

    Args:
        request: Transformation request description
        **config_kwargs: Configuration options for the pipeline

    Returns:
        Generation result dictionary
    """
    pipeline = create_pipeline(**config_kwargs)
    return pipeline.generate_xform(request)


# Version info
def get_version_info():
    """Get detailed version information"""
    import sys
    import platform

    try:
        import langchain

        langchain_version = langchain.__version__
    except:
        langchain_version = "unknown"

    try:
        import chromadb

        chromadb_version = chromadb.__version__
    except:
        chromadb_version = "unknown"

    return {
        "xform_rag_version": __version__,
        "python_version": sys.version,
        "platform": platform.platform(),
        "langchain_version": langchain_version,
        "chromadb_version": chromadb_version,
    }


# Package-level constants
DEFAULT_EMBEDDING_MODEL = "sentence-transformers/all-MiniLM-L6-v2"
DEFAULT_CHUNK_SIZE = 2000
DEFAULT_CHUNK_OVERLAP = 200
DEFAULT_RETRIEVAL_K = 5

__all__ = [
    # Main classes
    "RAGConfig",
    "XformRAGPipeline",
    "LLMManager",
    "VectorStoreManager",
    "DocumentProcessor",
    "CodeGenerator",
    "FileManager",
    "CLI",
    # Evaluation system
    "TaskSpec",
    "TaskSpecBuilder",
    "TestFileGenerator",
    "XformScorer",
    "ScoreBreakdown",
    "PassAtKCalculator",
    "XformEvaluator",
    "EvaluationResult",
    "BatchEvaluationResult",
    "EvaluationManager",
    # Convenience functions
    "create_pipeline",
    "quick_generate",
    "get_version_info",
    # Constants
    "DEFAULT_EMBEDDING_MODEL",
    "DEFAULT_CHUNK_SIZE",
    "DEFAULT_CHUNK_OVERLAP",
    "DEFAULT_RETRIEVAL_K",
]
