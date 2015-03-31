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
title('FFT du sin échantilloné');
% pour fsin=3Hz on obtient un pic à 4Hz car matlab n'a pas comme origine 0
% donc 3+1=4 ici
% on observe un 2ème pic à 30Hz (soit 29Hz avec le décalage de 0)
%il s'agit du pic négatif à -3Hz dupliqué en étant centré sur Fe=32Hz 
% d'où 32-3Hz=29Hz, si on trace sur plus de fréquence on observera
% à nouveau le spectre symétrique (-3Hz;3Hz) centré sur k*Fe k[0,1,2..]
% il s'agit du repliement de spectre (cf Shannon)

%pour 15Hz on est à la limite du recouvrement (fe>2*fmax).
%pour 25 il y a recouvrement car fe<2*fmax.

%temporel: la pas te représente la fenêtre en fréquentielle
%temporel: la fenêtre représente la pas fréquentiel
% si plusieurs fréquences à trans fourrier faire le PGCD de ces fréqs afin 
%d'obtenir la pèriode à prendre en temporel