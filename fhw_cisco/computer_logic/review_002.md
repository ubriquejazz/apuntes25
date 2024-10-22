
9. Using an example show how we might store a signed integer in both sign and magnitude and twos complement format. Which is better for a human and for a computer and why?  

_____________________________________________________________________


== Part I: Number Systems and Conversions ==

Numbers can be signed or unsigned. Thus a byte can hold an unsigned number from 0-255 or (as we will see later when we cover twos complement) we can split the byte so half is used to represent a positive and half a negative number (for example -128 to +127)

This means a bit pattern could have two values depending on if we decide to process it as signed or unsigned. For example 10001011 could be 139 (an unsigned number) or -117 (twos complement signed). This has an impact on range as well. If we want to use signed arithmetic we need to double the word length to get the same range and an unsigned number range.

For example to store numbers up to 255 we need 8 bits unsigned (0-255) but twice as many bit patterns (i.e. a word) to store -256 to +255.

- We sometimes refer to unsigned integers as “cardinal numbers”. Cardinal numbers are always positive, where as plain integers can be positive or negative. 
- Thus 0-255 is a cardinal range but it could also be classed as a positive integer range where as -256 to +255 can only be classed as an integer range as it contains negative values. 

== Part III: Negative Numbers ==

• In part one we concentrated on basic number representation and conversion
• In this part we will look at representing negative numbers using complementary arithmetic.

= Sign and Magnitude =

For example, in a byte the number +12 would be 00001100
• The number -12 would be 10001100 (the same number but with a one in the MSB).
• There are however some limitations to the system. When we do arithmetic there is an added complexity as we need to decide whether the result will be positive or negative based on the type of calculation and which is larger, the first or second number (this happens automatically with twos complement)
• There are two values of zero! 00000000 and 10000000 

= An Example in Tens Complement =

• Although it is much more complex than in binary it is easier to understand the system by looking at an example in base 10.
• The basic principle is that when we want to subtract one number from the other, we add the complement of the second number to the first.
• To complement in decimal we subtract each of the digits in the number from 9 then we add 1.

• For example -1234
• 9999 - 1234 = 8765 
• 8765 + 1 = 8766
• Therefore 8766 is the complement to 1234
• Thus to subtract 1234 from (say) 8576 we could add 8576 to 8766 (the complement of 1234) giving 17342
• We then discard the carry out (the leading one) leaving 7342
• This is the same as 8576 - 1234.

= Back to Twos Complement =

• Obviously complementary arithmetic is not much use in base 10 as it still requires a subtraction (which is what we are trying to avoid). And is rather complicated!
• Fortunately in binary the process is much simpler

Consider creating -0110
• Subtract from 1111 gives 1001
• Add 1 gives 1010 (the complement of 0110)
• You might notice that the subtraction is actually just the same as “NOT”ing the number
• This is what makes twos complement simple
• In order to create a complement all we have to do is flip the bits and add one
• This is simple to achieve as a logic circuit, just “not” the bits and add the extra one (which can be done by setting the carry in of a full adder)

== Further Reading ==

• One other thing we need to consider is how we represent “real” numbers, that is, numbers that contain a fractional part such as 15.2, -10.95 etc.

• One the VLE is a supplement on how this system works. Read this supplement and make sure you understand how it works.






