section .rodata
	a11 db "Siapa nama Anda? "
	a12 db "Halo, "
	a13 db "!",10
	a14 db 10,10
section .bss
	z11 resb 30
section .data
	global _start

_start:
	call print_a11
	call get_name
	mov rbx,0
	call clean_name
	call print_name
	mov rax,60
	xor rdi,rdi
	syscall
print_a11:
	mov rax,1
	mov rdi,1
	mov rsi,a11
	mov rdx,17
	syscall
	ret
get_name:
	mov rax,0
	mov rdi,0
	mov rsi,z11
	mov rdx,30
	syscall
	ret
clean_name:
	mov r10,[z11+rbx]
	cmp r10,10
	je clean_name_act
	mov r14,rbx
	inc rbx
	cmp rbx,30
	jl clean_name
	ret
clean_name_act:
	mov r8,0
	mov [z11+rbx],r8
	mov r14,rbx
	inc rbx
	cmp rbx,30
	jl clean_name
	ret
print_name:
	mov rax,1
	mov rdi,1
	mov rsi,a14
	mov rdx,2
	syscall
	mov rax,1
	mov rdi,1
	mov rsi,a12
	mov rdx,6
	syscall
	mov rax,1
	mov rdi,1
	mov rsi,z11
	mov rdx,rdx
	syscall
	mov rax,1
	mov rdi,1
	mov rsi,a13
	mov rdx,2
	syscall
	ret
