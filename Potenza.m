%% dati potenza
clear all
close all
clc
z0 = 75;
lunghezza = 20;%in metri
v0plus = 1;% fasore
R = 0.6;
F = 500e6;%frequenza
G = 0;
L = 450e-9;
C = 80e-12;
w = 2*pi*F;%pulsazione
GammaL = 0;
gamma = sqrt((R+1i*w*L)*(G+1i*w*C));%gamma
alpha = real(gamma);
beta = imag(gamma);
%% calcoli
P_erogata = ((abs(v0plus)^2)/(2*z0));
P_ist_plus=((abs(v0plus)^2)/(2*z0))*exp(-2*alpha*lunghezza);

P_minus = (((abs(v0plus)^2)*(abs(GammaL)^2))/(2*z0))*exp(2*alpha*lunghezza);% la lunghezza è la z

P_l = P_ist_plus - P_minus;

% trasformazione in dB
dB =inline('10*log10(x)');

%% soluzioni
disp("_______________________________________________________________________________________________________________"+newline)
disp("    Potenza istantanea P+ : "+P_ist_plus+" W"+newline+"                    oppure: "+dB(P_ist_plus)+" dB"+newline+"                    oppure: "+dB(P_ist_plus*1000)+" dBm")
disp("    Potenza erogata------ : "+P_erogata+" W"+newline+"                    oppure: "+dB(P_erogata)+" dB"+newline+"                    oppure: "+dB(P_erogata*1000)+" dBm")
disp("    Potenza riflessa   P- : "+P_minus+" W"+newline+"                    oppure: "+dB(P_minus)+" dB"+newline+"                    oppure: "+dB(P_minus*1000)+" dBm")
disp("    Potenza al carico  Pl : "+P_l+" W"+newline+"                    oppure: "+dB(P_l)+" dB"+newline+"                    oppure: "+dB(P_l*1000)+" dBm")
disp("    ----------Pl/Perogata : "+P_l/P_erogata)
disp("_______________________________________________________________________________________________________________"+newline)