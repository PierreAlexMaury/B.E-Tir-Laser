; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export Rayon ; cr��e en ASM donc � exporter pour le c
	import resultat ; cr�� en c donc import en ASM
	import TabCos ; cr�� dans Trigo.asm
	import TabSin ; cr�� dans Trigo.asm


Rayon proc

	; MAtlab a g�n�r� les tabs en 1.15 (qui ne permet pas d'obtenir 1 pr�cis�ment)
	; Un carr� va �tre sous format BRUT 1+1.15+15=2.30 et les sommes sous format 2.30
	
	ldr R1,=resultat ; load de l'@ de var globale r�sultat
	ldr R2,=TabCos ; premier load de l'@ de var globale (tab en lui-m�me pas son contenu)
	ldr R3,=TabSin ; premier load de l'@ de var globale (tab en lui-m�me pas son contenu)
	
	LSL R0, #1 ; *2 car on travaille sur 16bits et non � l'octet voir alignement donn�es cours ASM
	;ldr R1, [R1, R0] inutile car on n'a pas besoin de la valeur contenu � l'@ resultat
	ldrsh R2, [R2, R0] ; s: sign� h: sur 16 bits et r2,r0 car on se d�place de base + r0
	ldrsh R3, [R3, R0]
	
	MUL R3,R3 ; mise au carr� du cos
	ASR R3, #16; d�calage arith qui modifie que 'F' retour en 2.14 plutot que du 2.30(cf sujet) 
	MUL R2,R2 ; mise au carr� du sin
	ASR R2, #16 ; d�calage arith qui modifie que 'F' retour en 2.14 plutot que du 2.30(cf sujet)
	PUSH {R4} ; d'apr�s convention AAPCS les registres R4 � R12 doivent voir leur �tat conserv� donc puch/pop
	ADD R4, R3, R2 ; somme du cos et du sin dans R4
	;ATTENTION resultat contient du 32bits, donc saut de 2*16bits
	;Convention Cortex M3 ARM remplissage du registre en LITTLE ENDIAN
	STR R4, [R1,R0, lsl#1] ; *2 donc ro de base *4 (multiple 32 bit) pas de modification de R0 apr�s cette instruction
	POP {R4}
	BX lr
	endp
	
	end
