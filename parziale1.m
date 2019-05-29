%% dati potenza
clear all
close all
clc

% caso 1: rapporto potenza di ingresso / potenza al carico data una linea
% con parametri caratteristici (C, L, G, R, Lunghezza)
% ATTENZIONE : convertire le unita' di misura

    v0plus = 1;

    z0 = 75; % ohm impedenza interna del generatore
    zl = 75; % ohm impedenza di carico

    F = 300e6; % frequenza hz
    w = 2*pi*F; % pulsazione rad/s
    
    Lunghezza = 1; % metri
    R = 0; % ohm
    G = 0; % siemens/m (ohm^-1) conduttanza
    L = 300e-9; % H/m
    C = 120e-12; % F/m
    
    z_car = sqrt((R + 1i*w*L)/(G + 1i*w*C)) % ohm impedenza caratteristica della line
    gamma = sqrt((R+1i*w*L)*(G+1i*w*C)); % gamma
    alpha = real(gamma);
    beta = imag(gamma);
   

    tangente = tan(beta*Lunghezza);
    
    if tangente > 1e10
        z_in = z_car^2/zl
    elseif tangente < 1e-5
        z_in = zl
    else
        z_in = z_car*(zl + 1i*z_car*tangente/(z_car + 1i*zl*tangente));
    end
    
    GammaL = (z_in - z0)/(z_in + z0) % coefficiente di riflessione vg-linea
    GammaL2= (zl - z_car)/(zl +z_car)  % coefficiente di riflessione linea-carico
    
%% calcoli
P_erogata = ((abs(v0plus)^2)/(2*z0));
P_ist_plus=((abs(v0plus)^2)/(2*z0))*exp(-2*alpha*Lunghezza);

P_minus = (((abs(v0plus)^2)*(abs(GammaL)^2))/(2*z0))*exp(2*alpha*Lunghezza);% la lunghezza è la z

P_l = P_ist_plus - P_minus;

rapporto_potenze = 0;

if (GammaL == 0 && alpha ~= 0) %no riflessione si perdite
    rapporto_potenze = exp(-2*alpha*Lunghezza)

elseif (GammaL ~= 0 && alpha == 0) %si riflessione no perdite   
    rapporto_potenze = 1 - abs(GammaL)^2
    
elseif (GammaL ~= 0 && alpha ~= 0) %si riflessione si perdite
    rapporto_potenze = 1 - abs(GammaL)^2 * exp(4*alpha*Lunghezza)
elseif (GammaL == 0 && alpha == 0)
    rapporto_potenza = 1
else 
    error("error");
end
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