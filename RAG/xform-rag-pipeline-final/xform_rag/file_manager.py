#!/usr/bin/env python3
"""
File management for the Xform RAG Pipeline
Handles saving generated transformations and metadata
"""

import json
import logging
from pathlib import Path
from typing import Dict, Any, List
from datetime import datetime

from .config import RAGConfig


class FileManager:
    """Manages file operations for generated transformations"""

    def __init__(self, config: RAGConfig):
        self.config = config
        self.logger = logging.getLogger(__name__)

        # Ensure output directory exists
        self.config.output_dir.mkdir(parents=True, exist_ok=True)

    def save_generated_xform(self, result: Dict[str, Any]) -> bool:
        """Save generated transformation to file"""
        if "error" in result:
            self.logger.error(f"Cannot save xform with error: {result['error']}")
            return False

        try:
            # Save the Python file
            success = self._save_python_file(result)
            if not success:
                return False

            # Save metadata
            success = self._save_metadata(result)
            if not success:
                return False

            self.logger.info(f"Saved generated xform: {result['filename']}")
            return True

        except Exception as e:
            self.logger.error(f"Error saving generated xform: {e}")
            return False

    def _save_python_file(self, result: Dict[str, Any]) -> bool:
        """Save the Python code file"""
        try:
            file_path = self.config.output_dir / result["filename"]

            # Check if file already exists
            if file_path.exists():
                backup_path = self._create_backup(file_path)
                self.logger.info(f"Existing file backed up to: {backup_path}")

            # Write the new file
            with open(file_path, "w", encoding="utf-8") as f:
                f.write(result["code"])

            # Make file executable
            file_path.chmod(0o755)

            return True

        except Exception as e:
            self.logger.error(f"Error saving Python file: {e}")
            return False

    def _save_metadata(self, result: Dict[str, Any]) -> bool:
        """Save metadata for the generated transformation"""
        try:
            metadata_path = (
                self.config.output_dir / f"{result['filename']}.metadata.json"
            )

            metadata = {
                "filename": result["filename"],
                "user_request": result["user_request"],
                "registry_entry": result.get("registry_entry", ""),
                "source_documents": result.get("source_documents", []),
                "generation_timestamp": datetime.now().isoformat(),
                "config": {
                    "model_type": self.config.model_type,
                    "model_name": self.config.model_name,
                    "embedding_model": self.config.embedding_model,
                },
            }

            with open(metadata_path, "w", encoding="utf-8") as f:
                json.dump(metadata, f, indent=2, ensure_ascii=False)

            return True

        except Exception as e:
            self.logger.error(f"Error saving metadata: {e}")
            return False

    def _create_backup(self, file_path: Path) -> Path:
        """Create a backup of an existing file"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_path = file_path.with_suffix(f".{timestamp}.backup")

        with open(file_path, "r", encoding="utf-8") as src:
            with open(backup_path, "w", encoding="utf-8") as dst:
                dst.write(src.read())

        return backup_path

    def list_generated_files(self) -> List[Dict[str, Any]]:
        """List all generated transformation files"""
        generated_files = []

        for py_file in self.config.output_dir.glob("*.py"):
            file_info = {
                "filename": py_file.name,
                "size": py_file.stat().st_size,
                "created": datetime.fromtimestamp(py_file.stat().st_ctime).isoformat(),
                "modified": datetime.fromtimestamp(py_file.stat().st_mtime).isoformat(),
                "has_metadata": False,
                "metadata": {},
            }

            # Check for metadata file
            metadata_path = self.config.output_dir / f"{py_file.name}.metadata.json"
            if metadata_path.exists():
                file_info["has_metadata"] = True
                try:
                    with open(metadata_path, "r", encoding="utf-8") as f:
                        file_info["metadata"] = json.load(f)
                except Exception as e:
                    self.logger.warning(
                        f"Error reading metadata for {py_file.name}: {e}"
                    )

            generated_files.append(file_info)

        # Sort by creation time, newest first
        generated_files.sort(key=lambda x: x["created"], reverse=True)

        return generated_files

    def get_generation_stats(self) -> Dict[str, Any]:
        """Get statistics about generated files"""
        files = self.list_generated_files()

        total_size = sum(f["size"] for f in files)
        with_metadata = sum(1 for f in files if f["has_metadata"])

        # Count by model type
        model_counts = {}
        for f in files:
            if f["has_metadata"]:
                model_type = (
                    f["metadata"].get("config", {}).get("model_type", "unknown")
                )
                model_counts[model_type] = model_counts.get(model_type, 0) + 1

        return {
            "total_files": len(files),
            "total_size_bytes": total_size,
            "files_with_metadata": with_metadata,
            "output_directory": str(self.config.output_dir),
            "model_breakdown": model_counts,
            "latest_generation": files[0]["created"] if files else None,
        }

    def validate_generated_file(self, filename: str) -> Dict[str, Any]:
        """Validate a specific generated file"""
        file_path = self.config.output_dir / filename

        if not file_path.exists():
            return {"error": f"File {filename} not found"}

        validation_result = {
            "filename": filename,
            "exists": True,
            "size": file_path.stat().st_size,
            "is_executable": file_path.stat().st_mode & 0o111 != 0,
            "syntax_valid": False,
            "encoding_valid": False,
        }

        # Check file encoding
        try:
            content = file_path.read_text(encoding="utf-8")
            validation_result["encoding_valid"] = True

            # Check Python syntax
            compile(content, str(file_path), "exec")
            validation_result["syntax_valid"] = True

        except UnicodeDecodeError:
            validation_result["error"] = "Invalid UTF-8 encoding"
        except SyntaxError as e:
            validation_result["syntax_error"] = f"Line {e.lineno}: {e.msg}"
        except Exception as e:
            validation_result["error"] = str(e)

        return validation_result

    def cleanup_old_files(self, days: int = 30) -> int:
        """Clean up old generated files and backups"""
        cutoff_time = datetime.now().timestamp() - (days * 24 * 60 * 60)
        removed_count = 0

        # Clean up backup files
        for backup_file in self.config.output_dir.glob("*.backup"):
            if backup_file.stat().st_ctime < cutoff_time:
                try:
                    backup_file.unlink()
                    removed_count += 1
                    self.logger.info(f"Removed old backup: {backup_file.name}")
                except Exception as e:
                    self.logger.warning(f"Could not remove {backup_file.name}: {e}")

        return removed_count

    def export_metadata(self, output_file: str = None) -> str:
        """Export all metadata to a single JSON file"""
        if output_file is None:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            output_file = f"metadata_export_{timestamp}.json"

        export_path = self.config.output_dir / output_file
        files = self.list_generated_files()

        export_data = {
            "export_timestamp": datetime.now().isoformat(),
            "total_files": len(files),
            "files": files,
            "config": self.config.to_dict(),
        }

        with open(export_path, "w", encoding="utf-8") as f:
            json.dump(export_data, f, indent=2, ensure_ascii=False)

        self.logger.info(f"Metadata exported to: {export_path}")
        return str(export_path)
