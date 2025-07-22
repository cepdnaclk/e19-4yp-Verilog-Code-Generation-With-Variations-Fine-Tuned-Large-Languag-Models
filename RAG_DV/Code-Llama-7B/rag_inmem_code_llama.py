# Load and Parse Dataset as Documents
import yaml
from llama_index.core import Document

def load_nested_yaml_entries(yaml_path):
    with open(yaml_path, 'r') as f:
        raw_entries = yaml.safe_load(f)

    documents = []

    for raw in raw_entries:
        raw_entry_str = raw["entry"]
        parsed_entry = yaml.safe_load(raw_entry_str)

        base_code = parsed_entry["base_code"].strip()
        prompt = parsed_entry["prompt"].strip()
        variation = parsed_entry["variation"].strip()

        input_text = f"base_code:\n{base_code}\n\nprompt:\n{prompt}"
        metadata = {"variation": variation}

        documents.append(Document(text=input_text, metadata=metadata))

    return documents

# Build the In-Memory Vector Index
from llama_index.core.settings import Settings
Settings.llm = None  # Disable OpenAI LLM fallback

from llama_index.embeddings.huggingface import HuggingFaceEmbedding
from llama_index.core import VectorStoreIndex

embed_model = HuggingFaceEmbedding(model_name="BAAI/bge-small-en")
documents = load_nested_yaml_entries("/tmp/expr_.02.yml")
index = VectorStoreIndex.from_documents(documents, embed_model=embed_model)
query_engine = index.as_query_engine(similarity_top_k=3)

# Load CodeLLaMA 7B Model (From HF Transformers)
from transformers import AutoTokenizer, AutoModelForCausalLM, pipeline
import torch

model_id = "codellama/CodeLlama-7b-hf"

tokenizer = AutoTokenizer.from_pretrained(model_id)
model = AutoModelForCausalLM.from_pretrained(
    model_id,
    torch_dtype=torch.float16,
    # device_map="auto",  # Automatically uses GPU if available
    trust_remote_code=True
) 

generator = pipeline(
    "text-generation",
    model=model,
    tokenizer=tokenizer,
    device=0  # GPU (use -1 for CPU)
)

# Format the Few-Shot Prompt
def format_prompt(retrieved_docs, base_code, prompt):
    examples = "\n\n".join([
        f"### Example:\nbase_code:\n{doc.text.split('prompt:')[0].strip()}\n"
        f"prompt:\n{doc.text.split('prompt:')[1].strip()}\n"
        f"variation:\n{doc.metadata['variation']}"
        for doc in retrieved_docs
    ])

    final_prompt = f"""{examples}

### Now generate the variation for the following:

base_code:
{base_code}

prompt:
{prompt}

variation:"""

    return final_prompt

# Query the RAG System and Generate with CodeLLaMA
def generate_variation(base_code, prompt):
    query_text = f"base_code:\n{base_code}\n\nprompt:\n{prompt}"
    retrieved_docs = query_engine.retrieve(query_text)
    
    llm_prompt = format_prompt(retrieved_docs, base_code, prompt)

    output = generator(
        llm_prompt,
        max_new_tokens=512,
        temperature=0.4,
        do_sample=True,
        pad_token_id=tokenizer.eos_token_id
    )[0]["generated_text"]

    # Extract the generated variation after the last 'variation:' marker
    variation = output.split("variation:")[-1].strip()
    return variation

# === Example Usage ===
base_code = """
module my_ff(input clk, input rst, input d, output reg q);
always @(posedge clk) begin
    if (rst) q <= 0;
    else q <= d;
end
endmodule
"""

prompt = "Modify it to use an inside operator to check if `d` is in a predefined range."

variation = generate_variation(base_code, prompt)
print("🔧 Generated Variation:\n", variation)
