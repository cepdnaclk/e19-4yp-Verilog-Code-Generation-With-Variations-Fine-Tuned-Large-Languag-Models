import yaml
import os
import subprocess

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

def evaluate_pass1(real_file, generated_file):
    real = load_yaml(real_file)
    generated = load_yaml(generated_file)

    passed = 0
    total = 0

    for module, gens in generated.items():
        print(f"Evaluating {module}...")
        total += 1
        for i, code in enumerate(gens):
            if check_syntax(code, f"{module}_{i}"):
                passed += 1
                break
    pass_at_1 = passed / total if total > 0 else 0
    print(f"\n✅ pass@1: {pass_at_1:.3f} ({passed}/{total})")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--real", required=True, help="Path to real.yml")
    parser.add_argument("--generated", required=True, help="Path to generated.yml")
    args = parser.parse_args()

    evaluate_pass1(args.real, args.generated)
