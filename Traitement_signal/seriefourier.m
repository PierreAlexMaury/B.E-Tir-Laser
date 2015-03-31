clear all
close all
clc

F0=100;
somme=0;
t=linspace(0,10,1000);
a=[1 0 0.3 0 0.1 0 0.04 0 0.002 0]
for i=1:10
    
    somme=somme +a(i)* sin(2*pi*F0*i*t)

plot(t,somme);
pause;
end    
 