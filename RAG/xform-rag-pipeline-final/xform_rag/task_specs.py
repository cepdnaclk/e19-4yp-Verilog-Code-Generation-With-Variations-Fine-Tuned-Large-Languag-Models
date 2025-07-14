#!/usr/bin/env python3
"""
Task specifications for xform evaluation
Defines the test suite and evaluation criteria
"""

from dataclasses import dataclass
from typing import List, Optional
from pathlib import Path


@dataclass
class TaskSpec:
    """Specification for a transformation task."""

    name: str
    description: str
    complexity: str  # 'simple', 'medium', 'complex', 'novel'
    requirements: List[str]
    input_file: str
    expected_output: Optional[str] = None
    success_criteria: Optional[List[str]] = None
    category: Optional[str] = None


class TaskSpecBuilder:
    """Builder for creating comprehensive task specifications"""

    @staticmethod
    def create_comprehensive_test_suite() -> List[TaskSpec]:
        """Create a comprehensive test suite covering all xform categories"""
        return [
            # ========== SIMPLE TASKS (Basic transformations) ==========
            TaskSpec(
                name="wire_to_reg",
                description="Transform wire variables to reg variables",
                complexity="simple",
                category="signal_modification",
                requirements=[
                    "Find all wire declarations in the Verilog file",
                    "Replace 'wire' keyword with 'reg' keyword",
                    "Preserve bit widths and signal names",
                    "Handle both single and multiple wire declarations",
                ],
                input_file="test_simple.v",
            ),
            TaskSpec(
                name="signal_rename",
                description="Rename any signal throughout a Verilog module",
                complexity="simple",
                category="signal_modification",
                requirements=[
                    "Take old_name and new_name as parameters",
                    "Find all occurrences of the signal",
                    "Replace in declarations, assignments, and references",
                    "Ensure only whole word matches (not partial)",
                ],
                input_file="test_simple.v",
            ),
            TaskSpec(
                name="module_name_change",
                description="Change a module name throughout the file",
                complexity="simple",
                category="structural_modification",
                requirements=[
                    "Find module declaration with old name",
                    "Replace module name in declaration",
                    "Update endmodule comments if they reference module name",
                    "Preserve all module contents and port lists",
                ],
                input_file="test_simple.v",
            ),
            TaskSpec(
                name="signal_width_change",
                description="Change a signal's bit width specification",
                complexity="simple",
                category="signal_modification",
                requirements=[
                    "Find signal declaration with existing width",
                    "Replace width specification with new width",
                    "Handle input, output, reg, wire signal types",
                    "Preserve signal name and other attributes",
                ],
                input_file="test_simple.v",
            ),
            # ========== MEDIUM TASKS (More complex logic) ==========
            TaskSpec(
                name="multi_signal_width",
                description="Change the bit width of multiple signals at once",
                complexity="medium",
                category="signal_modification",
                requirements=[
                    "Take a list of signal names and new width",
                    "Find each signal's declaration",
                    "Update the bit width specification",
                    "Handle both packed and unpacked arrays",
                    "Validate that new width is syntactically correct",
                ],
                input_file="test_medium.v",
            ),
            TaskSpec(
                name="reset_condition_change",
                description="Change reset condition from active-high to active-low or vice versa",
                complexity="medium",
                category="control_logic",
                requirements=[
                    "Find reset signal usage in if statements",
                    "Change if(rst) to if(!rst) or vice versa",
                    "Update sensitivity lists (posedge to negedge)",
                    "Handle both synchronous and asynchronous reset patterns",
                ],
                input_file="test_medium.v",
            ),
            TaskSpec(
                name="add_enable_signal",
                description="Add an enable signal to control a counter",
                complexity="medium",
                category="feature_addition",
                requirements=[
                    "Find counter increment statements (counter <= counter + 1)",
                    "Add enable signal as new input port",
                    "Wrap counter increments with enable condition",
                    "Preserve existing sensitivity lists and reset logic",
                ],
                input_file="test_medium.v",
            ),
            TaskSpec(
                name="array_base_type_change",
                description="Change the base type of an array declaration",
                complexity="medium",
                category="type_modification",
                requirements=[
                    "Find array declaration with current base type",
                    "Replace base type (e.g., bit to logic, int to byte)",
                    "Handle width specifications appropriately for new type",
                    "Preserve array dimensions and signal name",
                ],
                input_file="test_medium.v",
            ),
            # ========== COMPLEX TASKS (Advanced transformations) ==========
            TaskSpec(
                name="fsm_state_rename",
                description="Systematically rename FSM state names throughout a module",
                complexity="complex",
                category="fsm_modification",
                requirements=[
                    "Identify FSM state enum/parameter declarations",
                    "Take old_prefix and new_prefix as parameters",
                    "Rename all states that match the prefix pattern",
                    "Update all references in case statements",
                    "Update assignments and comparisons",
                ],
                input_file="test_complex.v",
            ),
            TaskSpec(
                name="queue_mda_conversion",
                description="Convert fixed arrays to queue-based multi-dimensional arrays",
                complexity="complex",
                category="advanced_arrays",
                requirements=[
                    "Find fixed array declarations",
                    "Convert to queue syntax with [$] or [$:bound] dimensions",
                    "Handle multiple dimensions as specified",
                    "Support both bounded and unbounded queues",
                    "Preserve base signal type and width",
                ],
                input_file="test_complex.v",
            ),
            TaskSpec(
                name="dynamic_mda_conversion",
                description="Convert fixed arrays to dynamic multi-dimensional arrays",
                complexity="complex",
                category="advanced_arrays",
                requirements=[
                    "Find fixed array declarations",
                    "Convert to dynamic array syntax with [] dimensions",
                    "Handle multiple dimensions as specified",
                    "Preserve base signal type and width",
                    "Generate proper initialization code",
                ],
                input_file="test_complex.v",
            ),
            TaskSpec(
                name="associative_mda_conversion",
                description="Convert arrays to associative multi-dimensional arrays",
                complexity="complex",
                category="advanced_arrays",
                requirements=[
                    "Find array declarations to convert",
                    "Convert to associative array syntax [key_type]",
                    "Support various key types (string, int, wildcard, etc.)",
                    "Handle multiple associative dimensions",
                    "Preserve base signal type and width",
                ],
                input_file="test_complex.v",
            ),
            # ========== NOVEL TASKS (Specialized scenarios) ==========
            TaskSpec(
                name="inside_op_coverage",
                description="Generate coverage test cases for inside operator with random values",
                complexity="novel",
                category="verification",
                requirements=[
                    "Create test cases for inside operator",
                    "Generate random value arrays for testing",
                    "Add coverage points for different scenarios",
                    "Include edge cases like empty arrays and boundary values",
                    "Generate both positive and negative test cases",
                ],
                input_file="test_coverage.v",
            ),
            TaskSpec(
                name="advanced_debug_insertion",
                description="Insert comprehensive debug capabilities into a module",
                complexity="novel",
                category="debug_enhancement",
                requirements=[
                    "Add debug output ports for all internal signals",
                    "Insert debug state tracking for FSMs",
                    "Add enable/disable debug functionality",
                    "Create debug information logging",
                    "Preserve original module functionality",
                ],
                input_file="test_complex.v",
            ),
            TaskSpec(
                name="performance_optimization",
                description="Optimize critical paths with pipeline insertion",
                complexity="novel",
                category="optimization",
                requirements=[
                    "Identify critical paths in combinational logic",
                    "Insert pipeline registers at optimal points",
                    "Maintain data flow integrity",
                    "Add pipeline control signals",
                    "Preserve functional correctness",
                ],
                input_file="test_complex.v",
            ),
        ]

    @staticmethod
    def create_basic_test_suite() -> List[TaskSpec]:
        """Create a basic test suite for quick evaluation"""
        return [
            TaskSpec(
                name="simple_wire_to_reg",
                description="Convert wire declarations to reg declarations",
                complexity="simple",
                category="signal_modification",
                requirements=[
                    "Find wire declarations",
                    "Replace with reg declarations",
                    "Preserve bit widths and names",
                ],
                input_file="test_simple.v",
            ),
            TaskSpec(
                name="basic_signal_rename",
                description="Rename a signal throughout the module",
                complexity="simple",
                category="signal_modification",
                requirements=[
                    "Find signal occurrences",
                    "Replace with new name",
                    "Handle declarations and references",
                ],
                input_file="test_simple.v",
            ),
            TaskSpec(
                name="add_debug_port",
                description="Add debug output port to module",
                complexity="medium",
                category="feature_addition",
                requirements=[
                    "Add new output port to module",
                    "Connect internal signal to debug port",
                    "Preserve existing functionality",
                ],
                input_file="test_medium.v",
            ),
        ]

    @staticmethod
    def create_custom_task(
        name: str,
        description: str,
        requirements: List[str],
        complexity: str = "medium",
        category: str = "custom",
    ) -> TaskSpec:
        """Create a custom task specification"""
        return TaskSpec(
            name=name,
            description=description,
            complexity=complexity,
            category=category,
            requirements=requirements,
            input_file="test_custom.v",
        )

    @staticmethod
    def get_tasks_by_complexity(
        tasks: List[TaskSpec], complexity: str
    ) -> List[TaskSpec]:
        """Filter tasks by complexity level"""
        return [task for task in tasks if task.complexity == complexity]

    @staticmethod
    def get_tasks_by_category(tasks: List[TaskSpec], category: str) -> List[TaskSpec]:
        """Filter tasks by category"""
        return [task for task in tasks if task.category == category]


