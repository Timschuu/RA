	IN A
	STORE A,00011
	JZ 10111
	LOAD A,00010
	SUB A,00010
	JPOS 00111
	J 11110
Beginn:	LOAD A,00011
	JZ 10111
	LOAD A,00110
	JZ 10001
	LOAD A,00100
	ADD A,00101
	STORE A,00100
	LOAD A,00110
	SUB A,00001
	J 10100
Fall_B:	STORE A,00101
	LOAD A,00110
	ADD A,00001
Weiter:	LOAD A,00011
	SUB A,00001
	J 00111
Ausgabe:	LOAD A,00110
	JZ 11011
A:	LOAD A,00100
	J 11110
B:	LOAD A,00101
	OUT A
	J 11110
Ende:	J 11110