clear;
clc;
close all;

tic
N = 10^6;
U = rand([1,N]);
dF = @(x) (1+x)*exp(-x)-exp(-x);

for j = 1:N
    F = @(x) (1-(1+x)*exp(-x))-U(j);
    x(j) = findRoots(F,dF);
end


function x = findRoots(F,dF)

    x = 1;
    maxIter = 100;
    delta = 0.01;

    for i = 1:maxIter
        xnew = x - F(x)/dF(x);
        if (abs(xnew-x)<delta)
            break
        end
        x = xnew;
    end

end


toc

scatter(x,U,".")