	.file	"MainProblem.c"
	.intel_syntax noprefix
	.text
	.globl	EPS
	.section	.rodata
	.align 8
	.type	EPS, @object
	.size	EPS, 8
EPS:
	.long	-1598689907
	.long	1051772663
	.text
	.globl	f
	.type	f, @function
f:
	push	rbp
	mov	rbp, rsp
	movsd	xmm3, xmm0  # xmm0 - a, xmm1 - b, xmm2 - x
	movsd	xmm0, xmm1
	mulsd	xmm0, xmm2
	mulsd	xmm0, xmm2
	mulsd	xmm0, xmm2
	addsd	xmm3, xmm0
	movq	rax, xmm3
	movq	xmm3, rax # Возвращаемое значение f
	pop	rbp
	ret
	.size	f, .-f
	.globl	integral
	.type	integral, @function
integral:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	movsd	QWORD PTR -40[rbp], xmm0 # a
	movsd	QWORD PTR -48[rbp], xmm1 # b
	movsd	QWORD PTR -56[rbp], xmm2 # left
	movsd	QWORD PTR -64[rbp], xmm3 # right - 4 выше это параметры функции
	movsd	xmm0, EPS[rip] 		 # step
	movsd	QWORD PTR -8[rbp], xmm0 
	movsd	xmm0, QWORD PTR -56[rbp] # now
	movsd	QWORD PTR -24[rbp], xmm0 # res
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0
	jmp	.L4
.L5:
	movsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -40[rbp]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	f
	movq	rax, xmm0
	movq	xmm0, rax
	mulsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR -16[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
.L4:
	movsd	xmm0, QWORD PTR -24[rbp] 
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR -64[rbp]
	comisd	xmm0, xmm1
	ja	.L5
	movsd	xmm0, QWORD PTR -16[rbp]
	movq	rax, xmm0 # Возращаемый интеграл
	movq	xmm0, rax
	leave
	ret
	.size	integral, .-integral
	.section	.rodata
.LC2:
	.string	"y = a + bx^3"
.LC3:
	.string	"a = "
.LC4:
	.string	"%lf"
.LC5:
	.string	"b = "
	.align 8
.LC6:
	.string	"\320\224\320\262\320\265 \320\263\321\200\320\260\320\275\320\270\321\206\321\213 \320\270\320\275\321\202\320\265\320\263\321\200\320\270\321\200\320\276\320\262\320\260\320\275\320\270\321\217 (\320\277\320\276 \320\274\320\276\320\264\321\203\320\273\321\216 \320\264\320\276 100):"
.LC7:
	.string	"left = "
.LC8:
	.string	"right = "
.LC9:
	.string	"integral = %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax # a
	xor	eax, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -40[rbp] # b
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -32[rbp] # left
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -24[rbp] #right
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm2, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -40[rbp]
	movapd	xmm3, xmm2 # первый
	movapd	xmm2, xmm1 # второй
	movapd	xmm1, xmm0 # третий
	movq	xmm0, rax # чётвёртый
	call	integral
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-1598689907
	.long	1051772663
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
