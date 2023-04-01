%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Initilisation a)
N = 10000;
U = rand(1, N);
U_theta = 2*pi*U;

dx = 1;
x = [0:dx:N-1];

figure
plot(x, U_theta)
title("Graphique de U[0, 2\pi]")
%% Histogramme b)
figure
histogram(U)
title("Histogramme U[0, 1]")

%% Loi de Rayleigh c)
dr = 0.01;
r = [0:dr:10];

figure
for sigma_2 = [0.25 1 4 9 16]
    fr = (r./sigma_2).*exp(-((r.^2)./(2*sigma_2))); 
    plot(r, fr)
    hold on
end
title("Loi de Rayleigh théorique")
xlabel("r")
legend('\sigma^2=0.25', '\sigma^2=1', '\sigma^2=4', '\sigma^2=9', '\sigma^2=16');
hold off

%% Méthode d'inversion de la CDF e) f)
dp = 0.01;
p = [0:dp:1];
sigma_2 = 4;
r = sqrt(-2*sigma_2.*log(-p));
plot(p, r)

% TODO : valider quel est graphique à afficher et quel est le lien avec les
% distances radiales D

N = 10000;
p = rand(1, N);
r = sqrt(-2*sigma_2.*log(-p));

histogram(r)

%% Comparaison g)
N = 10000
r = raylrnd(1, N, 1)
histfit(r, 100,"rayleigh")





