function [c1,c2] = myCrossover(p1, p2)
    %UNTITLED6 Summary of this function goes here
    %   Detailed explanation goes here
    m = randi([1,3]);
    switch m
        case 1
            [c1,c2] = singlePointCrossover(p1, p2);
        case 2
            [c1,c2] = doublePointCrossover(p1, p2);
        otherwise
            [c1,c2] = uniformCrossover(p1, p2);
    end
end