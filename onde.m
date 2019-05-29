%% Eserczio di calocolo dei coefficienti in condizioni diverse
 % l'esercizio propone di calcolare tutti i coefficienti inierenti
 % la propagazione delle onde nel mezzo preso in considerazioine dati
 % frequenza, sigma (conducibilita') e epsilon
 clc;
 
    f = input("inserisci frequenza in Hz : ");
    epsr = input("inserisci costante dielettrica relativa eps_r : ");
    sigma = input("inserisci conducibilita' sigma : ");
    
    mur = 1;
    eps0 = 8.854187817e-12;
    mu0 = 4*pi*1e-7;
    w = 2*pi*f;
    
%     alpha= 0;
%     beta = 0;
%     lambda = 0;
%     eta = 0;
%     delta = 0;
%     v = 0;
%     n = 0;
    
    tanDelta = sigma/(epsr*eps0*w);
    
    message = sprintf("tan delta = %f", tanDelta);
    opt = menu(message, "tan delta = 0", "tan delta << 1", "tan delta >> 1", "altro...");
    
    if opt == 1 
        alpha = 0;
        beta = w*sqrt(epsr*eps0*mu0*mur);
        lambda = 2*pi/beta;
        n = sqrt(epsr);
        eta = sqrt(mur)*120*pi/n;
        delta = inf;
        v = w/beta;
    elseif opt == 2
        n = sqrt(epsr);
        eta = sqrt(mur)*120*pi/n;
        alpha = sigma*eta/2;
        beta = w*sqrt(epsr*eps0*mu0*mur);
        v = w/beta;
        lambda = v/f;
        delta = 1/alpha;
    elseif opt == 3
        n = sqrt(epsr);
        alpha = sqrt(pi*f*sigma*mu0*mur);
        beta = alpha;
        eta = (1+1i)*alpha/sigma;
        v = sqrt(4*pi*f/(mu0*mur*sigma));
        lambda = v/f;
        delta = 1/alpha;
    elseif opt == 4
        gamma = sqrt(-w^2*mu0*eps0*epsr*(1-1i*tanDelta));
        alpha = real(gamma);
        beta = imag(gamma);
        eta = 120*pi*sqrt(mur)/(sqrt(epsr*(1-1i*tanDelta)));
        v = w/beta;
        delta = 1/alpha;
        lambda = 2*pi/beta;
        n = 120*pi/eta;
    else error("errore nel menu...");
    end
    
%% Print
 
    fprintf("\nCostante di attenuazione     alpha : %f Np/m \n", alpha);
    fprintf("Costante di fase              beta : %f rad/m \n", beta);
    if imag(eta)~=0
        fprintf("Impedenza caratteristica       eta : %f *e^(j %f) ohm \n", abs(eta), angle(eta));
    else
        fprintf("Impedenza caratteristica       eta : %f ohm \n", eta);
    end
    if imag(n)~=0
        fprintf("Indice di rifrazione             n : %f + i %f adimensionale \n", real(n), imag(n));
    else
        fprintf("Indice di rifrazione             n : %f adimensionale\n", n);
    end
    fprintf("Velocita' di fase               Vf : %e m/s \n", v);
    fprintf("Lunghezza d'onda            lambda : %f m \n", lambda);
    fprintf("Profondita' di penetrazione  delta : %f m \n", delta);
 
        