function [c1,c2] = singlePointCrossover(p1,p2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    nVar = numel(p1);
    k = randi([1, nVar - 1]);
    c1 = [p1(1:k) p2(k+1:end)];
    c2 = [p2(1:k) p1(k+1:end)];
end