
         .text
	.align 4
	.globl Intercambiar
	.type Intercambiar,@function
Intercambiar:
        pushl %ebp
        movl %esp, %ebp
        subl $12, %esp

        pushl %ebx
        pushl %esi

        imul $12, 12(%ebp), %eax        
        imul $12, 16(%ebp), %ebx        

        addl 8(%ebp), %eax              
        addl 8(%ebp), %ebx             

        movb (%eax), %cl                
        movb (%ebx), %dl                
        movb %dl, ( %eax)              
        movb %cl, (%ebx)               

        movl 4(%eax), %ecx             
        movl 4(%ebx), %esi              
        movl %esi, 4(%eax)             
        movl %ecx, 4(%ebx)             

        movl 8(%eax), %ecx              
        movl 8(%ebx), %esi            
        movl %esi, 8(%eax)           
        movl %ecx, 8(%ebx)            

        popl %esi
        popl %ebx

        movl %ebp, %esp
        popl %ebp
        ret