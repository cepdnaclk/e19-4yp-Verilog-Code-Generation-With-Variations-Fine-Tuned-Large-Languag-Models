module FA;
    output [31:0]sum,carry;

    wire a_input;
    wire b_input;
    wire carry_input;

    reg [31:0]a, b;
    reg [31:0]carry_in;

    assign sum = a+b+carry_in;
    assign carry = a*b*carry_in;
    
    assign a_input = a;
    assign b_input = b;
    assign carry_input = carry;

endmodule

module Ripple_Add;
    reg [31:0]a,b;
    reg [31:0]carry_in;

    FA fa0(.a(a),.b(b),.carry_in(carry_in),.sum(a+b),.carry(carry_in*b));
    FA fa1(.a(a),.b(b),.carry_in(carry_in),.sum(a+b),.carry(carry_in*b));
    FA fa2(.a(a),.b(b),.carry_in(carry_in),.sum(a+b),.carry(carry_in*b));
    FA fa3(.a(a),.b(b),.carry_in(carry_in),.sum(a+b),.carry(carry_in*b));

endmodule
/06_2_21_89/src/test/java/com/github/viveksb96/verilog_veri_test/testcases/Test_Combinational_Assign.java
package com.github.viveksb96.verilog_veri_test.testcases;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.github.viveksb96.verilog_veri_test.testcase.TestCase;
import com.github.viveksb96.verilog_veri_test.testmodel.TestModel;
import com.github.viveksb96.verilog_veri_test.testmodel.TestModelVisitor;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertTrue;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class Test_Combinational_Assign {
    public static Stream<Arguments> test_data() throws IOException {
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        // TODO: This has been tested only for 820. Please test the rest
        Map<String, Map<String, String>> yaml_data = mapper.readValue(Test_Combinational_Assign.class.getResourceAsStream("/testcases/test_combinational_assign.yaml"), Map.class);
        Set<Map.Entry<String, Map<String, String>>> entrySet = yaml_data.entrySet();
        Collection<Map.Entry<String, Map<String, String>>> testcases = entrySet;
        return Stream.concat(
                Stream.of(Arguments.of("testcases/test_combinational_assign.yaml", yaml_data)),
                testcases.stream().map(entry -> Arguments.of(entry.getKey(), entry.getValue())))
               .map(tc -> new Arguments[]{tc});
    }

    @ParameterizedTest
    @MethodSource("test_data")
    public void test_combinational_assign(String file, Map<String, Map<String, String>> yaml_data) throws IOException {
        TestCase testCase = new TestCase(file, yaml_data);
        TestModel testModel = testCase.loadTestModel();
        assertTrue(testModel.accept(new TestModelVisitor() {
            @Override
            public void visit(org.jundge.ast.ast.ModuleDeclaration moduleDeclaration) {
                {
                    // No need to do anything, as input/output variables are
                    // already added to the TestModel
                }
            }

            @Override
            public void visit(org.jundge.ast.ast.InputDeclaration inputDeclaration) {
                inputDeclaration.getValue().accept(new TestModelVisitor() {
                    @Override
                    public void visit(org.jundge.ast.ast.Identifier identifier) {
                        Test_Combinational_Assign.this.add_input(identifier.getValue());
                    }

                    @Override
                    public void visit(org.jundge.ast.ast.Constant constant) {
                        Test_Combinational_Assign.this.add_input(constant.getValue());
                    }
                });
            }

            @Override
            public void visit(org.jundge.ast.ast.OutputDeclaration outputDeclaration) {
                outputDeclaration.getValue().accept(new TestModelVisitor() {
                    @Override
                    public void visit(org.jundge.ast.ast.Identifier identifier) {
                        Test_Combinational_Assign.this.add_output(identifier.getValue());
                    }

                    @Override
                    public void visit(org.jundge.ast.ast.Constant constant) {
                        Test_Combinational_Assign.this.add_output(constant.getValue());
                    }
                });
            }

            @Override
            public void visit(org.jundge.ast.ast.ParameterDeclaration parameterDeclaration) {
                parameterDeclaration.getValue().accept(new TestModelVisitor() {
                    @Override
                    public void visit(org.jundge.ast.ast.Identifier identifier) {
                        Test_Combinational_Assign.this.add_parameter(identifier.getValue());
                    }

                    @Override
                    public void visit(org.jundge.ast.ast.Constant constant) {
                        Test_Combinational_Assign.this.add_parameter(constant.getValue());
                    }
                });
            }

            @Override
            public void visit(org.jundge.ast.ast.LocalParameterDeclaration localParameterDeclaration) {
                localParameterDeclaration.getValue().accept(new TestModelVisitor() {
                    @Override
                    public void visit(org.jundge.ast.ast.Identifier identifier) {
                        Test_Combinational_Assign.this.add_local_parameter(identifier.getValue());
                    }

                    @Override
                    public void visit(org.jundge.ast.ast.Constant constant) {
                        Test_Combinational_Assign.this.add_local_parameter(constant.getValue());
                    }
                });
            }

            @Override
            public void visit(org.jundge.ast.ast.ParameterValue parameterValue) {
                // Nothing to do as this is handled during module declaration
                // @Override
                // public void visit(org.jundge.ast.ast.Identifier identifier) {
                //
            }

            @Override
            public void visit(org.jundge.ast.ast.Constant constant) {
                // Nothing to do as this is handled during module declaration
                // @Override
                // public void visit(org.jundge.ast.ast.Constant constant) {
                //
            }

            @Override
            public void visit(org.jundge.ast.ast.CombinationalAssignment combinationalAssignment) {
                // Combinational assignment is handled during test case load
                // @Override
                // public void visit(org.jundge.ast.ast.CombinationalAssignment combinationalAssignment) {
                //
            }

            @Override
            public void visit(org.jundge.ast.ast.SequentialAssignment sequentialAssignment) {
                // Sequential assignment is handled during test case load
                // @Override
                // public void visit(org.jundge.ast.ast.SequentialAssignment sequentialAssignment) {
                //
            }
        }));
    }

    private void add_input(String name) {
        if (!in_outputs.containsKey(name)) {
            in_outputs.put(name, 0);
        }
        in_outputs.put(name, in_outputs.get(name) + 1);
    }

    private void add_output(String name) {
        if (!in_outputs.containsKey(name)) {
            in_outputs.put(name, 0);
        }
        in_outputs.put(name, in_outputs.get(name) + 1);
    }

    private void add_parameter(String name) {
        if (!in_outputs.containsKey(name)) {
            in_outputs.put(name, 0);
        }
        in_outputs.put(name, in_outputs.get(name) + 1);
    }

    private void add_local_parameter(String name) {
        if (!in_outputs.containsKey(name)) {
            in_outputs.put(name, 0);
        }
        in_outputs.put(name, in_outputs.get(name) + 1);
    }

    Map<String, Integer> in_outputs = new HashMap<>();
}
/06_2_21_89/src/test/resources/testcases/test_module.c
class FA
{
    int a;
    int b;
    int c;
}