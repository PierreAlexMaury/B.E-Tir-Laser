	thumb
	area	reset, data, readonly
	export __Vectors
__Vectors
	dcd	0x20004000	; stack en fin de la zone de 20k de RAM
	dcd	Reset_Handler	; point d'entree de notre programme
;
	area	moncode, code, readonly
;
	export	Reset_Handler
Reset_Handler proc
	mov	r0, #10
	bl	tempo
fin	b	fin
	endp

tempo	MOV R2,#0
LOOP	CMP R2,R0
	BEQ FIN
	ADD R1,R1
	ADD R1,R1
	ADD R2,#1;
	B LOOP
FIN	bx	lr
;
	end