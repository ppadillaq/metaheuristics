function y = mutate(x, mu, sigma)
%UNTITLED2 Summary of this function goes here
%   Flag to decide which variable we are going to mutate
%     sigma: step size
    flag = (rand(size(x)) < mu);
    y = x;
    % mutate just the bits indicated by the flag
    r = randn(size(x));
    y(flag) = x(flag) + sigma*r(flag);
    
end