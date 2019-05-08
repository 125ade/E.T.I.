%% dati problema
clear; clc
z0 = 140;
zl = 280+182i;
lambda = 0.24;
lg = 0 ;%in metri LUNGHEZZA
v0plus = 1;
%% calcoli
%coefficente di riflessione del carico
coef_riflessione_carico = (zl - z0) /(zl+z0);


%MODULO e FASE
fase = angle(coef_riflessione_carico);
modulo = abs(coef_riflessione_carico);
%MODULO e FASE EXPONENZIALE
fase_exp = angle(modulo*exp(1i*fase));

%ROS
Ros = (1 + modulo)/(1 - modulo);

%z massima
ZmaxM = (-1*fase_exp * lambda)/(4*pi);
ZmaxOHM = Ros * z0;
%z minima
ZminM2 = ((-pi-fase)*lambda)/(4*pi); %formula analitica
ZminM = (ZmaxM -(lambda/4));
ZminOHM = z0/Ros;

%|Vmax|
Vmax = (1+modulo)*abs(v0plus);

%|Vmin|
Vmin = (1-modulo)*abs(v0plus);

%|Imax|
Imax = (1+modulo)*(abs(v0plus))/z0;

%|Imax|
Imin = (1-modulo)*(abs(v0plus))/z0;

%Zin
Zin = z0 *((zl + 1i*z0*tan(imag(coef_riflessione_carico)*lg))/(z0 + 1i*zl*tan(imag(coef_riflessione_carico)*lg))); 

%% GRAFICA
disp("_______________________________________________"+newline)
disp("      coef_riflessione_carico: "+coef_riflessione_carico)
%disp("coefficente di riflessione"+newline+" al carico esponenziale: "+modulo+" e^(j "+fase_exp+")")
%TL 
%disp("modulo_exp: "+modulo)
%disp("  fase_exp: "+angle(modulo*exp(-1i*fase)))
%altri calcoli
disp("      ROS : "+Ros)
disp("      Zin : "+Zin+" ohm")
disp("      Zmax: "+ZmaxM+" M")
disp("      Zmin: "+ZminM+" M")
disp("      ZmaxOHM: "+ZmaxOHM+" ohm")
disp("      ZminOHM: "+ZminOHM+" ohm")
disp("      Vmax: "+Vmax+" V")
disp("      Vmin: "+Vmin+" V")
disp("      Imax: "+Imax+" I")
disp("      Imin: "+Imin+" I")
% aggiungere
disp("_______________________________________________")