clear;
clc;
close all;

tic
f = @(x) (x*exp(-x));
g = @(x) (0.5*exp(-x/2));

c = 4/exp(1);

rate = 1/c;

N = floor(10^6/rate);

Y = exprnd(2,[1,N]);
U = rand([1,N]);

accepted = zeros([1,N]);
for i = 1:N
    if U(i)<=(exp(1)/2*Y(i)*exp(-Y(i)/2))
        accepted(i) = Y(i);
        length(accepted);
    end
end

toc


scatter(accepted,U,".");