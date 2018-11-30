section .rodata
	a11 db "Siapa nama Anda? "
	l_a11 equ $ - a11	
	a12 db "Halo, "
	l_a12 equ $ - a12
	a13 db "!",10
	l_a13 equ $ - a13
section .bss
	z11 resb 30
section .data
	global _start

_start:
	call print_a11
	call get_name
	mov rax,-1
	call clean_name
	mov r15,rax
	call print_a12
	call print_name
	call print_a13
	mov rax,60
	xor rdi,rdi
	syscall
clean_name:
	inc rax
	mov rdi,255
	mov rdx,[z11+rax]
	and rdx,rdi
	cmp rdx,10
	je trim_name
	cmp rdx,0
	jne clean_name
	ret
trim_name:
	mov r8,0
	mov [z11+rax],r8
	ret
get_name:
	mov rax,0
	mov rdi,0
	mov rsi,z11
	mov rdx,30
	syscall
	ret
print_name:
	mov rax,1
	mov rdi,1
	mov rsi,z11
	mov rdx,r15
	syscall
	ret
print_a11:
	mov rax,1
	mov rdi,1
	mov rsi,a11,
	mov rdx,l_a11
	syscall
	ret
print_a12:
	mov rax,1
	mov rdi,1
	mov rsi,a12,
	mov rdx,l_a12
	syscall
	ret
print_a13:
	mov rax,1
	mov rdi,1
	mov rsi,a13
	mov rdx,l_a13
	syscall
	ret
