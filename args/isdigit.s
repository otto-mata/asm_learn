isdigit:
	mov		byte [rsp - 8], 0
	cmp		al, 0x30
	jl		.isspace_out
	cmp		al, 0x39
	jg		.isspace_out
	mov		byte [rsp - 8], 1
	
	.isspace_out:
	mov		rax, [rsp - 8]
	ret
