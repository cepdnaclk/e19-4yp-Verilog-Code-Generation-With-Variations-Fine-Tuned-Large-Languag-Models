import yaml
from transformers import pipeline, AutoModelForCausalLM, AutoTokenizer
import torch

# === CONFIG ===
code_file = "/tmp/complex_codes.yml"
prompt_file = "/tmp/complex_prompts.yml"
output_file = "/tmp/complex@5_variations.yml"
num_variations_per_prompt = 5

# === LOAD MODEL ===
model_name = "Bin12345/AutoCoder_S_6.7B"

tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)

model = AutoModelForCausalLM.from_pretrained(
    model_name,
    torch_dtype=torch.float16,
    trust_remote_code=True
).to("cuda")

print("✅ Using AutoCoder 6.7B Base")

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
outputs = []

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
        outputs.append({"code": variation})
        print(f"✅ [{i+1}/{len(batch_prompts)}] Variation {j+1}/{num_variations_per_prompt} generated")

# === SAVE OUTPUTS WITH BLOCK STYLE ===
def str_presenter(dumper, data):
    if '\n' in data:
        return dumper.represent_scalar('tag:yaml.org,2002:str', data, style='|')
    return dumper.represent_scalar('tag:yaml.org,2002:str', data)

yaml.add_representer(str, str_presenter)

with open(output_file, "w") as f:
    yaml.dump(outputs, f, sort_keys=False)

print(f"\n✅ All {len(outputs)} variations saved to {output_file}")