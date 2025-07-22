#!/usr/bin/env python3
"""
RAG Pipeline for Verilog Transformation Code Generation
This system learns from existing xform files and generates new transformations.
"""

import os
import sys
import json
import logging
from typing import List, Dict, Any, Optional
from pathlib import Path
import argparse

# LangChain imports
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import Chroma
from langchain_community.document_loaders import TextLoader
from langchain.schema import Document
from langchain.llms.base import LLM
from langchain.chains import RetrievalQA
from langchain.prompts import PromptTemplate
from langchain.callbacks.manager import CallbackManagerForLLMRun

# Import with fallback for different versions
try:
    from langchain_huggingface import HuggingFaceEmbeddings
except ImportError:
    from langchain_community.embeddings import HuggingFaceEmbeddings

try:
    from langchain_ollama import OllamaLLM as Ollama
except ImportError:
    from langchain_community.llms import Ollama

import requests
import re


class EC2ModelLLM(LLM):
    """Custom LLM class for EC2-hosted models"""
    
    def __init__(self, endpoint_url: str, model_name: str = "custom"):
        self.endpoint_url = endpoint_url
        self.model_name = model_name
    
    @property
    def _llm_type(self) -> str:
        return "ec2_custom"
    
    def _call(
        self,
        prompt: str,
        stop: Optional[List[str]] = None,
        run_manager: Optional[CallbackManagerForLLMRun] = None,
        **kwargs: Any,
    ) -> str:
        """Call the EC2-hosted model"""
        try:
            response = requests.post(
                self.endpoint_url,
                json={
                    "prompt": prompt,
                    "max_tokens": kwargs.get("max_tokens", 2000),
                    "temperature": kwargs.get("temperature", 0.1),
                    "stop": stop or []
                },
                timeout=120
            )
            response.raise_for_status()
            return response.json().get("text", "")
        except Exception as e:
            logging.error(f"Error calling EC2 model: {e}")
            return f"Error: Could not generate response from EC2 model: {e}"


