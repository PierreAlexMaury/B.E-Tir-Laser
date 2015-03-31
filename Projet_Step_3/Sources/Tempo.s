; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export Temporisation
;
Temporisation	proc
	mov	r2, #0	; 1ere instruction de la fonction (exemple)

	bx	lr	; dernière instruction de la fonction
	endp
;
	end