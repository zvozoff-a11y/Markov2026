clear;
clc;
close all;

N = 10^3;
a = 0.49;
X0 = 1;
extinct = [];
X = [];

for n = 1:N

    X(n,1) = X0;
    T = 200;
    
    for t = 1:T
    
        if X(n,t) == 0
            extinct(n) = 1;
            break
        else
            Z = binornd(X(n,t),1-a);
            X(n,t+1) = 2*Z;
            extinct(n) = 0;
        end
    end
end


simulExtRate = sum(extinct)/length(extinct);

if a < 0.5
    theoExtRate = a/(1-a);
else
    theoExtRate = 1;
end