class TestFileGenerator:
    """Generates test Verilog files for evaluation"""

    @staticmethod
    def create_test_files():
        """Create all required test files"""
        test_files = {
            "test_simple.v": """// test_simple.v - Simple module for basic transformation tests
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
    
endmodule""",
            "test_medium.v": """// test_medium.v - Medium complexity module
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
            counter <= counter + 1;
        end
    end
endmodule""",
            "test_complex.v": """// test_complex.v - Complex module with FSM
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
    reg [31:0] data_array [0:15];
    
    always @(posedge clk) begin
        if (!reset) begin
            current_state <= FSM_IDLE;
            result <= 32'h0;
            done <= 1'b0;
        end else begin
            case (current_state)
                FSM_IDLE: if (cmd != 0) current_state <= FSM_PROCESS;
                FSM_PROCESS: begin 
                    result <= data_array[cmd[3:0]]; 
                    current_state <= FSM_DONE; 
                end
                FSM_DONE: begin 
                    done <= 1'b1; 
                    current_state <= FSM_IDLE; 
                end
            endcase
        end
    end
endmodule""",
            "test_coverage.v": """// test_coverage.v - For coverage testing
module coverage_test(
    input wire [7:0] test_value,
    output reg result
);
    logic [7:0] test_array [0:7];
    logic [7:0] dynamic_array [];
    
    initial begin
        for (int i = 0; i < 8; i++) begin
            test_array[i] = i * 10;
        end
        dynamic_array = new[4];
        for (int i = 0; i < 4; i++) begin
            dynamic_array[i] = i * 5;
        end
    end
    
    always @(*) begin
        result = (test_value inside {test_array}) || 
                 (test_value inside {dynamic_array});
    end
endmodule""",
        }

        for filename, content in test_files.items():
            file_path = Path(filename)
            if not file_path.exists():
                with open(file_path, "w") as f:
                    f.write(content)
                print(f"Created test file: {filename}")
            else:
                print(f"Test file already exists: {filename}")

    @staticmethod
    def create_custom_test_file(filename: str, content: str):
        """Create a custom test file"""
        with open(filename, "w") as f:
            f.write(content)
        print(f"Created custom test file: {filename}")
