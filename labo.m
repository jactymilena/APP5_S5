%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Partie 1 - Exercice 1
disp('Exercice 1')
[avg, std_dev] = exercice1(100);
%hold on

%[avg, std_dev] = exercice1(1000);

%[avg, std_dev] = exercice1(10000);
%hold off

%% Partie 1 - Exercice 2
disp('Exercice 2')

[avg, std_dev] = exercice2(100, 10, 2);
hold on

%[avg, std_dev] = exercice2(1000, 10, 2);

%[avg, std_dev] = exercice2(10000, 10, 2);
hold off

%% Partie 1 - Exercice 3
disp('Exercice 3')

N = 10000
X1 = []

for U = rand(2, N)
    X1 = [X, 10 + 2*cos(2*pi*U(1))*sqrt(-2*log(U(2)))];
end
figure
histogram(X1)

X2 = []

for U = rand(2, N)
    X2 = [X, 10 + 2*sin(2*pi*U(1))*sqrt(-2*log(U(2)))];
end
figure
histogram(X2)


%% Partie 1 - Exercice 4
N = 10000;
dx = 0.1;
x1 = [0:dx:5];
F = 0.5.*(1 + sqrt(1-exp(-(x1.^2).*sqrt(pi/8))));

figure
plot(x1, F)
hold on 

x2 = [-5:dx:0];
F2 = 0.5.*(1 + sqrt(1-exp(-(x2.^2).*sqrt(pi/8))));
plot(x2,1 - F2)

% b)


%dp = 0.01;
%p = [0.5:dp:1];
p = rand(100);
x = sqrt(-log(1 - (2 .* p - 1).^2) / sqrt(pi/8));

figure
histogram(x)
hold on

%p = [0:dp:0.5];
p = 0.5.*rand(100);
x = -sqrt(-log(1 - (2 .* p - 1).^2) / sqrt(pi/8));

histogram(x)  
hold off








%% Functions

function [avg, std_dev] = exercice1(N)  
    ech = -5 + (5 + 5)*rand(N);
    [avg, std_dev] = stats(ech, N);
    fprintf('N %6d, moyenne %1.5f, ecart-type %1.5f \n', N, avg, std_dev);
    
    % Erreur quadratique p. 220
    theo = ( 5 +(-5))^2;
    err__avg = (theo - avg)^2;
    theo = 5 +(-5)/sqrt(12);
    err__std = (theo - std_dev)^2;
    
    fprintf('Erreur quadratique moyenne %f, ecart-type %f \n\n', err__avg, err__std);
end

function [avg, std_dev] = exercice2(N, w_avg, w_std_dev)
    ech = w_std_dev.*randn(N) + w_avg;
    [avg, std_dev] = stats(ech, N);
    fprintf('N %6d, moyenne %1.5f, ecart-type %1.5f \n', N, avg, std_dev);
    
    % Erreur quadratique p. 220
    err__avg = (w_avg - avg)^2;
    err__std = (w_std_dev - std_dev)^2;
    fprintf('Erreur quadratique moyenne %f, ecart-type %f \n\n', err__avg, err__std);
end

function [avg, std_dev] = stats(ech, N)
    figure
    histogram(ech)
    %hold on
    %count = y.Values;
    %plot(count./N) % courbe des frequences relatives
    %hold off
    avg = mean(ech, "all");
    std_dev = std(ech, 0, "all");
end
