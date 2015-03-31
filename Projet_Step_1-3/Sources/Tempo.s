; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export Temporisation
	export Generateur
;
Temporisation	proc
	mov	r2, #0	; 1ere instruction de la fonction (exemple)
LOOP	CMP R2,R0
	BEQ FIN
	NOP
	NOP
	ADD R2,#1;
	B LOOP
FIN	bx	lr
	endp
;
Generateur	proc
	mov r12, #9
	mul r0, r0, r12; on mul r0 par 9 pour s'affranchir du pbl de la freq quartz
SAUT
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register
	
	ldr	r3, =GPIOB_BSRR ; mise a un de PB1
	movs r1, #0x00000002
	str	r1, [r3] ; l'adresse dans R3 reçoit le contenu de R1
	
	BL Temporisation
							
	ldr	r3, =GPIOB_BSRR ; mise a zero de PB1
	movs	r1, #0x00020000
	str	r1, [r3] ; idem
	
	;ATTENTION on n'a pas modifié tempo pour x9
	BL Temporisation

	
	B SAUT
	BX lr
	endp
	
	end