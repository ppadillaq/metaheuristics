function [z, x] = knapsack2(x, b, v, V)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Solving the 0-1 Knapsack Problem with Genetic Algorithms
% http://www.sc.ehu.es/ccwbayes/docencia/kzmm/files/AG-knapsack.pdf

while sum(x.*v) > V
    nVar = numel(x);
    k = randi([1, nVar]);
    x(k) = false;
end

z = -1*sum(x.*b);

end