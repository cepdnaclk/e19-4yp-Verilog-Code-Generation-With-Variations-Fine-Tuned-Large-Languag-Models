```Verilog
module tb_TOP1;
  reg CLK;

  initial begin
    CLK = 0;
  end

  initial begin
    #100;
    $finish;
  end
endmodule
```
### Result:
```
$ make test
[...]
"tb_TOP1" completed
[Error] tb_TOP1.v:4:12: 
[Error] Inappropriate data type for inside comparater.
[Error]   Expected: [Bit]
[Info]   Found: [Integer]
[Error] Found 1 error(s).
```
'''
A script for auto generating test cases for FSM
'''
import sys
import random


def generate_testcase():
    testcase_name = sys.argv[1]
    testcase_states = int(sys.argv[2])
    testcase_initial_state = int(sys.argv[3])
    testcase_next_state = int(sys.argv[4])
    testcase_final_state = int(sys.argv[5])

    testcase_fsm_template = open('template_test.fsm', 'r').read()
    testcase_fsm_template = testcase_fsm_template.replace("<TEST_CASE>", testcase_name)

    testcase_in_template = open('template_in.fsm', 'r').read()
    testcase_in_template = testcase_in_template.replace("<TEST_CASE>", testcase_name)

    testcase_out_template = open('template_out.fsm', 'r').read()
    testcase_out_template = testcase_out_template.replace("<TEST_CASE>", testcase_name)

    fsm_states = ''
    in_transitions = []
    out_transitions = []
    for i in range(testcase_states):
        if i == testcase_initial_state:
            in_transitions.append(i)
        if i == testcase_final_state:
            out_transitions.append(i)
        fsm_states += f'\t<state>\n\t\t<name>{i}</name>\n\t\t<initial>{(i == testcase_initial_state)}</initial>\n\t\t<transition in={i} />'
        fsm_states += '\n\t</state>\n'
    # print(fsm_states)
    testcase_fsm_template = testcase_fsm_template.replace("<FSM_STATES>", fsm_states)

    testcase_in_template = testcase_in_template.replace("<TEST_CASE>", testcase_name)
    testcase_in_template = testcase_in_template.replace("<IN_STATES>", str(len(in_transitions)))
    for i in in_transitions:
        testcase_in_template += f"\t<in_transition>{i}</in_transition>\n"

    testcase_out_template = testcase_out_template.replace("<TEST_CASE>", testcase_name)
    testcase_out_template = testcase_out_template.replace("<OUT_STATES>", str(len(out_transitions)))
    for i in out_transitions:
        testcase_out_template += f"\t<out_transition>{i}</out_transition>\n"

    testcase_in = open(f'{testcase_name}.in', 'w')
    testcase_in.write(testcase_in_template)
    testcase_out = open(f'{testcase_name}.out', 'w')
    testcase_out.write(testcase_out_template)

    testcase_fsm = open(f'{testcase_name}.fsm', 'w')
    testcase_fsm.write(testcase_fsm_template)


def generate_testcase_from_file():
    testcase_name = sys.argv[1]
    testcase_file_name = sys.argv[2]
    testcase_states = int(sys.argv[3])
    testcase_initial_state = int(sys.argv[4])
    testcase_next_state = int(sys.argv[5])
    testcase_final_state = int(sys.argv[6])

    testcase_fsm_template = open('template_test.fsm', 'r').read()
    testcase_fsm_template = testcase_fsm_template.replace("<TEST_CASE>", testcase_name)

    testcase_in_template = open('template_in.fsm', 'r').read()
    testcase_in_template = testcase_in_template.replace("<TEST_CASE>", testcase_name)

    testcase_out_template = open('template_out.fsm', 'r').read()
    testcase_out_template = testcase_out_template.replace("<TEST_CASE>", testcase_name)

    fsm_states = ''
    in_transitions = []
    out_transitions = []
    file = open(testcase_file_name, 'r')
    lines = file.readlines()
    for i in range(testcase_states):
        if i == testcase_initial_state:
            in_transitions.append(i)
        if i == testcase_final_state:
            out_transitions.append(i)
        fsm_states += f'\t<state>\n\t\t<name>{i}</name>\n\t\t<initial>{(i == testcase_initial_state)}</initial>\n\t\t<transition in={i} />'
        fsm_states += '\n\t</state>\n'
    if testcase_initial_state == testcase_final_state:
        fsm_states = fsm_states.replace('<transition\n\t\t<in />', '<transition\n\t\t<in />>\n\t\t<target_state={}>'.format(testcase_initial_state))
    # print(fsm_states)
    testcase_fsm_template = testcase_fsm_template.replace("<FSM_STATES>", fsm_states)

    testcase_in_template = testcase_in_template.replace("<TEST_CASE>", testcase_name)
    testcase_in_template = testcase_in_template.replace("<IN_STATES>", str(len(in_transitions)))
    for i in in_transitions:
        testcase_in_template += f"\t<in_transition>{i}</in_transition>\n"

    testcase_out_template = testcase_out_template.replace("<TEST_CASE>", testcase_name)
    testcase_out_template = testcase_out_template.replace("<OUT_STATES>", str(len(out_transitions)))
    for i in out_transitions:
        testcase_out_template += f"\t<out_transition>{i}</out_transition>\n"

    for line in lines:
        testcase_in_template += line
        testcase_out_template += line

    testcase_in = open(f'{testcase_name}.in', 'w')
    testcase_in.write(testcase_in_template)
    testcase_out = open(f'{testcase_name}.out', 'w')
    testcase_out.write(testcase_out_template)

    testcase_fsm = open(f'{testcase_name}.fsm', 'w')
    testcase_fsm.write(testcase_fsm_template)


def generate_all_testcases():
    '''
    Generate all test cases with a defined range of states
    '''
    # Test cases where initial and final states are same
    for i in range(7):
        # print(i)
        for j in range(7):
            # print(i, j)
            if i < j:
                continue
            for k in range(7):
                # print(i, j, k)
                if k < j:
                    continue
                for l in range(7):
                    if l < j:
                        continue
                    if l <= j:
                        generate_testcase(f'testcase{i}{j}{k}{l}', i, j, k, l)


def generate_testcase(testcase_name, testcase_initial_state, testcase_final_state, testcase_next_state, testcase_states):
    '''
    Generate a single test case
    '''
    testcase_fsm_template = open('template_test.fsm', 'r').read