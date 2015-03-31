clear all
close all
clc

Fe= 320*10^3;
T=2*10^-4;%notre pas frequentielle doit être égal au pgcd de toutes nos fréquence soit ici : 0.1 ce qui crée 3 200 000 points
F=1/T;
Asin=1;
Te=1/Fe;
Tsim=T-Te;
M=T/Te
f=0:F:(M-1)*F;
Fsin1=2*pi*(85005.9);
Fsin2=2*pi*(90*10^3);
Fsin3=2*pi*(94986.8);
Fsin4=2*pi*(100*10^3);
Fsin5=2*pi*(115015.9);
Fsin6=2*pi*(120*10^3)*0;

sim('model2',Tsim);
for i=1:25
    Sin_Ech(i)=0;
end
    
figure (1)
plot(Tps_Ech,Sin_Ech,'*b');

figure (2)
transech=fft (Sin_Ech);
stem(f,abs(transech))
title('FFT du sin échantilloné');

figure (3)
loglog(f,abs(tr ansech))