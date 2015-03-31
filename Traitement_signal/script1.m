%script1.m
close all
clear all
clc
T=1; %car F donne 0.5 ce qui est ok pour avoir 5.5
F=1/T;
M=32;
f=0:F:(M-1)*F;%on cr�e un vecteur commen�ant � 0 (M-1) allant donc jusqu'� 32 (tjs avec M-1) 
%de pas la fr�quence de la fen�tre soit 0.5. ce vecteur contient donc toutes les valeurs de freq 
%qui nous sont utiles.

Te=T/M;
Tsim=T-Te;
%si le signal est � 16Hz on est � la limite de Shannon 
%soit on a de la chance l'�chantillonnage est asynchrone (d�phasage) et
%nos valeurs "captur�es" provenant du signal ne seront pas nulle
%soit on n'a pas de chance et c'est synchrone, ici on prend 2 points par
%p�riode donc on prendrait � x=0->y=0 et x=(une demie p�riode du signal)->y=0
%en FFT on observe donc que des Z�ros (environ 10^-14).
Fsin=2*pi*15;
Asin=1;
sim('model1',Tsim);
figure (1)
plot(Tps_Cont,Sin_Cont);

figure (2)
plot(Tps_Ech,Sin_Ech,'*b');
 
figure (3)
transcont=fft (Sin_Cont);
stem(abs(transcont))
title('FFT du sin continu');

figure (4)
transech=fft (Sin_Ech);
stem(f,abs(transech))
title('FFT du sin �chantillon�');

%En revenant avec la fen�tre de T=1s et F=1Hz on obtient pour le signal
%continue (� 16Hz) tracer normal
%pour le signal �chantillonn� 