import yaml
import subprocess
import tempfile
from pathlib import Path

# === CONFIG ===
input_files = [
    "/tmp/simple@1_variations_gpt.yml",
    "/tmp/medium@1_variations_gpt.yml",
    "/tmp/complex@1_variations_gpt.yml"
]

results = []

for file in input_files:
    with open(file, "r") as f:
        codes = yaml.safe_load(f)

    for i, item in enumerate(codes):
        code = item["code"]
        # Create a temporary .sv file for each code block
        with tempfile.NamedTemporaryFile(delete=False, suffix=".sv", mode="w") as tmp_file:
            tmp_file.write(code)
            tmp_file_path = Path(tmp_file.name)

        # Run verilator lint check
        try:
            result = subprocess.run(
                ["verilator", "--lint-only", tmp_file_path],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                timeout=10
            )
            passed = result.returncode == 0
            results.append({
                "file": file,
                "index": i,
                "passed": passed,
                "stdout": result.stdout.decode(),
                "stderr": result.stderr.decode()
            })
        except subprocess.TimeoutExpired:
            results.append({
                "file": file,
                "index": i,
                "passed": False,
                "stderr": "❌ Timeout while linting",
                "stdout": ""
            })

        # Clean up temp file
        tmp_file_path.unlink()

# === REPORT ===
total = len(results)
passed = sum(1 for r in results if r["passed"])
failed = total - passed

print(f"\n✅ Verilator Validation Summary:")
print(f"Total Files Checked: {total}")
print(f"Passed: {passed}")
print(f"Failed: {failed}\n")

for r in results:
    status = "✅ PASS" if r["passed"] else "❌ FAIL"
    print(f"{status} — {r['file']} [index {r['index']}]")
    if not r["passed"]:
        print(r["stderr"].strip())
        print()