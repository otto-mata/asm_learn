%include	'strlen.s'

puts:
	push	rdx
	push	rcx
	push	rbx
	push	rax
	call	strlen
	mov		rdx, rax
	pop		rax
	mov		rsi, rax
	mov		rdi, 1
	mov		rax, 1
	syscall
	pop		rbx
	pop		rcx
	pop		rdx
	ret

puts_nl:
	call	puts
	push	rax
	mov		rax, 10
	push	rax
	mov		rax, rsp
	call	puts
	pop		rax
	pop		rax
	ret
