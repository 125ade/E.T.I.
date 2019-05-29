%% Esercizio di determinazione della natura del materiale
% l'esercizio propone di determinare la natura del materiale
% preso in considerazione attraverso il calcolo del tan delta
% data l'equazione d'onda -> alpha e beta
 clc;

    alpha = input("Inserisci costante di attenuazione alpha : ");
    beta =  input("Inserisci costante di fase          beta : ");
    f =     input("Inserisci frequenza in Hz              f : ");

    eps0 = 8.854187817e-12;
    w = 2*pi*f;
    gamma = alpha + 1i*beta;
    epsr = -((gamma^2)*(3e8)^2)/(w^2);
    n = sqrt(epsr);

    tanDelta = imag(epsr)/real(epsr);

    message = sprintf("tan delta = %f", tanDelta);
    opt = menu(message, "tan delta = 0", "tan delta << 1", "tan delta >> 1", "altro...");

%%

    if opt == 1
        fprintf("\nmateriale senza perdite \n");
        eta = 120*pi/n;
        fprintf("impedenza caratteristica del mezzo   eta : %f ohm \n" , eta);
    elseif opt == 2
        fprintf("\nmateriale buon dielettrico \n");
        eta = 120*pi/abs(n);
        fprintf("impedenza caratteristica del mezzo   eta : %f ohm \n" , eta);
    elseif opt == 3
        fprintf("\nmateriale buon conduttore \n");
        sigma = tanDelta*epsr*w*eps0; %conducibilta'
        eta = (1+1i)*alpha/sigma;
        fprintf("impedenza caratteristica del mezzo   eta : %f *e^(j %f) ohm \n", abs(eta), angle(eta));
    elseif opt == 4
        fprintf("\nmateriale generico \n");
        eta = 120*pi/n;
        fprintf("impedenza caratteristica del mezzo   eta : %f *e^(j %f) ohm \n", abs(eta), angle(eta));
    else error("cazzo hai scritto????");
    end
    
    fprintf("questo e' il modulo eta in funzione di pi greco : %f*pi ohm \n", abs(eta)/pi);


