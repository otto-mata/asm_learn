%include	'exit.s'
%include	'puts.s'

section		.data
	msg0	db	'Hello from the include', 0
	msg1	db	'hm, again a message', 0

section		.text
global		_start

_start:
	mov		rax, msg0
	call	puts_nl
	mov		rax, msg1
	call	puts_nl
	call	exit
	ret
