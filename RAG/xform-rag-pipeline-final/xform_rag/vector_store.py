#!/usr/bin/env python3
"""
Vector store management for the Xform RAG Pipeline
Handles Chroma vector database operations
"""

import logging
import shutil
from typing import List
from langchain.schema import Document

# Import with fallback for different versions
try:
    from langchain_chroma import Chroma
except ImportError:
    from langchain_community.vectorstores import Chroma

try:
    from langchain_huggingface import HuggingFaceEmbeddings
except ImportError:
    try:
        from langchain_community.embeddings import HuggingFaceEmbeddings
    except ImportError:
        from langchain.embeddings import HuggingFaceEmbeddings

from .config import RAGConfig
from .document_processor import DocumentProcessor


class VectorStoreManager:
    """Manages the vector store for document retrieval"""

    def __init__(self, config: RAGConfig):
        self.config = config
        self.logger = logging.getLogger(__name__)
        self.embeddings = self._create_embeddings()
        self.vector_store = None
        self.document_processor = DocumentProcessor(config)

    def _create_embeddings(self) -> HuggingFaceEmbeddings:
        """Create embeddings model"""
        self.logger.info(
            f"Creating embeddings with model: {self.config.embedding_model}"
        )
        return HuggingFaceEmbeddings(model_name=self.config.embedding_model)

    def get_vector_store(self) -> Chroma:
        """Get or create the vector store"""
        if self.vector_store is None:
            self.vector_store = self._load_or_create_vector_store()
        return self.vector_store

    def _load_or_create_vector_store(self) -> Chroma:
        """Load existing vector store or create new one"""
        if self._vector_store_exists():
            self.logger.info("Loading existing vector store...")
            return self._load_existing_vector_store()
        else:
            self.logger.info("Creating new vector store...")
            return self._create_new_vector_store()

    def _vector_store_exists(self) -> bool:
        """Check if vector store directory exists and has content"""
        return self.config.vector_store_dir.exists() and any(
            self.config.vector_store_dir.iterdir()
        )

    def _load_existing_vector_store(self) -> Chroma:
        """Load existing vector store from disk"""
        try:
            vector_store = Chroma(
                persist_directory=str(self.config.vector_store_dir),
                embedding_function=self.embeddings,
            )

            # Verify the store has documents
            if vector_store._collection.count() == 0:
                self.logger.warning("Vector store is empty, creating new one...")
                return self._create_new_vector_store()

            self.logger.info(
                f"Loaded vector store with {vector_store._collection.count()} documents"
            )
            return vector_store

        except Exception as e:
            self.logger.error(f"Error loading vector store: {e}")
            self.logger.info("Creating new vector store...")
            return self._create_new_vector_store()

    def _create_new_vector_store(self) -> Chroma:
        """Create new vector store from documents"""
        # Load documents
        documents = self.document_processor.load_xform_documents()

        if not documents:
            raise RuntimeError("No documents found to create vector store")

        # Validate documents
        if not self.document_processor.validate_documents(documents):
            raise RuntimeError("Document validation failed")

        # Create vector store
        self.config.vector_store_dir.mkdir(parents=True, exist_ok=True)

        vector_store = Chroma.from_documents(
            documents=documents,
            embedding=self.embeddings,
            persist_directory=str(self.config.vector_store_dir),
        )

        self.logger.info(f"Created vector store with {len(documents)} documents")
        return vector_store

    def update_vector_store(self) -> bool:
        """Refresh vector store with current documents"""
        self.logger.info("Updating vector store...")

        try:
            # Remove existing store
            if self.config.vector_store_dir.exists():
                shutil.rmtree(self.config.vector_store_dir)

            # Create new store
            self.vector_store = None  # Reset cached instance
            self.vector_store = self._create_new_vector_store()

            self.logger.info("Vector store updated successfully!")
            return True

        except Exception as e:
            self.logger.error(f"Error updating vector store: {e}")
            return False

    def search_similar(self, query: str, k: int = None) -> List[Document]:
        """Search for similar documents"""
        if k is None:
            k = self.config.retrieval_k

        vector_store = self.get_vector_store()
        return vector_store.similarity_search(query, k=k)

    def get_retriever(self):
        """Get retriever for use in QA chains"""
        vector_store = self.get_vector_store()
        return vector_store.as_retriever(
            search_type="similarity", search_kwargs={"k": self.config.retrieval_k}
        )

    def list_transformations(self) -> List[str]:
        """List all known transformations from the vector store"""
        try:
            docs = self.search_similar("transformation function class", k=50)
            transformations = set()

            for doc in docs:
                filename = doc.metadata.get("filename", "")
                if (
                    filename
                    and filename.startswith("xform_")
                    and filename.endswith(".py")
                ):
                    transformations.add(filename)

            return sorted(list(transformations))

        except Exception as e:
            self.logger.error(f"Error listing transformations: {e}")
            return []

    def get_stats(self) -> dict:
        """Get vector store statistics"""
        try:
            vector_store = self.get_vector_store()
            doc_count = vector_store._collection.count()

            # Get file stats
            file_stats = self.document_processor.get_file_stats()

            return {
                "vector_store_documents": doc_count,
                "vector_store_directory": str(self.config.vector_store_dir),
                "embedding_model": self.config.embedding_model,
                **file_stats,
            }

        except Exception as e:
            self.logger.error(f"Error getting vector store stats: {e}")
            return {"error": str(e)}
