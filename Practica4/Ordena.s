.text
    .align 4
    .globl Ordenar
    .type Ordenar,@function

Ordenar:
        pushl %ebp
        movl %esp, %ebp
        subl $8, %esp

        pushl %ebx
        pushl %esi
        pushl %edi

        movl 8(%ebp), %esi #esi = v[]
        movl $0, %ebx      #ebx = i

for1:   imul $12, %ebx, %ecx
    	cmpl $0x80000000,4(%esi, %ecx)
    	je endfor1
    	movl %esi, %edi
    	incl %edi       #edi = j

for2:	imul $12, %edi, %eax
     	cmpl $0x80000000,4(%esi, %eax)
     	je endfor2
     	imul $12, %ebx, %ecx

if: 	movl 4(%esi, %ecx), %edx #edx= v[i].k
    	cmpl 4(%esi, %eax), %edx
    	jge endif
    	pushl %edi
    	pushl %ebx
    	pushl %esi
    	call Intercambiar
        addl $12, %esp

endif: 	incl %edi
       	jmp for2

endfor2: incl %ebx
         jmp for1

endfor1: movl %ebx, %eax

         popl %edi
         popl %esi
         popl %ebx
         movl %ebp, %esp
         popl %ebp
         ret


