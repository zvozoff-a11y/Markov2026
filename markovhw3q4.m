clear;
clc;
close all;

p = [1/2 1/2 0 0 0 0;
    0 1/2 1/2 0 0 0;
    1/3 0 1/3 1/3 0 0;
    0 0 0 1/2 1/2 0;
    0 0 0 0 0 1;
    0 0 0 0 1 0];

P = p^5;
steps = 5;
count = 0;
N = 10000;

for m = 1:N
    x = 1;
    for t = 1:steps
        u = rand;
        cum = cumsum(P(x,:));
        x = find(u <= cum, 1);
    end
    if x == 4
        count = count + 1;
    end
end

frac = count/N;