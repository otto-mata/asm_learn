%include	'puts.s'
%include	'exit.s'
%include	'atoi.s'

global		_start

section		.text
	_start:
		pop		rcx
		
		next:
		cmp		rcx, 0
		jz		quit
		pop		rax
		pop		rax
		call	atoi
		mov		rdi, rax
		call	exit

		quit:


