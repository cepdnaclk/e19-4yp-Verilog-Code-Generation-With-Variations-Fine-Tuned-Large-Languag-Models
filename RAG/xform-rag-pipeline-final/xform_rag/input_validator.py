#!/usr/bin/env python3
"""
Input validation module for the Xform RAG Pipeline
Provides comprehensive validation for user inputs, file paths, and configurations
"""

import re
import logging
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple


class ValidationError(Exception):
    """Custom exception for validation errors"""

    pass


class InputValidator:
    """Comprehensive input validation for the RAG pipeline"""

    def __init__(self):
        self.logger = logging.getLogger(__name__)

        # Define validation patterns
        self.safe_filename_pattern = re.compile(r"^[a-zA-Z0-9_\-\.]+$")
        self.verilog_file_pattern = re.compile(r".*\.v$|.*\.sv$|.*\.vh$")
        self.python_file_pattern = re.compile(r".*\.py$")

        # Dangerous patterns to avoid
        self.dangerous_patterns = [
            r"\.\./",  # Directory traversal
            r"~/",  # Home directory
            r"/etc/",  # System directories
            r"/usr/",
            r"/var/",
            r"C:\\Windows\\",  # Windows system directories
            r"C:\\Program Files\\",
        ]

    def validate_user_request(self, user_request: str) -> Tuple[bool, List[str]]:
        """
        Validate user transformation request

        Args:
            user_request: The user's transformation request

        Returns:
            Tuple of (is_valid, list_of_issues)
        """
        issues = []

        # Check basic requirements
        if not user_request or not user_request.strip():
            issues.append("User request cannot be empty")
            return False, issues

        # Check length constraints
        if len(user_request) < 10:
            issues.append("User request too short - please provide more detail")

        if len(user_request) > 1000:
            issues.append("User request too long - please be more concise")

        # Check for dangerous content
        dangerous_keywords = [
            "rm -rf",
            "del /s",
            "format c:",
            "exec(",
            "eval(",
            "__import__",
        ]
        for keyword in dangerous_keywords:
            if keyword.lower() in user_request.lower():
                issues.append(
                    f"Request contains potentially dangerous content: {keyword}"
                )

        # Check for reasonable transformation keywords
        valid_keywords = [
            "wire",
            "reg",
            "signal",
            "port",
            "module",
            "width",
            "rename",
            "add",
            "remove",
            "change",
            "convert",
            "transform",
            "modify",
            "enable",
            "disable",
            "clock",
            "reset",
            "counter",
            "debug",
            "output",
            "input",
            "parameter",
        ]

        has_valid_keyword = any(
            keyword in user_request.lower() for keyword in valid_keywords
        )
        if not has_valid_keyword:
            issues.append(
                "Request should contain Verilog-related transformation keywords"
            )

        return len(issues) == 0, issues

    def validate_file_path(
        self, file_path: str, must_exist: bool = True, file_type: str = None
    ) -> Tuple[bool, List[str]]:
        """
        Validate file path for security and correctness

        Args:
            file_path: Path to validate
            must_exist: Whether the file must already exist
            file_type: Expected file type ('verilog', 'python', etc.)

        Returns:
            Tuple of (is_valid, list_of_issues)
        """
        issues = []

        if not file_path or not file_path.strip():
            issues.append("File path cannot be empty")
            return False, issues

        try:
            path = Path(file_path)
        except Exception as e:
            issues.append(f"Invalid file path format: {e}")
            return False, issues

        # Check for dangerous patterns
        path_str = str(path.resolve())
        for pattern in self.dangerous_patterns:
            if re.search(pattern, path_str, re.IGNORECASE):
                issues.append(f"File path contains dangerous pattern: {pattern}")

        # Check file extension if type specified
        if file_type:
            if file_type.lower() == "verilog":
                if not self.verilog_file_pattern.match(file_path):
                    issues.append("File must be a Verilog file (.v, .sv, .vh)")
            elif file_type.lower() == "python":
                if not self.python_file_pattern.match(file_path):
                    issues.append("File must be a Python file (.py)")

        # Check existence if required
        if must_exist and not path.exists():
            issues.append(f"File does not exist: {file_path}")

        # Check permissions if file exists
        if path.exists():
            if not path.is_file():
                issues.append(f"Path is not a file: {file_path}")
            else:
                try:
                    # Check read permission
                    with open(path, "r") as f:
                        f.read(1)
                except PermissionError:
                    issues.append(f"No read permission for file: {file_path}")
                except Exception as e:
                    issues.append(f"Cannot read file {file_path}: {e}")

        return len(issues) == 0, issues

    def validate_output_path(self, output_path: str) -> Tuple[bool, List[str]]:
        """
        Validate output file path

        Args:
            output_path: Path where output will be written

        Returns:
            Tuple of (is_valid, list_of_issues)
        """
        issues = []

        if not output_path or not output_path.strip():
            issues.append("Output path cannot be empty")
            return False, issues

        try:
            path = Path(output_path)
        except Exception as e:
            issues.append(f"Invalid output path format: {e}")
            return False, issues

        # Check for dangerous patterns
        path_str = str(path.resolve())
        for pattern in self.dangerous_patterns:
            if re.search(pattern, path_str, re.IGNORECASE):
                issues.append(f"Output path contains dangerous pattern: {pattern}")

        # Check parent directory exists and is writable
        parent_dir = path.parent
        if not parent_dir.exists():
            try:
                parent_dir.mkdir(parents=True, exist_ok=True)
            except Exception as e:
                issues.append(f"Cannot create output directory {parent_dir}: {e}")

        if parent_dir.exists():
            try:
                # Test write permission
                test_file = parent_dir / ".write_test"
                test_file.write_text("test")
                test_file.unlink()
            except Exception as e:
                issues.append(f"No write permission in output directory: {e}")

        return len(issues) == 0, issues

    def validate_model_config(self, config: Dict[str, Any]) -> Tuple[bool, List[str]]:
        """
        Validate model configuration

        Args:
            config: Model configuration dictionary

        Returns:
            Tuple of (is_valid, list_of_issues)
        """
        issues = []

        # Check required fields
        required_fields = ["model_type", "model_name"]
        for field in required_fields:
            if field not in config:
                issues.append(f"Missing required configuration field: {field}")

        # Validate model type
        valid_model_types = ["ollama", "ec2"]
        if "model_type" in config:
            if config["model_type"] not in valid_model_types:
                issues.append(
                    f"Invalid model_type: {config['model_type']}. Must be one of {valid_model_types}"
                )

        # EC2 specific validation
        if config.get("model_type") == "ec2":
            if "ec2_endpoint" not in config or not config["ec2_endpoint"]:
                issues.append("EC2 endpoint URL required for EC2 model type")
            else:
                # Basic URL validation
                url = config["ec2_endpoint"]
                if not (url.startswith("http://") or url.startswith("https://")):
                    issues.append("EC2 endpoint must be a valid HTTP/HTTPS URL")

        # Validate numeric parameters
        numeric_params = {
            "temperature": (0.0, 2.0),
            "max_tokens": (1, 10000),
            "timeout": (1, 600),
            "chunk_size": (100, 10000),
            "chunk_overlap": (0, 1000),
            "retrieval_k": (1, 50),
        }

        for param, (min_val, max_val) in numeric_params.items():
            if param in config:
                try:
                    value = float(config[param])
                    if not (min_val <= value <= max_val):
                        issues.append(
                            f"{param} must be between {min_val} and {max_val}"
                        )
                except (ValueError, TypeError):
                    issues.append(f"{param} must be a valid number")

        return len(issues) == 0, issues

    def validate_transformation_code(self, code: str) -> Tuple[bool, List[str]]:
        """
        Validate generated transformation code for basic safety

        Args:
            code: Generated Python code

        Returns:
            Tuple of (is_valid, list_of_issues)
        """
        issues = []

        if not code or not code.strip():
            issues.append("Generated code cannot be empty")
            return False, issues

        # Check for required shebang
        if not code.startswith("#!/usr/bin/env python3"):
            issues.append("Code must start with proper shebang: #!/usr/bin/env python3")

        # Check for required imports
        required_imports = [
            "import sys",
            "import os",
            "import re",
            "import argparse",
            "from pyverilog.vparser.parser import parse",
            "from pyverilog.vparser.ast import *",
        ]

        for import_stmt in required_imports:
            if import_stmt not in code:
                issues.append(f"Missing required import: {import_stmt}")

        # Check for dangerous patterns
        dangerous_patterns = [
            r"exec\s*\(",
            r"eval\s*\(",
            r"__import__\s*\(",
            r"subprocess\.",
            r"os\.system\s*\(",
            r"os\.popen\s*\(",
            r"rm\s+-rf",
            r"del\s+/s",
        ]

        for pattern in dangerous_patterns:
            if re.search(pattern, code, re.IGNORECASE):
                issues.append(f"Code contains potentially dangerous pattern: {pattern}")

        # Check for TODO comments (should be eliminated)
        if "TODO" in code or "# TODO" in code:
            issues.append(
                "Code contains TODO comments - all functionality must be implemented"
            )

        # Check for required function signatures
        if "def main():" not in code:
            issues.append("Code must contain a main() function")

        if 'if __name__ == "__main__":' not in code:
            issues.append("Code must contain if __name__ == '__main__': block")

        return len(issues) == 0, issues

    def get_validation_summary(self, **validations) -> Dict[str, Any]:
        """
        Generate a summary of all validation results

        Args:
            **validations: Named validation results as (is_valid, issues) tuples

        Returns:
            Validation summary dictionary
        """
        summary = {"overall_valid": True, "total_issues": 0, "validations": {}}

        for name, (is_valid, issues) in validations.items():
            summary["validations"][name] = {"valid": is_valid, "issues": issues}

            if not is_valid:
                summary["overall_valid"] = False
                summary["total_issues"] += len(issues)

        return summary
