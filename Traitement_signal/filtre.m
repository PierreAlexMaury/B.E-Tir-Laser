close all
clear all
clc

dem=[1.7483*10^-23 7.6663*10^-18 1.162*10^-11 3.0332*10^-6 1];
sys=tf(1,dem);
bode(sys);