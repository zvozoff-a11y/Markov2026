clear;
clc;
close all;

tic
N = 10^6;

X1 = exprnd(1,1,N);
X2 = exprnd(1,1,N);

X = X1+X2;
toc


x = 0:0.01:20;
y = x.*exp(-x);
figure;
hold on;
plot(x,y,"LineWidth",3)
histogram(X,"Normalization","pdf")
legend("Theoretical","Gamma")