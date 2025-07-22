#!/usr/bin/env python3
"""
Document processing for the Xform RAG Pipeline
Handles loading and chunking of xform files
"""

import logging
import requests
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
        """Load and process all xform files and PyVerilog documentation into documents"""
        self.logger.info(f"Loading xform documents from {self.config.data_dir}")

        documents = []

        # Load existing xform files
        python_files = list(self.config.data_dir.glob("*.py"))
        for file_path in python_files:
            if self._is_xform_file(file_path):
                try:
                    file_docs = self._load_single_file(file_path)
                    documents.extend(file_docs)
                    self.logger.info(f"Loaded {file_path.name}")
                except Exception as e:
                    self.logger.error(f"Error loading {file_path}: {e}")

        # Load PyVerilog documentation
        pyverilog_docs = self._load_pyverilog_documentation()
        documents.extend(pyverilog_docs)

        # Load additional documentation files if they exist
        doc_files = self._find_documentation_files()
        for doc_file in doc_files:
            try:
                file_docs = self._load_single_file(doc_file)
                documents.extend(file_docs)
                self.logger.info(f"Loaded documentation: {doc_file.name}")
            except Exception as e:
                self.logger.error(f"Error loading documentation {doc_file}: {e}")

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

    def _load_pyverilog_documentation(self) -> List[Document]:
        """Load PyVerilog AST documentation and examples"""
        self.logger.info("Loading PyVerilog documentation...")

        documents = []

        # PyVerilog AST node documentation
        ast_docs = self._create_pyverilog_ast_docs()
        documents.extend(ast_docs)

        # Common transformation patterns
        pattern_docs = self._create_transformation_pattern_docs()
        documents.extend(pattern_docs)

        self.logger.info(f"Added {len(documents)} PyVerilog documentation chunks")
        return documents

    def _create_pyverilog_ast_docs(self) -> List[Document]:
        """Create documentation for PyVerilog AST nodes"""
        ast_documentation = """
        PyVerilog AST Node Reference for Transformations:

        ## Core AST Nodes:

        ### ModuleDef
        - Represents a Verilog module definition
        - Attributes: name, paramlist, portlist, items
        - Usage: isinstance(node, ModuleDef) to find modules
        - Example: Check node.name for module name

        ### Decl
        - Represents variable declarations (wire, reg, etc.)
        - Contains list of variable declarations
        - Usage: isinstance(node, Decl) for signal declarations
        - Check children for Wire, Reg, Integer, etc.

        ### Wire
        - Represents wire declarations
        - Attributes: name, width
        - Usage: isinstance(item, Wire) within Decl nodes

        ### Reg
        - Represents register declarations  
        - Attributes: name, width
        - Usage: isinstance(item, Reg) within Decl nodes

        ### Ioport
        - Represents input/output port declarations
        - Attributes: first (direction), second (signal)
        - Usage: isinstance(node, Ioport) for port modifications

        ### Identifier
        - Represents signal/variable names
        - Attributes: name
        - Usage: isinstance(node, Identifier) for renaming operations

        ### Width
        - Represents signal width specifications
        - Attributes: msb, lsb
        - Usage: Check width attributes for signal width changes

        ### NonblockingSubstitution
        - Represents non-blocking assignments (<=)
        - Attributes: left, right
        - Usage: isinstance(node, NonblockingSubstitution) for assignment modifications

        ### BlockingSubstitution  
        - Represents blocking assignments (=)
        - Attributes: left, right
        - Usage: isinstance(node, BlockingSubstitution) for combinational logic

        ### IfStatement
        - Represents if-else conditions
        - Attributes: cond, true_statement, false_statement
        - Usage: isinstance(node, IfStatement) for conditional logic modifications

        ### Always
        - Represents always blocks
        - Attributes: sens_list, statement
        - Usage: isinstance(node, Always) for always block modifications
        """

        return [
            Document(
                page_content=ast_documentation,
                metadata={
                    "filename": "pyverilog_ast_reference.md",
                    "file_type": "documentation",
                    "source": "pyverilog_ast_documentation",
                    "category": "ast_reference",
                },
            )
        ]

    def _create_transformation_pattern_docs(self) -> List[Document]:
        """Create documentation for common transformation patterns"""
        pattern_docs = """
        Common PyVerilog Transformation Patterns:

        ## Pattern 1: Wire to Reg Conversion
        ```python
        def find_wire_declarations(self, node):
            if isinstance(node, Decl):
                for item in node.children():
                    if isinstance(item, Wire):
                        # Found wire declaration
                        wire_name = item.name
                        # Store for regex transformation
        ```

        ## Pattern 2: Signal Renaming
        ```python
        def find_signal_usage(self, node):
            if isinstance(node, Identifier):
                if node.name == self.old_name:
                    # Found usage of target signal
                    # Mark for regex replacement
        ```

        ## Pattern 3: Port Modifications
        ```python
        def find_module_ports(self, node):
            if isinstance(node, ModuleDef):
                for port in node.portlist.ports:
                    if isinstance(port, Ioport):
                        # Found port declaration
                        direction = str(port.first)  # input/output
                        signal = port.second
        ```

        ## Pattern 4: Width Changes
        ```python
        def find_signal_widths(self, node):
            if hasattr(node, 'width') and node.width:
                # Found signal with width specification
                msb = node.width.msb
                lsb = node.width.lsb
        ```

        ## Pattern 5: Always Block Analysis
        ```python
        def analyze_always_blocks(self, node):
            if isinstance(node, Always):
                # Analyze sensitivity list
                sens_list = node.sens_list
                # Analyze statements inside always block
                statement = node.statement
        ```

        ## Regex Transformation Examples:

        ### Wire to Reg:
        ```python
        pattern = r'\\bwire\\s+' + re.escape(signal_name) + r'\\b'
        replacement = 'reg ' + signal_name
        ```

        ### Signal Renaming:
        ```python
        pattern = r'\\b' + re.escape(old_name) + r'\\b'
        replacement = new_name
        ```

        ### Width Modification:
        ```python
        pattern = r'\\[\\d+:\\d+\\]\\s*' + re.escape(signal_name)
        replacement = f'[{new_width-1}:0] {signal_name}'
        ```
        """

        return [
            Document(
                page_content=pattern_docs,
                metadata={
                    "filename": "transformation_patterns.md",
                    "file_type": "documentation",
                    "source": "transformation_patterns",
                    "category": "patterns",
                },
            )
        ]

    def _find_documentation_files(self) -> List[Path]:
        """Find additional documentation files in the project"""
        doc_patterns = ["*.md", "*.txt", "README*"]
        doc_files = []

        for pattern in doc_patterns:
            doc_files.extend(self.config.data_dir.glob(pattern))

        # Also check common documentation directories
        for doc_dir in ["docs", "documentation", "examples"]:
            doc_path = self.config.data_dir / doc_dir
            if doc_path.exists():
                for pattern in doc_patterns:
                    doc_files.extend(doc_path.glob(pattern))

        return doc_files

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
