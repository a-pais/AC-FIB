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

	movl %eax, %ecx
	andl $0xF, %ecx
	cmp $0, %ecx

	jne u	

	movl %ebx, %ecx
	andl $0xF, %ecx
	cmp $0, %ecx

	jne u		

a: cmp %eax, %edx
	jle end

	movdqa (%eax), %xmm0

	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0 	

	movdqa %xmm0, (%ebx)
	addl $16, %eax
	addl $16, %ebx

	jmp a

u:cmp %eax, %edx
	jle end

	movdqu (%eax), %xmm0

	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0
	paddb %xmm0, %xmm0 	

	movdqu %xmm0, (%ebx)
	addl $16, %eax
	addl $16, %ebx

	jmp u

end:
	
# El final de la rutina ya esta programado

	emms	# Instruccion necesaria si os equivocais y usais MMX
	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret


	
# El final de la rutina ya esta programado

	emms	# Instruccion necesaria si os equivocais y usais MMX
	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
