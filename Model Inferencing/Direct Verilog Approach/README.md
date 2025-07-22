# Verilog Code Generation Pass@k Evaluation

This repository contains scripts to evaluate generated Verilog code variants using **pass@k** metrics based on syntax checking with **Verilator**.

---

## Overview

- **pass@1**: Checks if at least one generated variant per real code compiles successfully.
- **pass@5** and **pass@10**: Evaluate groups of 5 or 10 generated variants per real code; group passes if any variant passes.
- Generates detailed CSV reports with per-variant pass/fail status and scores.

---

## Prerequisites

- Python 3.8 or higher
- [PyYAML](https://pyyaml.org/) (`pip install pyyaml`)
- [Verilator](https://verilator.org/) installed and available in your system PATH (`verilator --version`)

---

## Scripts

| Script                          | Description                                  |
|--------------------------------|----------------------------------------------|
| `evaluate_pass1.py`             | pass@1 evaluation script                      |
| `evaluate_passk_with_report.py`| pass@k (k=5 or 10) evaluation with CSV report|

---

## Usage

### pass@1

```bash
python3 evaluate_pass1.py --real simple_variations_gpt.yml --generated simple@1_variations.yml
python3 evaluate_pass1.py --real medium_variations_gpt.yml --generated medium@1_variations.yml
python3 evaluate_pass1.py --real complex_variations_gpt.yml --generated complex@1_variations.yml

### pass@5 or pass@10 with report

```bash
python3 evaluate_passk_with_report.py --real simple_variations_gpt.yml --generated simple@5_variations.yml --k 5 --report simple_pass5_report.csv
python3 evaluate_passk_with_report.py --real simple_variations_gpt.yml --generated simple@10_variations.yml --k 10 --report simple_pass10_report.csv

python3 evaluate_passk_with_report.py --real medium_variations_gpt.yml --generated medium@5_variations.yml --k 5 --report medium_pass5_report.csv
python3 evaluate_passk_with_report.py --real medium_variations_gpt.yml --generated medium@10_variations.yml --k 10 --report medium_pass10_report.csv

python3 evaluate_passk_with_report.py --real complex_variations_gpt.yml --generated complex@5_variations.yml --k 5 --report complex_pass5_report.csv
python3 evaluate_passk_with_report.py --real complex_variations_gpt.yml --generated complex@10_variations.yml --k 10 --report complex_pass10_report.csv