clear all
clc

X=[10^4 2*10^4 5*10^4 8*10^4 10*10^4 12*10^4 15*10^4 20*10^4 50*10^4];
data=[1.05 1.11 1.12 0.86 0.91 1.23 0.21 0.03 0];
for i=1:9
    data(i)=20*log(data(i));
end
figure (2)
semilogx(X,data,'*r-');
grid;
xlabel('frequence en Hz');
ylabel('gain en dB');