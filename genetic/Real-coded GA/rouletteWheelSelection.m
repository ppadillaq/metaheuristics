function i = rouletteWheelSelection(p)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% normalize p
% p = p/sum(p)
% but this is dangerous, as the sum may be 0

% another solution:
r = rand()*sum(p);
c = cumsum(p);
i = find(r <= c,1,"first");

end