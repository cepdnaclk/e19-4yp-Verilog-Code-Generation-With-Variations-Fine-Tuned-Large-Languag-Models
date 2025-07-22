import yaml
import os
import subprocess
import csv

def load_yaml(filepath):
    with open(filepath, 'r') as f:
        return yaml.safe_load(f)

def check_syntax(code, filename, tmp_dir="tmp"):
    os.makedirs(tmp_dir, exist_ok=True)
    path = os.path.join(tmp_dir, f"{filename}.sv")
    with open(path, "w") as f:
        f.write(code)
    try:
        result = subprocess.run(
            ["verilator", "--lint-only", path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=10,
        )
        return result.returncode == 0
    except subprocess.TimeoutExpired:
        return False

def evaluate_pass_k_and_report(real_file, generated_file, k, report_file="verilog_passk_report.csv"):
    real = load_yaml(real_file)
    generated = load_yaml(generated_file)

    # flatten if generated is list of dicts with 'code'
    if isinstance(generated, list) and isinstance(generated[0], dict) and "code" in generated[0]:
        generated = [item["code"] for item in generated]

    # support real as list or dict
    if isinstance(real, dict):
        n_real = len(real.keys())
    elif isinstance(real, list):
        n_real = len(real)
    else:
        raise ValueError("Real YAML must be dict or list")

    n_generated = len(generated)
    assert n_generated == n_real * k, f"Generated count {n_generated} != real count {n_real} * k {k}"

    passes = 0
    total = n_real

    report_rows = []

    for i in range(n_real):
        group_codes = generated[i*k:(i+1)*k]
        group_pass = False

        for j, code in enumerate(group_codes):
            passed = check_syntax(code, f"group{i}_var{j}")
            status = "PASS" if passed else "FAIL"
            score = 1 if passed else 0

            report_rows.append({
                "group": i,
                "variant": j,
                "status": status,
                "score": score,
                "code": code.strip().replace("\n", "\\n")
            })

            if passed:
                group_pass = True

        print(f"Group {i}: {'PASS' if group_pass else 'FAIL'}")
        if group_pass:
            passes += 1

    pass_at_k = passes / total if total > 0 else 0
    print(f"\n✅ pass@{k}: {pass_at_k:.3f} ({passes}/{total})")

    # write CSV report with quoting and escaping
    with open(report_file, "w", newline="") as csvfile:
        fieldnames = ["group", "variant", "status", "score", "code"]
        writer = csv.DictWriter(
            csvfile,
            fieldnames=fieldnames,
            quoting=csv.QUOTE_ALL,
            escapechar='\\',
            doublequote=True
        )
        writer.writeheader()
        writer.writerows(report_rows)

    print(f"📄 Report saved to: {report_file}")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Evaluate pass@k for generated verilog code with report")
    parser.add_argument("--real", required=True, help="Path to real YAML file")
    parser.add_argument("--generated", required=True, help="Path to generated YAML file")
    parser.add_argument("--k", type=int, required=True, help="Value of k for pass@k")
    parser.add_argument("--report", default="verilog_passk_report.csv", help="CSV report file path")
    args = parser.parse_args()

    evaluate_pass_k_and_report(args.real, args.generated, args.k, args.report)
