	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

	@ ADD/MODIFY CODE BELOW
	@ PROLOG
fibonacci:
	push {r1,r2, lr}
    mov r1,#0
    mov r2,#1

loop:
    @if(n==0) return a
    cmp r0,#0
    beq .L3
    @if(n==1) return b

    cmp r0,#1
    beq .L4

    sub r0,r0,#1
    @swp r1,r2
    eor r1,r1,r2
    eor r2,r1,r2
    eor r1,r1,r2

    add r2,r1,r2
    
    b loop
.L3:
	mov r0, r1			@ R0 = 0
	pop {r1,r2,pc}

.L4:
	mov r0, r2			@ R0 = 1
	pop {r1,r2,pc}

	.size fibonacci, .-fibonacci
	.end
