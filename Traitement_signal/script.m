% script.m
close all
clear all
clc
T=1;
M=32;
Te=T/M;
Tsim=T-Te;
Fsin=2*pi*25;
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
stem(abs(transech))
title('FFT du sin �chantillon�');
% pour fsin=3Hz on obtient un pic � 4Hz car matlab n'a pas comme origine 0
% donc 3+1=4 ici
% on observe un 2�me pic � 30Hz (soit 29Hz avec le d�calage de 0)
%il s'agit du pic n�gatif � -3Hz dupliqu� en �tant centr� sur Fe=32Hz 
% d'o� 32-3Hz=29Hz, si on trace sur plus de fr�quence on observera
% � nouveau le spectre sym�trique (-3Hz;3Hz) centr� sur k*Fe k[0,1,2..]
% il s'agit du repliement de spectre (cf Shannon)

%pour 15Hz on est � la limite du recouvrement (fe>2*fmax).
%pour 25 il y a recouvrement car fe<2*fmax.

%temporel: la pas te repr�sente la fen�tre en fr�quentielle
%temporel: la fen�tre repr�sente la pas fr�quentiel
% si plusieurs fr�quences � trans fourrier faire le PGCD de ces fr�qs afin 
%d'obtenir la p�riode � prendre en temporel