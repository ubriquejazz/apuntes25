

10. Draw and describe the operation of a JK flip flop. Why is this better than a plain RS flip flop?
_____________________________________________________________________

== Part I: Appl. of Logic Circuits ==

If both the R and S inputs are one it is not possible to predict the outputs as it will depend on the state of the NOR gates. It overcomes it by linking the outputs back to the inputs:
• As the behaviour of the RS flip flop inside the JK flip flop says Q and not Q cannot both be one it prevents the RS problem ever happening
• As we shall see later, one useful side effect of this is that when J and K are both one, each time the clock pulses Q and not Q toggle (alternate between one and zero and back)
• A JK Flip Flop is always clocked. This is integral to the toggling behaviour. It will not work if it is not clocked.

Uses of Flip Flops:
• There are many uses for flip flops, not least in the construction of RAM and cache chips. They also exist inside a CPU to make up registers.
• If used for RAM or cache then there will simply be an array of flip flops, one per bit.
• Flip flops can be addressed on a grid arrangement based on the data on the address bus.
• They will of course also be grouped into bytes or words.
• Flip flops have many other uses, as an example of one use we will now look at one application, a binary ripple counter.




