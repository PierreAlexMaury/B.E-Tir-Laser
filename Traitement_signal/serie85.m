close all
clear all
clc
Fsin=2*pi*85^3;
somme=0;
t=linspace(0,1,85);
for i=0:150
    somme=somme+(4*pi)*(sin(Fsin*(2*i+1)*t))/(2*i+1);
    plot(t,somme);
    
end

figure (2)
transf= fft(somme);
stem(t,abs(transf));