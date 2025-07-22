import yaml
import os
import subprocess
import csv

def load_yaml(filepath):
    with open(filepath, 'r') as file:
        return yaml.safe_load(file)

def check_syntax(code, filename, tmp_dir="tmp"):
    os.makedirs(tmp_dir, exist_ok=True)
    file_path = os.path.join(tmp_dir, f"{filename}.sv")

    with open(file_path, "w") as f:
        f.write(code)

    try:
        result = subprocess.run(
            ["verilator", "--lint-only", file_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=10
        )
        return result.returncode == 0
    except subprocess.TimeoutExpired:
        return False

def evaluate_and_report(real_file, generated_file, report_path="verilog_eval_report.csv"):
    real = load_yaml(real_file)
    generated = load_yaml(generated_file)

    if isinstance(generated, list):
        generated = {"default_module": [item["code"] for item in generated if isinstance(item, dict) and "code" in item]}

    passed = 0
    total = 0
    report_rows = []

    for module, gens in generated.items():
        print(f"\nEvaluating module: {module}")
        total += 1
        module_pass = 0

        for i, code in enumerate(gens):
            code_name = f"{module}_{i}"
            success = check_syntax(code, code_name)
            score = 1 if success else 0
            status = "PASS" if success else "FAIL"

            report_rows.append({
                "module": module,
                "variant": i,
                "status": status,
                "score": score,
                "code": code.strip()
            })

            print(f"  Variant {i}: {status}")

            if success and module_pass == 0:
                passed += 1
                module_pass = 1  # Only count once for pass@1

    pass_at_1 = passed / total if total > 0 else 0
    print(f"\n✅ Overall pass@1: {pass_at_1:.3f} ({passed}/{total})")

    # Write report
    with open(report_path, "w", newline="") as csvfile:
        fieldnames = ["module", "variant", "status", "score", "code"]
        writer = csv.DictWriter(
            csvfile,
            fieldnames=fieldnames,
            quoting=csv.QUOTE_ALL,
            escapechar='\\',
            doublequote=True
        )
        writer.writeheader()
        writer.writerows(report_rows)

    print(f"\n📄 Report saved to: {report_path}")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--real", required=True, help="Path to real.yml")
    parser.add_argument("--generated", required=True, help="Path to generated.yml")
    parser.add_argument("--report", default="verilog_eval_report.csv", help="Path to save CSV report")
    args = parser.parse_args()

    evaluate_and_report(args.real, args.generated, args.report)
