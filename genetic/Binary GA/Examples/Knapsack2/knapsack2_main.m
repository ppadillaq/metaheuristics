%% PROBLEMA DE LA MOCHILA
clear
clc
close all

%% Problem Definition
b = [7 9 10 10 8];

problem.nVar = numel(b);
% Restrictions
p = [1 2 1.5 3 5];
P = 7; % maximum load (kg)
problem.CostFunction = @(x) knapsack2(x, b, p, P);
%problem.Constrain = @(x) pesoMaxMochila(x, p, P);

%% GA Parameters

params.MaxIt = 100;
params.nPop = 10;

params.beta = 1;
params.pC = 1;
params.mu = 0.02;

%% Run GA

out = binaryGA(problem, params);

%% Results
figure
plot(out.bestcost, 'LineWidth', 2)
xlabel('Iterations')
ylabel('Best Cost')
grid on