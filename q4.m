clear;
clc;
close all;

N = 10^5;


t = 0:0.001:1;

for i = 1:N
    X = rand([3,1]);
    T(i) = max(X);
end

figure;
hold on;
histogram(T,'Normalization','PDF');
plot(t,3*t.^2);
legend("Simulated","Theoretical");