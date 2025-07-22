#!/usr/bin/env python3
"""
LLM management for the Xform RAG Pipeline
Handles different LLM backends (Ollama, EC2, etc.)
"""

import logging
import requests
from typing import Optional, List, Any
from langchain.llms.base import LLM
from langchain.callbacks.manager import CallbackManagerForLLMRun

# Import with fallback for different versions
try:
    from langchain_ollama import OllamaLLM as Ollama
except ImportError:
    try:
        from langchain_community.llms import Ollama
    except ImportError:
        from langchain.llms import Ollama

from .config import RAGConfig


class EC2ModelLLM(LLM):
    """Custom LLM class for EC2-hosted models"""

    def __init__(
        self, endpoint_url: str, model_name: str = "custom", config: RAGConfig = None
    ):
        self.endpoint_url = endpoint_url
        self.model_name = model_name
        self.config = config or RAGConfig()
        self.logger = logging.getLogger(__name__)

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
            payload = {
                "prompt": prompt,
                "max_tokens": kwargs.get("max_tokens", self.config.max_tokens),
                "temperature": kwargs.get("temperature", self.config.temperature),
                "stop": stop or [],
            }

            response = requests.post(
                self.endpoint_url, json=payload, timeout=self.config.timeout
            )
            response.raise_for_status()

            result = response.json()
            return result.get("text", "")

        except requests.exceptions.Timeout:
            error_msg = f"Timeout calling EC2 model at {self.endpoint_url}"
            self.logger.error(error_msg)
            return f"Error: {error_msg}"
        except requests.exceptions.RequestException as e:
            error_msg = f"Request error calling EC2 model: {e}"
            self.logger.error(error_msg)
            return f"Error: {error_msg}"
        except Exception as e:
            error_msg = f"Unexpected error calling EC2 model: {e}"
            self.logger.error(error_msg)
            return f"Error: {error_msg}"


class LLMManager:
    """Manages different LLM backends"""

    def __init__(self, config: RAGConfig):
        self.config = config
        self.logger = logging.getLogger(__name__)
        self._llm = None

    def get_llm(self) -> LLM:
        """Get the configured LLM instance"""
        if self._llm is None:
            self._llm = self._create_llm()
        return self._llm

    def _create_llm(self) -> LLM:
        """Create LLM instance based on configuration"""
        self.logger.info(
            f"Creating {self.config.model_type} LLM: {self.config.model_name}"
        )

        if self.config.model_type == "ollama":
            return self._create_ollama_llm()
        elif self.config.model_type == "ec2":
            return self._create_ec2_llm()
        else:
            raise ValueError(f"Unsupported model type: {self.config.model_type}")

    def _create_ollama_llm(self) -> Ollama:
        """Create Ollama LLM instance"""
        try:
            return Ollama(
                model=self.config.model_name, temperature=self.config.temperature
            )
        except Exception as e:
            raise RuntimeError(f"Failed to create Ollama LLM: {e}")

    def _create_ec2_llm(self) -> EC2ModelLLM:
        """Create EC2 LLM instance"""
        if not self.config.ec2_endpoint:
            raise ValueError("EC2 endpoint URL required for EC2 model type")

        try:
            return EC2ModelLLM(
                endpoint_url=self.config.ec2_endpoint,
                model_name=self.config.model_name,
                config=self.config,
            )
        except Exception as e:
            raise RuntimeError(f"Failed to create EC2 LLM: {e}")

    def test_connection(self) -> bool:
        """Test if the LLM is accessible"""
        try:
            llm = self.get_llm()

            # Try a simple test prompt
            test_prompt = "Hello, respond with 'OK' if you can process this."
            response = llm(test_prompt)

            self.logger.info(f"LLM test successful: {response[:50]}...")
            return True

        except Exception as e:
            self.logger.error(f"LLM test failed: {e}")
            return False

    def get_model_info(self) -> dict:
        """Get information about the current model"""
        return {
            "type": self.config.model_type,
            "name": self.config.model_name,
            "endpoint": (
                self.config.ec2_endpoint if self.config.model_type == "ec2" else "local"
            ),
            "temperature": self.config.temperature,
            "max_tokens": self.config.max_tokens,
        }
