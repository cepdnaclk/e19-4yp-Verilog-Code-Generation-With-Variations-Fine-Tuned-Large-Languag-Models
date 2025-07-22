module SchedDelayA;
class SchedDelayA; endclass
class SchedDelayA;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endclass
### Design and Analysis:
Both the above designs are compiled without any errors.
/Lab-05/readme.md
## Lab-05
### Question 1
Modify the module for the second state of the FSM. 
### Answer:
The new module for the second state of the FSM is provided in `Sched_DelayA.v`.
### Question 2
Modify the code to allow the inputs to go through the FSM.
### Answer:
The new code is provided in `Sched_DelayA_Mod.v`.
### Question 3
Test the code with the following inputs:
### Answer
1. `Sched_DelayA_Mod.v`
    - 50ns
        - In: `0`
        - Out: `0`
    - 100ns
        - In: `0`
        - Out: `1`
    - 150ns
        - In: `1`
        - Out: `1`
    - 200ns
        - In: `1`
        - Out: `0`
    - 250ns
        - In: `0`
        - Out: `1`
    - 300ns
        - In: `1`
        - Out: `0`
    - 350ns
        - In: `1`
        - Out: `0`
2. `Sched_DelayA.v`
    - 50ns
        - In: `0`
        - Out: `0`
    - 100ns
        - In: `0`
        - Out: `1`
    - 150ns
        - In: `1`
        - Out: `1`
    - 200ns
        - In: `1`
        - Out: `0`
    - 250ns
        - In: `0`
        - Out: `0`
    - 300ns
        - In: `0`
        - Out: `0`
    - 350ns
        - In: `0`
        - Out: `0`
### Question 4
Modify the code to allow the inputs to go through the FSM.
### Answer:
The new code is provided in `Sched_Delay_B.v`.
### Question 5
Test the code with the following inputs:
### Answer
1. `Sched_Delay_B.v`
    - 50ns
        - In: `0`
        - Out: `0`
    - 100ns
        - In: `0`
        - Out: `1`
    - 150ns
        - In: `1`
        - Out: `1`
    - 200ns
        - In: `1`
        - Out: `0`
    - 250ns
        - In: `0`
        - Out: `1`
    - 300ns
        - In: `1`
        - Out: `0`
    - 350ns
        - In: `1`
        - Out: `0`
2. `Sched_DelayA_Mod.v`
    - 50ns
        - In: `0`
        - Out: `0`
    - 100ns
        - In: `0`
        - Out: `1`
    - 150ns
        - In: `1`
        - Out: `1`
    - 200ns
        - In: `1`
        - Out: `0`
    - 250ns
        - In: `0`
        - Out: `1`
    - 300ns
        - In: `1`
        - Out: `0`
    - 350ns
        - In: `1`
        - Out: `0`
3. `Sched_DelayA.v`
    - 50ns
        - In: `0`
        - Out: `0`
    - 100ns
        - In: `0`
        - Out: `1`
    - 150ns
        - In: `1`
        - Out: `1`
    - 200ns
        - In: `1`
        - Out: `0`
    - 250ns
        - In: `0`
        - Out: `1`
    - 300ns
        - In: `1`
        - Out: `0`
    - 350ns
        - In: `1`
        - Out: `0`
### Question 6
Do the code in question 4 have the same behavior as the code in question 3?
### Answer
Since, `Sched_DelayA_Mod` behaves differently while passing 1 as an input, we can conclude that the code in question 4 do not have the same behavior as the code in question 3.
/Lab-07/readme.md
### Lab 07
### Question 1
Make sure you understand the code for `Sched_DelayA.v`. 
### Answer
Yes, the code for the module `Sched_DelayA.v` is correct as a result of compilation.
### Question 2
Make sure you understand the code for `Sched_DelayB.v`. 
### Answer
Yes, the code for the module `Sched_DelayB.v` is correct as a result of compilation.
### Question 3
Make sure you understand the code for the module `Sched_Delay_State_Machine.v`.
### Answer
Yes, the code for the module `Sched_Delay_State_Machine.v` is correct as a result of compilation.
### Question 4
Make sure you understand how the state machine works.
### Answer
1. The state machine has a `start` state, a `ready` state, an `input` state and an `output` state.
2. On the `start` state, the module waits for a valid input to pass to the `input` state.
3. On the `input` state, the module outputs a valid input, and the module goes back to the `ready` state.
4. On the `ready` state, the module waits for a valid input to pass to the `input` state.
5. On the `output` state, the module outputs the valid input and the module goes back to the `ready` state.
### Question 5
Write down the behavior of the Sche_Delay_State_Machine in the `input` state.
### Answer
1. The state machine goes to the `input` state.
2. It waits for a valid input.
3. On the first valid input, it outputs the input and goes back to the `ready` state.
4. On the second valid input, it outputs the input and goes back to the `ready` state.
5. On the third valid input, it outputs the input and goes back to the `ready` state.
6. On the fourth valid input, it outputs the input and goes back to the `ready` state.
7. On the fifth valid input, it outputs the input and goes back to the `ready` state.
8. The state machine goes back to `ready` state on the sixth valid input.
9. On the seventh valid input, the state machine outputs the input and goes back to the `ready` state.
10. On the eighth valid input, the state machine outputs the input and goes back to the `ready` state.
11. On the ninth valid input, the state machine outputs the input and goes back to the `ready` state.
12. On the tenth valid input, the state machine outputs the input and goes back to the `ready` state.
13. On the eleventh valid input, the state machine outputs the input and goes back to the `ready` state.
14. On the twelfth valid input, the state machine outputs the input and goes back to the `ready` state.
15. On the thirteenth valid input, the state machine outputs the input and goes back to the `ready` state.
16. On the fourteenth valid input, the state machine outputs the input and goes back to the `ready` state.
17. On the fifteenth valid input, the state machine outputs the input and goes back to the `ready` state.
18. On the sixteenth valid input, the state machine outputs the input and goes back to the `ready` state.
19. On the seventeenth valid input, the state machine outputs the input and goes back to the `ready` state.
20. On the eighteenth valid input, the state machine outputs the input and goes back to the `ready` state.
21. On the nineteenth valid input, the state machine outputs the input and goes back to the `ready` state.
22. On the twentieth valid input, the state machine outputs the input and goes back to the `ready` state.
23.