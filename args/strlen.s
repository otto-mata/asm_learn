strlen:
	push	rbx
	mov		rbx, rax
.strlen_loop:
	cmp		byte [rax], 0
	jz		.strlen_ret
	inc		rax
	jmp		.strlen_loop
.strlen_ret:
	sub		rax, rbx
	pop		rbx
	ret
