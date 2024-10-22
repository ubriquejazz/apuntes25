

11. Explain what UTF-8, UTF-16 and UTF-32 are and why UTF-16 might be the best option. 

12. What is a code page and why might it be needed in an ASCII based regime?

_____________________________________________________________________


== Part II: Character Representation ==

• Unlike integers characters are always treated as unsigned!
• The simplest and most common system used is ASCII (American Standard Code for Information Interchange).
• This was initially a seven bit system (for historical reasons) but is now mainly used as an 8 bit system to support extended character sets on PCs.

== 12 ==

A code page is a table of values that describes the character set used for encoding a particular set of characters, usually combined with a number of control characters. Early PCs made use of them to control the use of the extended ASCII character set.

Sometimes if we are using text only output in a command shell (such as Bash for instance) we use “escape codes” to control the screen output which we can embed in literal strings in our programs. 

Escape 		Hex		Character represented
-------		---		---------------------
\n			0A		Newline (Line Feed); see notes below
\r			0D		Carriage Return
\t			09		Horizontal Tab

The majority of code pages in current use are supersets of ASCII, a 7-bit code representing 128 control codes and printable characters. In the distant past, 8-bit implementations of the ASCII code set the top bit to zero or used it as a parity bit in network data transmissions. When the top bit was made available for representing character data, a total of 256 characters and control codes could be represented. Most vendors (including IBM) used this extended range to encode characters used by various languages and graphical elements that allowed the imitation of primitive graphics on text-only output devices.

== 11 ==

The basic system is that each possible character (plus a few control codes) is represented by a number. For example capital A is 65. Lower case a is 97. B is 66, b is 98, C is 67, c is 99 etc. so we can easily convert between cases by adding or subtracting 32 from the integer representation of a character which is good for programmers!

One of the problems with ASCII is that although the 7 bits of the standard ASCII character set are fixed the upper 127 characters in the extended set can be changed and is often done so to accommodate non English speaking country’s character sets and things like symbols in word processors. This causes confusion, especially in the modern internet as foreign pages may not render properly. 

The solution is to have an alternative system with more bit patterns so we can have a single character set which can contain lots of international character sets. The commonest system is called Unicode. It is controlled by an international consortium standard and has three standard formats UTF-8, UTF-16 and UTF-32. 

- UTF-8: an 8 bit version based on ASCII. This is used in situations where standard ASCII is needed such as raw HTML.

- UTF-16: a 16 bit version with 49,000+ characters defined. The commonest used characters are represented in the standard 16 bits and less common characters via a meta-character system which permits such characters to be stored as pairs of 16 bit codes. A good compromise but slightly more complex to process.

- UTF-32: a 32 bit version which aims to store any possible character as a standard 32 bit code (once approved by the consortium). Simpler but files are much larger.

