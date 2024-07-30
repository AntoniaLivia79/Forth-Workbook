# Forth Words

(“n” stands for number; “c” stands for character):

: xxx yyy ;	( — )	Creates a new definition named xxx consisting of word(s) yyy.

CR	( — )	Outputs a newline.

SPACES	( n — )	Prints the given number of blank spaces at your terminal.

SPACE	( — )	Prints one blank space at your terminal.

EMIT	( c — )	Transmits a character to the output device.

.” xxx”	( — )	Prints the character string xxx at your terminal. The ” character terminates the string.

\+ 	( n1 n2 — n3 )	Adds n1+n2.

(n1 and n2 must be on the stack before word is executed, n3 will be left on the stack afterwards)

\.	 ( n — )	Prints a number followed by one space.

KEY ( - c )   Returns the ASCII value to the stack of the next available character from the current input device e.g. press t after KEY will put ascii 116 (for t) on stack and dot will print that code then remove the code from the stack
