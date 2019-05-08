%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    ESERCIZIO DOPPIO
clear all;
clc
%% dati
z01 =  25;
lambda1 = 1;
lung1 = 0.3;

z02 = 40;
lambda2 = 1.3;
lung2 = 0.4;

zl = 50 + 30i;
%% clcoli
b2 = (2*pi)/lambda2;
tan2 = tan(b2*lung2);

b1 = (2*pi)/lambda1;
tan1 = tan(b1*lung1);
%% zin,b 
Zinb=z02*((zl+1i*z02*tan2)/(z02+1i*zl*tan2))
%% zin,a
zin=z01*((Zinb+1i*z01*tan1)/(z01+1i*Zinb*tan1))
%% ammettenza in zin,a e in zin,b
ammettenzaA = 1/zin

ammettenzaB = 1/Zinb;