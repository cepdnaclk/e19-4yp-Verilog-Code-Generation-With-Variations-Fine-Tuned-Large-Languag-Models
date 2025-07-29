import yaml
import difflib
import os
from datetime import datetime

def load_yaml_file(file_path):
    """Load and parse a YAML file."""
    try:
        with open(file_path, 'r') as file:
            return yaml.safe_load(file)
    except Exception as e:
        print(f"Error loading {file_path}: {e}")
        return None

def normalize_code(code):
    """Normalize Verilog code by removing extra whitespace and comments."""
    if not code:
        return ""
    # Split into lines, strip whitespace, remove empty lines and comments
    lines = [line.strip() for line in code.split('\n') if line.strip() and not line.strip().startswith('//')]
    return '\n'.join(lines)

def compare_codes(generated, ground_truth):
    """Compare generated and ground truth Verilog codes for exact match."""
    norm_generated = normalize_code(generated)
    norm_ground_truth = normalize_code(ground_truth)
    return norm_generated == norm_ground_truth

def calculate_pass_at_1(generated_codes, ground_truth_codes):
    """Calculate pass@1 for each code pair and overall."""
    results = []
    total_problems = 0
    passed_problems = 0

    # Compare codes by index
    min_length = min(len(generated_codes), len(ground_truth_codes))
    
    for i in range(min_length):
        total_problems += 1
        generated_code = generated_codes[i].get('code', '')
        ground_truth_code = ground_truth_codes[i].get('code', '')
        is_pass = compare_codes(generated_code, ground_truth_code)
        if is_pass:
            passed_problems += 1
        results.append({
            'index': i,
            'pass': is_pass,
            'generated_code': generated_code,
            'ground_truth_code': ground_truth_code
        })

    pass_at_1_rate = (passed_problems / total_problems * 100) if total_problems > 0 else 0
    return results, pass_at_1_rate

def generate_report(results, pass_at_1_rate):
    """Generate a detailed report of the comparison results."""
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    report = [f"Verilog Code Comparison Report - {timestamp}\n"]
    report.append("=" * 50 + "\n")
    report.append(f"Total Problems Compared: {len(results)}")
    report.append(f"Overall Pass@1 Rate: {pass_at_1_rate:.2f}%")
    report.append("\nDetailed Results:\n")

    for result in results:
        report.append(f"Code Index: {result['index']}")
        report.append(f"Pass: {'Yes' if result['pass'] else 'No'}")
        if not result['pass']:
            report.append("Differences:")
            diff = difflib.unified_diff(
                result['ground_truth_code'].splitlines(),
                result['generated_code'].splitlines(),
                fromfile='ground_truth',
                tofile='generated',
                lineterm=''
            )
            report.extend(diff)
        report.append("\n" + "-" * 50 + "\n")

    return '\n'.join(report)

def main():
    # File paths for the YAML files
    generated_file = "code_llama@1.yml"
    ground_truth_file = "variation.yml"

    # Load YAML files
    generated_codes = load_yaml_file(generated_file)
    ground_truth_codes = load_yaml_file(ground_truth_file)

    if not generated_codes or not ground_truth_codes:
        print("Failed to load one or both YAML files. Exiting.")
        return

    # Calculate pass@1 and get results
    results, pass_at_1_rate = calculate_pass_at_1(generated_codes, ground_truth_codes)

    # Generate and save report
    report = generate_report(results, pass_at_1_rate)
    report_file = f"verilog_comparison_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
    
    with open(report_file, 'w') as f:
        f.write(report)
    
    print(f"Report generated: {report_file}")
    print(f"Overall Pass@1 Rate: {pass_at_1_rate:.2f}%")

if __name__ == "__main__":
    main()


#python3 compare_verilog_list.py