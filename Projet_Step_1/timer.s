	thumb
	area  moncode, code, readonly
	export timer_callback	
	import etat
	
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register
	
timer_callback   proc
	LDR r2,=etat
	PUSH {r2}
	LDR r2,[r2]
	CMP r2, #0
	BNE maz
	ldr	r3, =GPIOB_BSRR ; mise a un de PB1
	movs r1, #0x00000002
	str	r1, [r3] ; l'adresse dans R3 reçoit le contenu de R1
	MOV r4, #1
	pop {r2}
	str r4,[r2]
	bx lr
maz	
	ldr	r3, =GPIOB_BSRR ; mise a zero de PB1
	movs	r1, #0x00020000
	str	r1, [r3] ; idem
	MOV r4, #0
	pop {r2}
	str r4, [r2]
	bx lr
	endp
	
	end