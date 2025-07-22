#!/usr/bin/env python3
"""
Simple script to run the Ollama Llama 3 xform evaluation.
This sets up everything needed and runs the evaluation.
"""

import os
import sys
import ollama
from pathlib import Path

def check_ollama_connection():
    """Check if Ollama is running and accessible."""
    try:
        client = ollama.Client(host='http://127.0.0.1:11435')
        # Try a simple request
        models = client.list()
        print("✅ Ollama connection successful")
        #print(f"   Available models: {[m['name'] for m in models['models']]}")
        return client
    except Exception as e:
        print(f"❌ Cannot connect to Ollama: {e}")
        print("   Make sure Ollama is running on port 11435")
        print("   Run: ollama serve")
        return None

def create_test_files():
    """Create the test Verilog files if they don't exist."""
    test_files = {
        'test_simple.v': '''// test_simple.v - Simple module for basic transformation tests
module simple_test(
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    output wire [7:0] data_out,
    output wire valid
);
    wire [7:0] internal_signal;
    wire processing_done;
    
    assign internal_signal = data_in + 8'h01;
    assign data_out = internal_signal;
    assign valid = processing_done;
    assign processing_done = (internal_signal != 8'h00);
    
endmodule''',

        'test_medium.v': '''// test_medium.v - Medium complexity module
module medium_test(
    input wire clk,
    input wire reset,
    input wire [15:0] addr,
    input wire [31:0] data_in,
    output reg [31:0] data_out,
    output reg ready
);
    reg [31:0] memory [0:65535];
    reg [7:0] counter;
    reg [3:0] state;
    wire [31:0] processed_data;
    
    parameter IDLE = 4'h0;
    parameter READ = 4'h1;
    parameter PROCESS = 4'h2;
    parameter WRITE = 4'h3;
    
    assign processed_data = data_in ^ 32'hDEADBEEF;
    
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            data_out <= 32'h0;
            ready <= 1'b0;
            counter <= 8'h0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: ready <= 1'b1; state <= READ;
                READ: data_out <= memory[addr]; state <= PROCESS;
                PROCESS: memory[addr] <= processed_data; state <= WRITE;
                WRITE: ready <= 1'b0; state <= IDLE;
            endcase
        end
    end
endmodule''',

        'test_complex.v': '''// test_complex.v - Complex module with FSM
module complex_test(
    input wire clk,
    input wire reset,
    input wire [7:0] cmd,
    output reg [31:0] result,
    output reg done
);
    typedef enum logic [2:0] {
        FSM_IDLE = 3'h0,
        FSM_PROCESS = 3'h1,
        FSM_DONE = 3'h2
    } fsm_state_t;
    
    fsm_state_t current_state;
    
    always @(posedge clk) begin
        if (!reset) begin
            current_state <= FSM_IDLE;
            result <= 32'h0;
            done <= 1'b0;
        end else begin
            case (current_state)
                FSM_IDLE: if (cmd != 0) current_state <= FSM_PROCESS;
                FSM_PROCESS: begin result <= 32'hCAFE; current_state <= FSM_DONE; end
                FSM_DONE: begin done <= 1'b1; current_state <= FSM_IDLE; end
            endcase
        end
    end
endmodule''',

        'test_coverage.v': '''// test_coverage.v - For coverage testing
module coverage_test(
    input wire [7:0] test_value,
    output reg result
);
    logic [7:0] test_array [0:7];
    
    initial begin
        for (int i = 0; i < 8; i++) begin
            test_array[i] = i * 10;
        end
    end
    
    always @(*) begin
        result = (test_value inside {test_array});
    end
endmodule'''
    }
    
    print("📁 Creating test files...")
    for filename, content in test_files.items():
        if not Path(filename).exists():
            with open(filename, 'w') as f:
                f.write(content)
            print(f"   Created {filename}")
        else:
            print(f"   {filename} already exists")