class XformRAGPipeline:
    """Main RAG pipeline for xform code generation"""
    
    def __init__(self, 
                 data_dir: str = ".",
                 vector_store_dir: str = "./vector_store",
                 model_type: str = "ollama",
                 model_name: str = "codellama",
                 ec2_endpoint: str = None):
        """
        Initialize the RAG pipeline
        
        Args:
            data_dir: Directory containing xform files
            vector_store_dir: Directory to store vector database
            model_type: "ollama" or "ec2"
            model_name: Name of the model to use
            ec2_endpoint: EC2 endpoint URL (if using EC2)
        """
        self.data_dir = Path(data_dir)
        self.vector_store_dir = Path(vector_store_dir)
        self.model_type = model_type
        self.model_name = model_name
        self.ec2_endpoint = ec2_endpoint
        
        # Setup logging
        logging.basicConfig(level=logging.INFO)
        self.logger = logging.getLogger(__name__)
        
        # Initialize components
        self.embeddings = None
        self.vector_store = None
        self.llm = None
        self.qa_chain = None
        
        self._setup_pipeline()
    
    def _setup_pipeline(self):
        """Setup the complete RAG pipeline"""
        self.logger.info("Setting up RAG pipeline...")
        
        # Initialize embeddings
        self.embeddings = HuggingFaceEmbeddings(
            model_name="sentence-transformers/all-MiniLM-L6-v2"
        )
        
        # Initialize LLM based on type
        if self.model_type == "ollama":
            self.llm = Ollama(model=self.model_name, temperature=0.1)
        elif self.model_type == "ec2":
            if not self.ec2_endpoint:
                raise ValueError("EC2 endpoint URL required for EC2 model type")
            self.llm = EC2ModelLLM(self.ec2_endpoint, self.model_name)
        else:
            raise ValueError(f"Unsupported model type: {self.model_type}")
        
        # Load or create vector store
        self._setup_vector_store()
        
        # Create QA chain
        self._setup_qa_chain()
        
        self.logger.info("RAG pipeline setup complete!")
    
    def _setup_vector_store(self):
        """Setup vector store with xform documents"""
        if self.vector_store_dir.exists() and any(self.vector_store_dir.iterdir()):
            # Load existing vector store
            self.logger.info("Loading existing vector store...")
            self.vector_store = Chroma(
                persist_directory=str(self.vector_store_dir),
                embedding_function=self.embeddings
            )
        else:
            # Create new vector store
            self.logger.info("Creating new vector store...")
            documents = self._load_xform_documents()
            self.vector_store = Chroma.from_documents(
                documents=documents,
                embedding=self.embeddings,
                persist_directory=str(self.vector_store_dir)
            )
            # Note: Chroma 0.4.x+ automatically persists documents
    
    def _load_xform_documents(self) -> List[Document]:
        """Load and process xform files into documents"""
        documents = []
        
        # Find all Python files in the data directory
        python_files = list(self.data_dir.glob("*.py"))
        
        for file_path in python_files:
            if file_path.name.startswith("xform_") or file_path.name in ["xform_framework.py", "xform_registry.py"]:
                try:
                    loader = TextLoader(str(file_path))
                    file_docs = loader.load()
                    
                    # Add metadata
                    for doc in file_docs:
                        doc.metadata.update({
                            "filename": file_path.name,
                            "file_type": self._classify_xform_file(file_path.name),
                            "source": str(file_path)
                        })
                    
                    documents.extend(file_docs)
                    self.logger.info(f"Loaded {file_path.name}")
                    
                except Exception as e:
                    self.logger.error(f"Error loading {file_path}: {e}")
        
        # Split documents into chunks
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=2000,
            chunk_overlap=200,
            separators=["\n\nclass ", "\n\ndef ", "\n\n", "\n", " "]
        )
        
        split_docs = text_splitter.split_documents(documents)
        self.logger.info(f"Created {len(split_docs)} document chunks")
        
        return split_docs
    
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
    
    def _setup_qa_chain(self):
        """Setup the QA chain with custom prompt"""
        
        # Create custom prompt template
        prompt_template_text = """
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
        """
        # [Include proper docstring describing the transformation]
        """

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
                
        PROMPT = PromptTemplate(
            template=prompt_template_text,
            input_variables=["context", "question"]
        )
        
        # Create retrieval QA chain
        self.qa_chain = RetrievalQA.from_chain_type(
            llm=self.llm,
            chain_type="stuff",
            retriever=self.vector_store.as_retriever(
                search_type="similarity",
                search_kwargs={"k": 5}
            ),
            chain_type_kwargs={"prompt": PROMPT},
            return_source_documents=True
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
            # Query the RAG system
            result = self.qa_chain({"query": user_request})
            
            # Extract code and registry entry
            response_text = result["result"]
            
            # Parse the response to extract code and registry entry
            code_match = re.search(r"```python\n(.*?)\n```", response_text, re.DOTALL)
            registry_match = re.search(r'"([^"]+)":\s*\{[^}]+\}', response_text, re.DOTALL)
            
            generated_code = code_match.group(1) if code_match else response_text
            registry_entry = registry_match.group(0) if registry_match else ""
            
            # Generate filename
            filename = self._generate_filename(user_request)
            
            return {
                "filename": filename,
                "code": generated_code,
                "registry_entry": registry_entry,
                "source_documents": [doc.metadata.get("filename") for doc in result["source_documents"]],
                "user_request": user_request
            }
            
        except Exception as e:
            self.logger.error(f"Error generating xform: {e}")
            return {
                "error": str(e),
                "user_request": user_request
            }
    
    def _generate_filename(self, user_request: str) -> str:
        """Generate appropriate filename from user request"""
        # Clean and create filename
        clean_request = re.sub(r'[^a-zA-Z0-9\s]', '', user_request.lower())
        words = clean_request.split()[:4]  # Take first 4 words
        return f"xform_{'_'.join(words)}.py"
    
    def save_generated_xform(self, result: Dict[str, Any], output_dir: str = "./generated") -> bool:
        """Save generated transformation to file"""
        if "error" in result:
            self.logger.error(f"Cannot save xform with error: {result['error']}")
            return False
        
        output_path = Path(output_dir)
        output_path.mkdir(exist_ok=True)
        
        # Save the Python file
        file_path = output_path / result["filename"]
        with open(file_path, "w") as f:
            f.write(result["code"])
        
        # Save metadata
        metadata_path = output_path / f"{result['filename']}.metadata.json"
        metadata = {
            "user_request": result["user_request"],
            "registry_entry": result["registry_entry"],
            "source_documents": result.get("source_documents", []),
            "filename": result["filename"]
        }
        
        with open(metadata_path, "w") as f:
            json.dump(metadata, f, indent=2)
        
        self.logger.info(f"Saved generated xform to {file_path}")
        return True
    
    def update_vector_store(self):
        """Refresh vector store with new documents"""
        self.logger.info("Updating vector store...")
        
        # Clear existing store
        if self.vector_store_dir.exists():
            import shutil
            shutil.rmtree(self.vector_store_dir)
        
        # Recreate
        self._setup_vector_store()
        self.logger.info("Vector store updated!")
    
    def list_transformations(self) -> List[str]:
        """List all known transformations from the vector store"""
        try:
            # Query for transformation files
            docs = self.vector_store.similarity_search("transformation function class", k=50)
            transformations = set()
            
            for doc in docs:
                filename = doc.metadata.get("filename", "")
                if filename and filename.startswith("xform_") and filename.endswith(".py"):
                    transformations.add(filename)
            
            return sorted(list(transformations))
        except Exception as e:
            self.logger.error(f"Error listing transformations: {e}")
            return []


def main():
    """Main CLI interface"""
    parser = argparse.ArgumentParser(description="Xform RAG Pipeline")
    parser.add_argument("--data-dir", default=".", help="Directory containing xform files")
    parser.add_argument("--vector-store-dir", default="./vector_store", help="Vector store directory")
    parser.add_argument("--model-type", choices=["ollama", "ec2"], default="ollama", help="Model type")
    parser.add_argument("--model-name", default="codellama", help="Model name")
    parser.add_argument("--ec2-endpoint", help="EC2 endpoint URL")
    parser.add_argument("--output-dir", default="./generated", help="Output directory for generated xforms")
    
    subparsers = parser.add_subparsers(dest="command", help="Commands")
    
    # Generate command
    gen_parser = subparsers.add_parser("generate", help="Generate new xform")
    gen_parser.add_argument("request", help="Description of the transformation needed")
    
    # Update command
    subparsers.add_parser("update", help="Update vector store")
    
    # List command
    subparsers.add_parser("list", help="List known transformations")
    
    args = parser.parse_args()
    
    # Initialize pipeline
    try:
        pipeline = XformRAGPipeline(
            data_dir=args.data_dir,
            vector_store_dir=args.vector_store_dir,
            model_type=args.model_type,
            model_name=args.model_name,
            ec2_endpoint=args.ec2_endpoint
        )
    except Exception as e:
        print(f"Error initializing pipeline: {e}")
        return 1
    
    # Execute command
    if args.command == "generate":
        print(f"Generating transformation for: {args.request}")
        result = pipeline.generate_xform(args.request)
        
        if "error" in result:
            print(f"Error: {result['error']}")
            return 1
        
        # Save the result
        if pipeline.save_generated_xform(result, args.output_dir):
            print(f"Successfully generated: {result['filename']}")
            if result.get("registry_entry"):
                print(f"Registry entry:\n{result['registry_entry']}")
        else:
            print("Failed to save generated xform")
            return 1
    
    elif args.command == "update":
        pipeline.update_vector_store()
        print("Vector store updated!")
    
    elif args.command == "list":
        transformations = pipeline.list_transformations()
        print("Known transformations:")
        for xform in transformations:
            print(f"  {xform}")
    
    else:
        parser.print_help()
        return 1
    
    return 0


if __name__ == "__main__":
    sys.exit(main())