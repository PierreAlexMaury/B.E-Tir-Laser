clear all
close all
clc

Fe= 320*10^3;
T=2*10^-4;%notre pas fréquentielle doit être le plus grand possible tout en recouvrant toutes les fréq (pas bcp trop petit avec 100*10^-3)
F=1/T;
Asin=1;
Te=1/Fe;
Tsim=T-Te;
M=T/Te
f=0:F:(M-1)*F;
Fsin1=2*pi*(85*10^3);
Fsin2=2*pi*(90*10^3);
Fsin3=2*pi*(95*10^3);
Fsin4=2*pi*(100*10^3);
Fsin5=2*pi*(115*10^3);
Fsin6=2*pi*(120*10^3);

sim('model2',Tsim);
figure (1)
plot(Tps_Ech,Sin_Ech,'*b');

figure (2)
transech=fft (Sin_Ech);
stem(f,abs(transech))
title('FFT du sin échantilloné');