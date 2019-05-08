%dati problema
clear; clc
%% dati
C = 100*10^(-12);
L = 450*10^(-9);
Zl = 75;
F = 500*10^(8);
G = 0;
R = 0.6;
%% calcoli
if(R ==0 && G==0)
     %disp("dati: ")
     %disp(newline+"c  = "+C+" F/m")
     %disp(newline+"l  = "+L+" H/m")
     %disp(newline+"Zl = "+Zl+" ohm")
     %disp(newline+"f  = "+F+" Hz")
     disp(newline+"NO perdite")
else
     %disp("dati: ")
     %disp("c  = "+C+" F/m")
     %disp("l  = "+L+" H/m")
     %disp("Zl = "+Zl+" ohm")
     %disp("f  = "+F+" Hz")
     %disp("G  = "+G+" ohm")
     %disp("R  = "+R+" ohm")
     disp("SI perdite")
end
     %risoluzione

Z0 = sqrt((R+1i*2*pi*F*L)/(G+1i*2*pi*F*C));
Vf = 1/(sqrt(L*C));
B = 2*pi*F*sqrt(C*L);
gamma = sqrt((R+1i*2*pi*F*L)*(G+1i*2*pi*F*C));%gamma
%zl = Z0;
%Tl = (zl-Z0)/(zl+Z0);
%modulo = abs(Tl);
%fase = angle(Tl);
lambda = (2*pi)/(imag(gamma));
lambda2 = Vf/F;
%disp(modulo+"+j("+fase+")")

% tan --> tangente
% atan --> arcotangente

%% show
disp("_______________________________________________")
disp(newline+"Soluzioni"+newline)
disp("Z0 = "+Z0+" [ohm]")
disp("Vf = "+Vf)
disp("lambda  = "+lambda+" [m]")
disp("lambda2 = "+lambda2+" [m]")
disp("costante di propagazione complessa"+newline+"    gamma= "+gamma+" [1/m]")
disp("costante di attenuazione"+newline+"    alpha: "+real(gamma)+" [N/m]")
disp("costante di fase"+newline+"    beta: "+imag(gamma)+" [Rad/m]")
disp("_______________________________________________")