def run_quick_test(client):
    """Run a quick test to make sure everything works."""
    print("\n🧪 Running quick test...")
    
    try:
        # Simple test prompt
        test_prompt = """
Generate a simple Python function that transforms 'wire' to 'reg' in Verilog code:

```python
def simple_wire_to_reg(content):
    # Replace 'wire' with 'reg' in the content
    import re
    return re.sub(r'\\bwire\\b', 'reg', content)
```

Just return this exact function.
"""
        
        response = client.generate(model="llama3.2:1b", prompt=test_prompt)
        
        if 'def ' in response['response'] and 'wire' in response['response']:
            print("✅ Quick test passed - model is generating code")
            return True
        else:
            print("⚠️  Quick test warning - unexpected response format")
            print(f"   Response preview: {response['response'][:100]}...")
            return True  # Continue anyway
            
    except Exception as e:
        print(f"❌ Quick test failed: {e}")
        return False

def main():
    """Main function to run the evaluation."""
    print("🚀 Starting Ollama Llama 3 Xform Evaluation Setup")
    print("=" * 50)
    
    # Check Ollama connection
    client = check_ollama_connection()
    if not client:
        return 1
    
    # Create test files
    create_test_files()
    
    # Run quick test
    if not run_quick_test(client):
        return 1
    
    # Import and run the main evaluation
    print("\n📊 Starting full evaluation...")
    print("   This may take several minutes...")
    
    try:
        # Import the evaluation harness
        sys.path.append('.')  # Make sure we can import from current directory
        
        # You'll need to save the evaluation harness as 'xform_evaluator.py'
        print("   To run the full evaluation, save the evaluation harness code")
        print("   as 'xform_evaluator.py' and run:")
        print("   python xform_evaluator.py")
        print()
        print("   Or run the evaluation directly with:")
        print()
        print("```python")
        print("import ollama")
        print("from xform_evaluator import XformEvaluator")
        print()
        print("client = ollama.Client(host='http://127.0.0.1:11435')")
        print("evaluator = XformEvaluator(client)")
        print("results = evaluator.run_full_evaluation()")
        print("```")
        
        # Demo what a single task evaluation would look like
        print("\n🎯 Demo: Single task evaluation")
        from pathlib import Path
        
        # Create a simple task spec
        class SimpleTaskSpec:
            def __init__(self):
                self.name = "demo_wire_to_reg"
                self.description = "Convert wire declarations to reg declarations"
                self.complexity = "simple"
                self.requirements = [
                    "Find wire declarations",
                    "Replace with reg declarations", 
                    "Preserve bit widths"
                ]
        
        task = SimpleTaskSpec()
        
        # Generate code for this task
        prompt = f"""
You are an expert in Verilog and Python. Create a transformation function that:

{task.description}

Requirements:
{chr(10).join(f"- {req}" for req in task.requirements)}

Generate a Python function like this:

```python
import re

def transform_wire_to_reg(input_file, output_file):
    with open(input_file, 'r') as f:
        content = f.read()
    
    # Your transformation logic here
    modified_content = re.sub(r'\\bwire\\b', 'reg', content)
    
    with open(output_file, 'w') as f:
        f.write(modified_content)
    
    return True
```

Return only the Python code.
"""
        
        print("   Generating sample transformation...")
        response = client.generate(model="llama3.2:1b", prompt=prompt)
        
        # Save the generated code
        demo_file = "demo_generated_xform.py"
        with open(demo_file, 'w') as f:
            f.write(f"# Generated by Ollama Llama 3\n# Task: {task.name}\n\n")
            f.write(response['response'])
        
        print(f"✅ Demo code generated and saved to {demo_file}")
        print(f"   Preview of generated code:")
        print("   " + "─" * 40)
        
        # Show first few lines
        lines = response['response'].split('\n')[:10]
        for line in lines:
            print(f"   {line}")
        if len(response['response'].split('\n')) > 10:
            print("   ...")
        
        print("\n✅ Setup complete! You can now run the full evaluation.")
        
        return 0
        
    except Exception as e:
        print(f"❌ Error during evaluation: {e}")
        import traceback
        traceback.print_exc()
        return 1

if __name__ == "__main__":
    sys.exit(main())
