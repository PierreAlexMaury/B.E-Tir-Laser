; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export Partie
	import TabCos ; créé dans Trigo.asm
	import TabSin ; créé dans Trigo.asm
	import LeSignal
	import LeSignaltest
	export M2k


Partie proc

	;argument dans R0, R1, R2
	; R0= @ de LeSignal
	; R1= k
	; R2= @ table cos ou sin	

	PUSH {R4-R7} ;push R4,R5,R6,R7
	MOV R3, #0 ; variable de parcours i	
	MOV R7, #0
	
	
Boucle	
	MUL R4, R3, R1 ; calcul de ik dans R4, entier non signé 32bits
	AND R4, #0x0000003f ; ik modulo 64, entier non signé 32bits
	;LSL R4, #1 ; ik*2 car on travaille sur 16bits et non à l'octet voir alignement données cours ASM
	ldrsh R5, [R2, R4, lsl #1] ; s: signé h: sur 16 bits et r2,r5 car on se déplace de base + R4,
	;format 1.15
	;LSL R3, #1 ; i*2 car on travaille sur 16bits et non à l'octet voir alignement données cours ASM
	ldrsh R6, [R0, R3, lsl #1] ; valeur du signal en 4.12
	MUL R6, R5 ; format 1+4.15+12=5.27
 	ADD R7, R6
	;LSR R3, #1 ; i/2 pour reprendre l'itération normale
	ADD R3, #1 ; incrémentation de i
	CMP R3, #64 ; test de boucle while i<64
	BNE Boucle
	
	MOV R0, R7
		
	POP {R4-R7}
	
	BX lr
	endp
	
M2k proc

	;argument dans r0, r1
	;r0= @ du signal
	;r1= k
	PUSH {LR}
	PUSH {R4,R5,R6}
	MOV R4, R0
	LDR R2 ,=TabCos
	bl Partie ;appel de Partie avec Tabcos
	SMULL R5, R6, R0, R0 ;RegistreFortPoids R5, RegistreFaiblePoids R6, reçoivent R0*R0
	MOV R0, R4	
	LDR R2 ,=TabSin
	bl Partie ;appel de Partie avec TabSin
	SMULL R0, R1, R0, R0 ;RegistreFortPoids R0, RegistreFaiblePoids R1, reçoivent R0*R0
	ADD R0, R5 ;FortPoids(Reel)^2+FortPoids(Imaginaire)^2 format: 10.22
	
	
	POP{R4-R6}
	
	POP {PC}
	
	endp

	end