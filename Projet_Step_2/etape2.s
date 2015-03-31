; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export Rayon ; créée en ASM donc à exporter pour le c
	import resultat ; créé en c donc import en ASM
	import TabCos ; créé dans Trigo.asm
	import TabSin ; créé dans Trigo.asm


Rayon proc

	; MAtlab a généré les tabs en 1.15 (qui ne permet pas d'obtenir 1 précisément)
	; Un carré va être sous format BRUT 1+1.15+15=2.30 et les sommes sous format 2.30
	
	ldr R1,=resultat ; load de l'@ de var globale résultat
	ldr R2,=TabCos ; premier load de l'@ de var globale (tab en lui-même pas son contenu)
	ldr R3,=TabSin ; premier load de l'@ de var globale (tab en lui-même pas son contenu)
	
	LSL R0, #1 ; *2 car on travaille sur 16bits et non à l'octet voir alignement données cours ASM
	;ldr R1, [R1, R0] inutile car on n'a pas besoin de la valeur contenu à l'@ resultat
	ldrsh R2, [R2, R0] ; s: signé h: sur 16 bits et r2,r0 car on se déplace de base + r0
	ldrsh R3, [R3, R0]
	
	MUL R3,R3 ; mise au carré du cos
	ASR R3, #16; décalage arith qui modifie que 'F' retour en 2.14 plutot que du 2.30(cf sujet) 
	MUL R2,R2 ; mise au carré du sin
	ASR R2, #16 ; décalage arith qui modifie que 'F' retour en 2.14 plutot que du 2.30(cf sujet)
	PUSH {R4} ; d'après convention AAPCS les registres R4 à R12 doivent voir leur état conservé donc puch/pop
	ADD R4, R3, R2 ; somme du cos et du sin dans R4
	;ATTENTION resultat contient du 32bits, donc saut de 2*16bits
	;Convention Cortex M3 ARM remplissage du registre en LITTLE ENDIAN
	STR R4, [R1,R0, lsl#1] ; *2 donc ro de base *4 (multiple 32 bit) pas de modification de R0 après cette instruction
	POP {R4}
	BX lr
	endp
	
	end
