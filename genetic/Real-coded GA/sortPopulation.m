function pop = sortPopulation(pop)
    %UNTITLED3 Summary of this function goes here
    %   Detailed explanation goes here
    [~, so] = sort([pop.Cost]);
    pop = pop(so);
end