%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques



%% Partie 1 - Exercice 1
disp('Exercice 1')
[avg, std_dev] = exercice1(100);
hold on

[avg, std_dev] = exercice1(1000);

[avg, std_dev] = exercice1(10000);
hold off

% erreur quadratique ?
% E = sum((g-yn).^2) ?

%% Partie 1 - Exercice 2
disp('Exercice 2')

[avg, std_dev] = exercice2(100, 10, 2);
hold on

[avg, std_dev] = exercice2(1000, 10, 2);

[avg, std_dev] = exercice2(10000, 10, 2);
hold off

%% Partie 1 - Exercice 3
disp('Exercice 3')





%% Functions

function [avg, std_dev] = exercice1(N)  
    ech = -5 + (5 + 5)*rand(N);
    [avg, std_dev] = stats(ech);
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
    [avg, std_dev] = stats(ech);
    fprintf('N %6d, moyenne %1.5f, ecart-type %1.5f \n', N, avg, std_dev);
    
    % Erreur quadratique p. 220
    err__avg = (w_avg - avg)^2;
    err__std = (w_std_dev - std_dev)^2;
    fprintf('Erreur quadratique moyenne %f, ecart-type %f \n\n', err__avg, err__std);
end

function [avg, std_dev] = stats(ech)
    figure
    histogram(ech)

    avg = mean(ech, "all");
    std_dev = std(ech, 0, "all"); % valider le weight (c'est quoi ?)
end
