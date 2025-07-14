# Xform Evaluation Script

This repository contains a Python script (`evaluate_xform.py`) for evaluating xform transformation code used in Verilog/SystemVerilog transformations. The script performs a static analysis of any provided xform code (e.g., `reg_to_wire.py`) to assess its quality based on multiple metrics, such as syntactic correctness, semantic correctness, framework compliance, code style, robustness, maintainability, and innovation. The evaluation is designed to work with any xform code that follows the standard xform framework patterns (using PyVerilog, visitor class, regex transformations, etc.).

## What the Evaluation Script Does

The `evaluate_xform.py` script evaluates a provided xform transformation code file by:

1. **Loading the Xform Code**:
   - Reads the specified Python xform code file (e.g., `reg_to_wire.py`).

2. **Creating a Task Specification**:
   - Generates a generic task specification with a user-defined task name and complexity level (simple, medium, complex, or novel), ensuring compatibility with any xform code.

3. **Scoring the Code**:
   - Evaluates the code based on the following metrics, derived from the original xform evaluation framework:
     - **Syntactic Correctness** (10%): Checks if the code is valid Python syntax.
     - **Semantic Correctness** (15%): Verifies the presence of expected patterns (e.g., PyVerilog imports, visitor method, regex usage).
     - **Functional Correctness** (15%): Placeholder score (0.5), as dynamic testing is not performed.
     - **Framework Compliance** (20%): Ensures adherence to xform framework patterns (visitor class, transform function, error handling, etc.).
     - **Code Style** (10%): Assesses documentation, comments, and line length.
     - **Robustness** (10%): Checks for error handling and file existence validation.
     - **Maintainability** (10%): Evaluates function count, class usage, and variable naming.
     - **Innovation** (10%): Measures advanced features (e.g., enums, caching), with higher expectations for complex/novel tasks.

4. **Calculating Overall Score**:
   - Computes a weighted overall score (0.0 to 1.0) based on the metrics.
   - Determines PASS/FAIL status using a threshold of 0.6 for simple/medium tasks or 0.5 for complex/novel tasks.

5. **Saving Results**:
   - Saves detailed results in JSON format (`<task_name>_evaluation_result.json`) and a human-readable report in Markdown format (`<task_name>_evaluation_report.md`) in the specified output directory.

## Prerequisites

To run the evaluation script, ensure the following requirements are met:

