.text
	.align 4
	.globl OperaMat
	.type	OperaMat, @function
OperaMat:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
# Aqui has de introducir el codigo
		movl 8(%ebp), %ebx #ebx = Matriz
		movl $0, %eax #res = 0
		movl $0, %ecx #i = 0
for: 	cmpl $3, %ecx
		jge endfor
		movl $0, %edi #j = 0
for2:	cmpl $3, %edi
		jge endfor2
		movl (%ebx), %esi
		addl %esi,%eax
		addl 12(%ebp), %edi
		imul $4, 12(%ebp), %esi
		addl %esi, %ebx
		jmp for2
endfor2: addl 12(%ebp), %ecx
		imul $4, 12(%ebp), %esi
		addl %esi, %ebx
		jmp for
endfor: movl %eax, -4(%ebp)

# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax
	popl	%edi
	popl	%esi
	popl	%ebx	
	movl %ebp,%esp
	popl %ebp
	ret