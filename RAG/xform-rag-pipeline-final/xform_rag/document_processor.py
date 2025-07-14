#!/usr/bin/env python3
"""
Document processing for the Xform RAG Pipeline
Handles loading and chunking of xform files
"""

import logging
from typing import List
from pathlib import Path
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import TextLoader
from langchain.schema import Document

from .config import RAGConfig


class DocumentProcessor:
    """Processes xform documents for the vector store"""

    def __init__(self, config: RAGConfig):
        self.config = config
        self.logger = logging.getLogger(__name__)
        self.text_splitter = self._create_text_splitter()

    def _create_text_splitter(self) -> RecursiveCharacterTextSplitter:
        """Create text splitter with appropriate settings for code"""
        return RecursiveCharacterTextSplitter(
            chunk_size=self.config.chunk_size,
            chunk_overlap=self.config.chunk_overlap,
            separators=["\n\nclass ", "\n\ndef ", "\n\n", "\n", " "],
        )

    def load_xform_documents(self) -> List[Document]:
        """Load and process all xform files into documents"""
        self.logger.info(f"Loading xform documents from {self.config.data_dir}")

        documents = []
        python_files = list(self.config.data_dir.glob("*.py"))

        for file_path in python_files:
            if self._is_xform_file(file_path):
                try:
                    file_docs = self._load_single_file(file_path)
                    documents.extend(file_docs)
                    self.logger.info(f"Loaded {file_path.name}")
                except Exception as e:
                    self.logger.error(f"Error loading {file_path}: {e}")

        # Split documents into chunks
        split_docs = self.text_splitter.split_documents(documents)
        self.logger.info(
            f"Created {len(split_docs)} document chunks from {len(documents)} files"
        )

        return split_docs

    def _is_xform_file(self, file_path: Path) -> bool:
        """Check if a file is a relevant xform file"""
        filename = file_path.name
        return filename.startswith("xform_") or filename in [
            "xform_framework.py",
            "xform_registry.py",
        ]

    def _load_single_file(self, file_path: Path) -> List[Document]:
        """Load a single file and add metadata"""
        loader = TextLoader(str(file_path))
        file_docs = loader.load()

        # Add metadata to each document
        for doc in file_docs:
            doc.metadata.update(
                {
                    "filename": file_path.name,
                    "file_type": self._classify_xform_file(file_path.name),
                    "source": str(file_path),
                    "size": file_path.stat().st_size,
                }
            )

        return file_docs

    def _classify_xform_file(self, filename: str) -> str:
        """Classify the type of xform file"""
        if filename == "xform_framework.py":
            return "framework"
        elif filename == "xform_registry.py":
            return "registry"
        elif filename.startswith("xform_"):
            return "transformation"
        else:
            return "unknown"

    def get_file_stats(self) -> dict:
        """Get statistics about xform files in the data directory"""
        python_files = list(self.config.data_dir.glob("*.py"))
        xform_files = [f for f in python_files if self._is_xform_file(f)]

        stats = {
            "total_python_files": len(python_files),
            "xform_files": len(xform_files),
            "file_types": {},
            "total_size": 0,
        }

        for file_path in xform_files:
            file_type = self._classify_xform_file(file_path.name)
            stats["file_types"][file_type] = stats["file_types"].get(file_type, 0) + 1
            stats["total_size"] += file_path.stat().st_size

        return stats

    def validate_documents(self, documents: List[Document]) -> bool:
        """Validate that documents are properly formatted"""
        if not documents:
            self.logger.warning("No documents loaded")
            return False

        for i, doc in enumerate(documents[:5]):  # Check first 5
            if not doc.page_content:
                self.logger.warning(f"Document {i} has no content")
                return False

            required_metadata = ["filename", "file_type", "source"]
            missing = [key for key in required_metadata if key not in doc.metadata]
            if missing:
                self.logger.warning(f"Document {i} missing metadata: {missing}")
                return False

        self.logger.info(f"Document validation passed for {len(documents)} documents")
        return True
