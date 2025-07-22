from transformers import AutoTokenizer, AutoModelForCausalLM

try:
    tokenizer = AutoTokenizer.from_pretrained("biranchiauto/autovcoder-7b")
    model = AutoModelForCausalLM.from_pretrained("biranchiauto/autovcoder-7b", device_map="auto")
    print("AutoVcoder loaded")
except Exception as e:
    print("AutoVcoder not available. Will fallback to StarCoder.")