function y = mutate(x, mu)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    flag = (rand(size(x)) < mu);
    y = x;
    % mutate just the bits indicated by the flag
    y(flag) = 1 - x(flag);
    
end