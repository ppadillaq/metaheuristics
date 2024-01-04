function feasible = pesoMaxMochila(x, v, V)
    %UNTITLED4 Summary of this function goes here
    %   Constrain function for the knapsack optimization problem.
    feasible = (sum(x.*v) <= V);
end