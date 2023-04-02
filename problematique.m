
%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

% Angle de l'erreur : err_angle
% Module de l'erreur : r
% Module de l'erreur théorique : r_theo

%% Constantes
N = 10000;
sigma_2 = [4, 16];
D0 = [50, 100];
phi0 = [15, 30];

%% 1. Initilisation a)
U = rand(1, N);
err_angle = 2*pi*U;

dx = 1;
x = [0:dx:N-1];

figure
plot(x, err_angle)
title("Graphique de U[0, 2\pi]")

%% 1. Histogramme b)
figure
histogram(U)
title("Histogramme U[0, 1]")

%% 1. Loi de Rayleigh c)
dr = 0.01;
r = [0:dr:10];

figure
for s = [0.25 1 4 9 16]
    fr = (r./s).*exp(-((r.^2)./(2*s))); 
    plot(r, fr)
    hold on
end
title("Loi de Rayleigh théorique")
xlabel("r")
legend('\sigma^2=0.25', '\sigma^2=1', '\sigma^2=4', '\sigma^2=9', '\sigma^2=16');
hold off

%% 1. Méthode d'inversion de la CDF e) f)
dp = 0.01;
p = [0:dp:1];

subplot(2, 1, 1)
r1 = gen_nombres(p, sigma_2(1));
plot_module_err(p, r1, sigma_2(1))

subplot(2, 1, 2)
r2 = gen_nombres(p, sigma_2(2));
plot_module_err(p, r2, sigma_2(2))


%% 1. Comparaison des histogrammes g)

% Génération des nombres
p = rand(1, N);
r1 = gen_nombres(p, sigma_2(1));
r2 = gen_nombres(p, sigma_2(2));

figure
subplot(2, 1, 1);
histogram(r1)
title("Histogramme des 10,000 nombre générés")

% Génération des nombres théoriquement
r_theo = raylrnd(1, N, 1);

subplot(2, 1, 2); 
histfit(r_theo, 50,"rayleigh")
title("Histogramme des 10,000 nombre générés théoriquement selon la distribution de Rayleigh")

%% 2. Nuage de points des couples [r err_angle]
figure
subplot(2, 1, 1)
scatter_module_err(r1, err_angle, sigma_2(1))

subplot(2, 1, 2)
scatter_module_err(r2, err_angle, sigma_2(2))

%% 3. Valeurs aléatoires de la distance radiale et de l'angle de visée du radar
[D, phi] = couple_D_phi(D0(1), phi0(1), err_angle, r1);
figure
subplot(2, 1, 1)
scatter_couple_D_phi(D, phi, D0(1))

[D, phi] = couple_D_phi(D0(2), phi0(2), err_angle, r2);
subplot(2, 1, 2)
scatter_couple_D_phi(D, phi, D0(2))

%% Functions 
function [r] = gen_nombres(p, sigma_2)
    r = sqrt(-2*sigma_2.*log(1-p));
end

function plot_module_err(p, r, sigma_2)
    plot(p, r)
    title("Graphique du module de l'erreur sur 10,000 réalisations pour \sigma^2=" + sigma_2);
end

function scatter_module_err(r, err_angle, sigma_2)
    scatter(r, err_angle)
    title("Nuage de points des couples [r \theta] pour \sigma^2=" + sigma_2);
end

function scatter_couple_D_phi(r, err_angle, D0)
    scatter(r, err_angle)
    title("Nuage de points des couples [D \phi] pour D0=" + D0);
end

function [D, phi] = couple_D_phi(D0, phi0, theta, r)
    D = D0 + r.*cos(theta);
    phi = phi0 + r.*sin(theta);
end