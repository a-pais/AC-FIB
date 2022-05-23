.text
	.align 4
	.globl procesar
	.type	procesar, @function
procesar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi

# Aqui has de introducir el codigo
    movl 16(%ebp), %edx 	
	imull %edx, %edx 		

	movl 8(%ebp), %eax		
	movl 12(%ebp), %ebx 	

	addl %eax, %edx 		

for:cmp %eax, %edx
	jle endfor

	movdqu (%eax), %xmm0

	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0 	

	movdqu %xmm0, (%ebx)
	addl $16, %eax
	addl $16, %ebx

	jmp for

endfor:
	
# El final de la rutina ya esta programado

	emms	# Instruccion necesaria si os equivocais y usais MMX
	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