1. **Python 3**:
   - The script requires Python 3 (verified by the shebang `#!/usr/bin/env python3`).
   - Install Python 3 if not already present:
   - 
     python3 --version
     
     Download from [python.org](https://www.python.org/downloads/) if needed.

2. **PyVerilog Package**:
   - The script uses the `pyverilog` package to check for Verilog-related patterns.
   - Install it using pip:
   
     pip install pyverilog
     

3. **Repository Structure**:
   - Place the xform code file (e.g., `reg_to_wire.py`) and the evaluation script (`evaluate_xform.py`) in your local repository folder.
   - Example structure:
     
     your_repo_folder/
     ├── reg_to_wire.py
     ├── evaluate_xform.py
     ├── xform_evaluation_results/  (created during evaluation)
     

4. **No Additional Dependencies**:
   - The script is standalone and does not require Ollama or the full `ComprehensiveXformEvaluator` framework.
   - No sample Verilog file (e.g., `test_simple.v`) is needed, as the evaluation is static (analyzes code structure, not execution).

## How to Run the Script

Follow these steps to evaluate an xform code file:

1. **Navigate to Your Repository Folder**:
   - Open a terminal and change to your repository directory:
     
     cd /path/to/your_repo_folder
     

2. **Ensure the Xform Code File Exists**:
   - Save the xform code you want to evaluate (e.g., `reg_to_wire.py`) in the repository folder.
   - The script works with any xform code that follows standard patterns (PyVerilog, visitor class, regex transformations, etc.).

3. **Run the Evaluation Script**:
   - Use the following command to evaluate the xform code, specifying the task name and complexity:
     
     python evaluate_xform.py --xform-file <xform_file> --task-name <task_name> --complexity <complexity> --output-dir <output_dir>
     
   - Example for `reg_to_wire.py`:
     
     python evaluate_xform.py --xform-file reg_to_wire.py --task-name reg_to_wire --complexity simple --output-dir xform_evaluation_results
     
   - Example for another xform code (e.g., `fsm_rename.py`):
     
     python evaluate_xform.py --xform-file fsm_rename.py --task-name fsm_state_rename --complexity complex --output-dir xform_evaluation_results
   

4. **Command-Line Arguments**:
   - `--xform-file` (required): Path to the xform code file to evaluate (e.g., `reg_to_wire.py`).
   - `--task-name` (required): Name of the task (e.g., `reg_to_wire`, `fsm_state_rename`). Used for naming output files and reporting.
   - `--complexity` (optional): Complexity level of the task (`simple`, `medium`, `complex`, or `novel`). Default: `simple`.
     - Affects the pass threshold (0.6 for simple/medium, 0.5 for complex/novel) and innovation scoring.
   - `--output-dir` (optional): Directory to save evaluation results. Default: `xform_evaluation_results`.

5. **Expected Output**:
   - The script will print a summary to the terminal, e.g.:
     
     🚀 Evaluating xform: reg_to_wire.py (Task: reg_to_wire, Complexity: simple)

     === EVALUATION SUMMARY ===
     Task: reg_to_wire
     Xform File: reg_to_wire.py
     Complexity: simple
     Status: PASS
     Overall Score: 0.750
     Results saved to: xform_evaluation_results/
     View report: xform_evaluation_results/reg_to_wire_evaluation_report.md
     

## Output Files

Results are saved in the specified output directory (e.g., `xform_evaluation_results/`):

1. **JSON File** (`<task_name>_evaluation_result.json`):
   - Contains detailed evaluation data, including task name, xform file, complexity, success status, overall score, individual metric scores, errors, and execution time.

2. **Markdown Report** (`<task_name>_evaluation_report.md`):
   - A human-readable report with:
     - Task name, xform file, complexity, and status (PASS/FAIL).
     - Overall score and execution time (0.0 for static analysis).
     - Scores for each metric (e.g., syntactic correctness, semantic correctness).
     - Any errors encountered.
   - Example content for `reg_to_wire.py`:
     ```
     # Xform Evaluation Report

     ## Task: reg_to_wire
     - **Xform File**: reg_to_wire.py
     - **Complexity**: simple
     - **Status**: PASS
     - **Overall Score**: 0.750
     - **Execution Time**: 0.00s

     ## Scores by Metric
     - **Syntactic Correctness**: 1.000
     - **Semantic Correctness**: 0.800
     - **Functional Correctness**: 0.500
     - **Framework Compliance**: 0.833
     - **Code Style**: 0.800
     - **Robustness**: 0.700
     - **Maintainability**: 0.600
     - **Innovation**: 0.500
     ```

## Troubleshooting

1. **File Not Found**:
   - Error: `❌ Failed to load xform code: [Errno 2] No such file or directory: 'reg_to_wire.py'`
   - Solution: Ensure the `--xform-file` path is correct and the file exists in the repository folder.

2. **Missing Task Name**:
   - Error: `error: the following arguments are required: --task-name`
   - Solution: Provide a `--task-name` argument (e.g., `--task-name reg_to_wire`).

3. **Syntax Errors in Xform Code**:
   - If the xform code has syntax issues, the report will show a 0.0 score for syntactic correctness and list the error in the errors section.

4. **Low Scores**:
   - Check `<task_name>_evaluation_report.md` for specific errors (e.g., “Missing visitor class” or “Missing regex transformations”).
   - Modify the xform code to include expected patterns (e.g., visitor class, regex, error handling) to improve scores.

## Notes

- **Static Evaluation**: The script performs static analysis of the xform code, checking for structure and patterns. Functional correctness is a placeholder (0.5), as no dynamic execution is performed.
- **Flexibility**: The script is designed to evaluate any xform code by specifying the task name and complexity via command-line arguments, eliminating the need to modify the script for each xform.
- **Complexity Impact**:
  - Simple/medium tasks: Pass threshold is 0.6, with lower innovation expectations.
  - Complex/novel tasks: Pass threshold is 0.5, with higher innovation expectations (e.g., rewards for enums, caching).
- **Extensibility**: To add dynamic testing (e.g., running the xform on a Verilog file), extend the script with a sample Verilog file and output validation logic.