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
	movl 8(%ebp), %eax      
    movl 12(%ebp), %ebx     
    
    movl 16(%ebp), %ecx     
    imul %ecx, %ecx        	
    addl %eax, %ecx        	

for:cmp %eax, %ecx
    jle endfor 
    movl (%eax), %edx
    sall $4, %edx		
    movl %edx, (%ebx)  

    incl %eax
    incl %ebx
    jmp for
endfor:

# El final de la rutina ya esta programado

	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret
