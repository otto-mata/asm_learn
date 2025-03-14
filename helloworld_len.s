section	.data
	msg db 'Hello, brave new world!', 10

section .text
global _start

_start:
	mov	ebx, msg
	mov	eax, ebx

nextchar:
	cmp byte [eax], 0
	jz	finished
	add	eax, 1
	jmp	nextchar

finished:
	sub	eax, ebx
	mov	edx, eax
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int 128
	mov	ebx, 0
	mov eax, 1
	int 128
