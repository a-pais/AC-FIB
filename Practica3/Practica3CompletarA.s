.text
	.align 4
	.globl OperaVec
	.type	OperaVec, @function
OperaVec:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
# Aqui has de introducir el codigo
	movl 8(%ebp), %eax
    movl $1, %ebx 
    movl 8(%ebp), %ecx
for:cmpl 12(%ebp), %ebx
    jge endfor
    movl (%eax, %ebx, 4), %ecx
    cmpl %ecx, -4(%ebp)
    jge endif
    movl %ecx, -4(%ebp)
endif:
    incl %ebx
    addl $4, %ecx
    jmp for

endfor:
# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax
	popl	%edi
	popl	%esi
	popl	%ebx
	popl	%edx
	movl %ebp,%esp
	popl %ebp
	ret
