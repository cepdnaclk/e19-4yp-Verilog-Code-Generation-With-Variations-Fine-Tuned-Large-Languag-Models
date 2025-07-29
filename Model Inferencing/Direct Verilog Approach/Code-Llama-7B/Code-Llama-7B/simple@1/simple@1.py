import torch
from transformers import pipeline, AutoModelForCausalLM, AutoTokenizer
import yaml

# === CONFIG ===
code_file = "/tmp/simple_codes.yml"
prompt_file = "/tmp/simple_prompts.yml"
output_file = "/tmp/simple@1_variations.yml"
num_variations_per_prompt = 1

# === LOAD CODELLAMA MODEL ===
model_name = "codellama/CodeLlama-7b-hf"

tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(
    model_name,
    torch_dtype=torch.float16,
).eval()

print("✅ Using CodeLLaMA 7B")

generator = pipeline("text-generation", model=model, tokenizer=tokenizer, device=0)

# === LOAD INPUT DATA ===
with open(code_file, "r") as f:
    codes = yaml.safe_load(f)

with open(prompt_file, "r") as f:
    prompts = yaml.safe_load(f)

assert len(codes) == len(prompts), "❌ Code and prompt counts do not match!"

# === BUILD PROMPT BATCH ===
batch_prompts = [
    f"### Base Verilog Code:\n{c['code'].strip()}\n### Variation Instruction:\n{p['prompt'].strip()}\n### Modified Code:\n"
    for c, p in zip(codes, prompts)
]

# === RUN MULTIPLE VARIATIONS PER PROMPT ===
variations = []

for i, prompt in enumerate(batch_prompts):
    responses = generator(
        prompt,
        max_new_tokens=512,
        do_sample=True,
        temperature=0.8,
        num_return_sequences=num_variations_per_prompt
    )
    for j, resp in enumerate(responses):
        response = resp['generated_text']
        variation = response.split("### Modified Code:\n")[-1].strip()
        variations.append({"code": variation})
        print(f"✅ [{i+1}/{len(batch_prompts)}] Variation {j+1}/{num_variations_per_prompt} generated")

# === WRITE VARIATIONS TO YAML MANUALLY ===
with open(output_file, "w", encoding="utf-8") as out:
    for v in variations:
        out.write("- code: |-\n")
        out.write("    " + "\n    ".join(v["code"].strip().splitlines()) + "\n\n")

print(f"\n✅ All {len(variations)} variations saved to {output_file}")