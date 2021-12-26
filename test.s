	.section .bss
.lcomm	buf,0x100
	.section .data
prog:	.int	0x74736574,0x0
hex:	.int	0x7830
n:	.int	0xa
	.section .text
	.globl main
main:	pushq	%rbp
	movq	%rsp,%rbp
	addq	$0xffffffffffffffc0,%rsp
	movl	$0x27,%eax
	syscall
	movl	%eax,0xffffffffffffffc4(%rbp)
	movq	$0x2f636f72702f,%rax
	movq	%rax,0xffffffffffffffc8(%rbp)
	leaq	0xffffffffffffffc8(%rbp),%rsi
	leaq	0xffffffffffffffd0(%rbp),%rdi
.L0:	movsb	(%rsi),(%rdi)
	cmpb	$0,(%rsi)
	jne	.L0
	leaq	0xffffffffffffffff(%rbp),%rsi
	movb	$0,(%rsi)
	dec	%rsi
.L1:	movl	0xffffffffffffffc4(%rbp),%eax
	test	%eax,%eax
	je	.L2
	cdq
	movl	$0xa,%ecx
	idiv	%ecx
	movl	%eax,0xffffffffffffffc4(%rbp)
	addl	$0x30,%edx
	movb	%dl,(%rsi)
	dec	%rsi
	jmp	.L1
.L2:	inc	%rsi
.L5:	movsb	(%rsi),(%rdi)
	cmpb	$0,(%rsi)
	jne	.L5
	movq	$0x7370616d2f,%rax
	movq	%rax,0xffffffffffffffc8(%rbp)
	leaq	0xffffffffffffffc8(%rbp),%rsi
.L3:	movsb	(%rsi),(%rdi)
	cmpb	$0,(%rsi)
	jne	.L3
	movb	$0,(%rdi)
	movq	$0,0xffffffffffffffc8(%rbp)
	leaq	0xffffffffffffffd0(%rbp),%rdi
	xorl	%esi,%esi
	xorl	%edx,%edx
	movl	$2,%eax
	syscall
	movl	%eax,0xffffffffffffffcc(%rbp)
.L4:	movl	0xffffffffffffffcc(%rbp),%edi
	leaq	buf,%rsi
	movl	$0x100,%edx
	xorl	%eax,%eax
	syscall
	movl	%eax,%ecx
	leaq	buf,%rdi
	leaq	prog,%rsi
	repne cmpsl
	test	%ecx,%ecx
	je	.L4
	movl	$8,%ecx
	leaq	buf,%rsi
	leaq	0xfffffffffffffff0(%rbp),%rdi
	rep movsb
	movl	0xffffffffffffffcc(%rbp),%edi
	movl	$3,%eax
	syscall
	movl	$1,%edi
	leaq	hex,%rsi
	movl	$2,%edx
	movl	$1,%eax
	syscall
	movl	$1,%edi
	leaq	0xfffffffffffffff0(%rbp),%rsi
	movl	$8,%edx
	movl	$1,%eax
	syscall
	movl	$1,%edi
	leaq	n,%rsi
	movl	$1,%edx
	movl	$1,%eax
	syscall
	xorl	%edi,%edi
	addq	$0x40,%rsp
	popq	%rbp
	movl	$0x3c,%eax
	syscall
