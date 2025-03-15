section .data
msg	db	'Hello again, asm learner', 10

section .text
global _start

_start:
	mov		eax, msg
	call	strlen
	mov		ebx, 1
	mov		ecx, msg
	mov		edx, eax
	mov		eax, 4
	int		128

	mov		eax, 1
	mov		ebx, 0
	int		128

strlen:
	push	rbx
	mov		ebx, eax
lbl_strlen_loop:
	cmp		byte [eax], 0
	jz		lbl_strlen_end
	inc		eax
	jmp		lbl_strlen_loop
lbl_strlen_end:
	sub		eax, ebx
	pop		rbx
	ret

