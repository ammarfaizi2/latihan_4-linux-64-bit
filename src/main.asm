section .rodata
	a11 db "Siapa nama Anda? "
	l_a11 equ $ - a11
	
	a12 db "Halo, "
	l_a12 equ $ - a12
	
	a13 db "!",10
	l_a13 equ $ - a13

	filename db "result"

section .bss
	z11 resb 30
section .data
	global _start

_start:
	call print_a11
	call getName
	mov rax,-1
	call cleanName
	mov r15,rax
	call writeFile
	call print_a12
	call printName
	call print_a13
	mov rax,60
	mov rdi,0
	syscall
writeFile:
	mov rax,2
	mov rdi,filename
	mov rsi,1
	mov rdx,439
	syscall
	mov rdi,rax
	mov rax,1
	mov rsi,a12
	mov rdx,l_a12
	syscall
	ret
cleanName:
	inc rax
	mov rdi,255
	mov rdx,[z11+rax]
	and rdx,rdi
	cmp rdx,10
	je trimName
	cmp rdx,0
	jne cleanName
	ret
trimName:
	mov r8,0
	mov [z11+rax],r8
	ret
getName:
	mov rax,0
	mov rdi,0
	mov rsi,z11
	mov rdx,30
	syscall
	ret
printName:
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
