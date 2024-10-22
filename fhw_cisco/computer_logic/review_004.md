
16. List the basic Boolean logic rules and what they mean. Use examples to show the main ones (associative, commutative, Demorgans) in action.

17. Create a truth table for a circuit which determines if a four bit binary number is a valid hour on the 24 hour clock. Simplify the circuit to do it using a Karnaugh Map (and if needed Boolean algebra) and draw the simplified circuit.

_____________________________________________________________________

== Part II: Circuit Simplification ==

There are three main methods we use:
• Inspection
• The laws of Boolean algebra
• Karnaugh Maps

== Boolean Rules ==

This is a series of rules we can apply to an expression based on where one (usually simpler) expression can be shown to substitute for another allowing us to do the same thing with less gates.

- AND, OR and NOT Behaviour

- Associative Law
(A·B)·C = A·(B·C) = A·B·C 
(A+B)+C = A+(B+C) = A+B+C

- Distributive Law
A·(B+C) = (A·B) + (A·C) 
A+(B·C) = (A+B) · (A+C)

- Commutative Law
A·B = B·A 
A+B = B+A

- DeMorgan's Laws 
They allow us to simplify three gates to a single universal gate (i.e. NAND/NOR)

== Limitations of Boolean Algebra ==

• The limitation with Boolean algebra are that if you are not good at maths simplifying more than just the most basic expression is rather complex and it is easy to make mistakes.

• A better approach is to use the third technique (Karnaugh Maps) to do the bulk of the simplification then to use Boolean algebra (or inspection) to simplify the (now simpler) output. This is less prone to errors and generally easier to do.
