	thumb
	area  moncode, code, readonly
	export timer_callback	
	import etat_tache
	
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register

TIM3_CCR3	equ	0x4000043C	; adresse registre PWM
	
E_POS		equ	0 ;adresse relative des variables de la structure par rapport à l'adresse de la variable
E_TAI		equ	4
E_SON		equ	8
E_RES		equ	12
E_PER		equ	16
	
	
timer_callback   proc
	
	LDR R1, =etat_tache ;adresse du premier élément de la structure (E_POS)
	LDR R2, [R1, #E_TAI]  ;contenu de la variable E_TAI
	LDR R3, [R1, #E_POS] ;contenu de la variable E_Pos 
	CMP R3,R2 ; diff posi-taille
	BNE SON ; si position=taille on a fini de lire le son
	
	LDR R4,=TIM3_CCR3 ; charge l'adresse du timer 3
	MOV R5,#0 ;0 dans R5
	STR R5, [R4] ; chargement de contenu de R5 en mémoire (indirect: le contenu de Timer3 prend 0, on joue donc le silence)
	B FIN
	
SON
	LDR R9, [R1, #E_SON] ; adresse mémoire E_SON (E_POS+8)
	LDRSH R8, [R9,R3, lsl#1] ; chargement de l'échantillon, décalage à gauche de 1 bit, R9+(R3*2) (=adresse de tab + position*2)
	;	pour prendre 2*16bits d'échantillon (SH: extention de signe à 32 bit)
	
	;calibrage 
	ADD R8, #65536
	MOV R10, #2
	UDIV R8, R10
	;résolution
	MOV R9, #65536
	LDR R0, [R1, #E_RES] ; récupération de la résolution 
	UDIV R9,R0
	UDIV R8,R9
	
	;envoie du son 
	LDR R4,=TIM3_CCR3 ;on charge l'adresse du timer
	STR R8, [R4] ; on envoie en RAM l'échantillon modifié dans le timer3 (PB0) il est alors joué
	
	;incrémentation position
	LDR R3, [R1, #E_POS] ; charge dans R3 la valeur de la position
	ADD R3, #1 ; on l'incrémente
	STR R3, [R1] ; on sauvegarde cette nouvelle position en mémoire

	
	
	B FIN
	
FIN BX lr	
	
	endp
	
 end 	

	