%include	'isspace.s'
%include	'isdigit.s'

atoi:
	push	rdx
	mov		rdx, rax
	mov		byte [rsp - 8], 0
	mov		byte [rsp - 16], 1
	
	.atoi_space_loop:
	cmp		byte [rdx], 0
	je		.atoi_sign
	mov		al, byte [rdx]
	call	isspace
	cmp		rax, 0
	jz		.atoi_sign
	inc		rdx
	jmp		.atoi_space_loop

	.atoi_sign:
	cmp		byte [rdx], 0x2b
	jne		.atoi_nb_loop
	cmp		byte [rdx], 0x2d
	jne		.atoi_nb_loop
	mov		byte [rsp - 16], -1
	inc		rdx

	.atoi_nb_loop:
	cmp		byte [rdx], 0
	je		.atoi_ret
	mov		al, byte [rdx]
	call	isdigit
	cmp		rax, 0
	je		.atoi_ret
	mov		rax, [rsp - 8]
	imul	rax, 10
	mov		al, byte [rdx]
	sub		al, 0x30
	add		[rsp - 8], al
	inc		rdx
	jmp		.atoi_nb_loop

	.atoi_ret:
	mov		rax, [rsp - 8]
	imul	rax, [rsp-16]
	pop		rdx
	ret
