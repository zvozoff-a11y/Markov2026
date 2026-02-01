clear;
clc;
close all;

gamma = 4;
x0 = 10;

N = [100,1000,10000];
x = 0:0.1:60;
y = (gamma-1)*x0^(gamma-1)*x.^(-gamma);

figure;
hold on;
for i = 1:3

    X = rand([N(i), 1]);
    Y = x0.*(1-X).^(-1/(gamma-1));
    
    
    histogram(Y,"Normalization","pdf");
    
end

plot(x,y)

xlim([0,60]);
ylim([0,0.25]);
legend("100 Samples", "1000 Samples", "10000 Samples", "Theoretical");
hold off;
