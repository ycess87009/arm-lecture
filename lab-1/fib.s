	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	
    push {r3,r4,lr}

	@ R3 = R0 - 0 (update flags)
	@ if(R0 <= 1) goto .L3 (which returns 0)
    
    mov r3,r0
    cmp r0,#1
    ble .L3

	
    @ R0 = R3 - 1
	@ Recursive call to fibonacci with R3 - 1 as parameter
    
    sub r0,r3,#1
    bl fibonacci
    
	@ R4 = R0
	@ R0 = R3 - 2
	@ Recursive call to fibonacci with R3 - 2 as parameter
    
    mov r4,r0
    sub r0,r3,#2
    bl fibonacci

	@ R0 = R4 + R0 (update flags)
    add r0,r0,r4
	pop {r3,r4,pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:

	@ Compare R3 wtih 1
	@ If R3 == 1 goto .L4 (which returns 1)
    cmp r0,#1
    beq .L4
	pop {r3,r4,pc}		@ EPILOG

.L4:
	pop {r3,r4,pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end



