module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
case (s)
2'b0:
y = a;
2'b1:
y = b;
default:
// This is the error case
y = 0;
endcase
endmoduleusername_1: With the given information, the answer should be:

1. There are no such cases (if we use the original definition of "prime"). There are only cases of the form $p|p \land q$, but these do not involve two primes.
2. The answer is again: There are no such cases. Indeed, if there *are* such cases, then the first case you give has $2p \land (p \land q)$. Hence, $p|2p \land (p \land q)$ (using the first rule of our definition of $p|p \land q$). It's also $p|(2p \land (p \land q))$. But since $(p \land q)$ is not a prime, $2p \land (p \land q)$ must be a prime, which is a contradiction.
3. Indeed, $p \land (p \land q)$ is not a prime, so $p|p \land (p \land q)$ is not a prime either.

I think the problem is that you are using a definition of "$p|q$" that is not correct. The correct definition should be that $p|q$ "means" that $p|q$ holds if and only if $p$ divides $q$. That's why the correct answer to this problem is "No". If $p|q$ means that $p \land q$ is a prime, then you are correct that the given counterexamples show that $p|q$ does not imply $p$ divides $q$.
Upvotes: 3 [selected_answer]username_2: The answer to your question is no.

Take $p=2$, $q=6$ or $p=2$,$q=17$ to show that $p|q$ does not imply $p|q$.
Upvotes: 1