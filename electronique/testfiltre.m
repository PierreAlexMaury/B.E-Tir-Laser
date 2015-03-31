clear all
clc

dem2=[1.948*10^-12 2.502*10^-7 1];
dem1=[8.976*10^-12 2.783*10^-6 1];
sys1=tf(1,dem1);
sys2=tf(1,dem2);
bode(sys1,sys2);

%question 3
%on distingue la diff�rence entre les 2 pulsations propres:
% le filtre 2 coupe � plus haute fr�quence que le filtre 1
% et f1 a un amortissement bien plus faible (0.09) que f2 (0.46)
% donc f2 a + de r�sonnance que f1

