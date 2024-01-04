function [c1,c2] = uniformCrossover(p1,p2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

alpha = randi([0 1], size(p1));

c1 = alpha.*p1     + (1-alpha).*p2;
c2 = (1-alpha).*p1 + alpha.*p2;

end