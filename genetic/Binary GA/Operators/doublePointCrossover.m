function [c1,c2] = doublePointCrossover(p1,p2)
%DOUBLEPOINTCROSSOVER Summary of this function goes here
%   Detailed explanation goes here
%   Inputs:
%     p1: parent 1 position
%     p2: parent 2 position
    nVar = numel(p1);
    q = randperm(nVar - 1);
    j1 = min(q(1), q(2));
    j2 = max(q(1), q(2));

    c1 = [p1(1:j1) p2(j1+1:j2) p1(j2+1:end)];
    c2 = [p2(1:j1) p1(j1+1:j2) p2(j2+1:end)];
end