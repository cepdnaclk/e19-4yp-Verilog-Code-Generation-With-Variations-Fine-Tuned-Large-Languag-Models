import yaml
from transformers import pipeline, AutoModelForCausalLM, AutoTokenizer
import torch

# === CONFIG ===
code_file = "/tmp/simple_codes.yml"
prompt_file = "/tmp/simple_prompts.yml"
output_file = "/tmp/simple@1_variations.yml"

# === LOAD MODEL ===

tokenizer = AutoTokenizer.from_pretrained("bigcode/starcoder2-3b")
model = AutoModelForCausalLM.from_pretrained("bigcode/starcoder2-3b", torch_dtype=torch.float16)
print("Using StarCoder")

generator = pipeline("text-generation", model=model, tokenizer=tokenizer, device=0)

# === LOAD INPUT DATA ===
with open(code_file, "r") as f:
    codes = yaml.safe_load(f)

with open(prompt_file, "r") as f:
    prompts = yaml.safe_load(f)

assert len(codes) == len(prompts), "Code and prompt counts do not match!"

# === GENERATE VARIATIONS ===
outputs = []
for i, (code_entry, prompt_entry) in enumerate(zip(codes, prompts)):
    base_code = code_entry['code'].strip()
    prompt = prompt_entry['prompt'].strip()
    
    full_prompt = f"### Base Verilog Code:\n{base_code}\n### Variation Instruction:\n{prompt}\n### Modified Code:\n"
    
    response = generator(full_prompt, max_new_tokens=2048, do_sample=True, temperature=0.8)[0]['generated_text']
    variation = response.split("### Modified Code:\n")[-1].strip()
    
    outputs.append({"code": variation})
    print(f"✅ [{i+1}/{len(codes)}] Generated variation.")

# === SAVE OUTPUTS WITH BLOCK STYLE ===
def str_presenter(dumper, data):
    if '\n' in data:  # use | style for multi-line strings
        return dumper.represent_scalar('tag:yaml.org,2002:str', data, style='|')
    return dumper.represent_scalar('tag:yaml.org,2002:str', data)

yaml.add_representer(str, str_presenter)

with open(output_file, "w") as f:
    yaml.dump(outputs, f, sort_keys=False)

print(f"\n✅ All variations saved to {output_file}")