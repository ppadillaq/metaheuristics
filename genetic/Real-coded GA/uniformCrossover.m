function [c1,c2] = uniformCrossover(p1,p2, gamma)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%alpha = rand(size(p1));

% we can expand the interval [0,1] to [-gamma, 1+gamma], being gamma a very
% small number
% it helps the exploration
% this can make that children are a bit different from the parents:
alpha = (1+gamma + gamma)*rand(size(p1)) + (0 - gamma);

c1 = alpha.*p1     + (1-alpha).*p2;
c2 = (1-alpha).*p1 + alpha.*p2;

end