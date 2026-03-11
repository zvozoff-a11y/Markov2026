clear;
clc;
close all;


for i = 2:4

N = 10^i;
nmax = 300;
a = 0.99;

P = [1-a, a, 0;
     a, 0, 1-a;
     0, 1-a, a];

q = [1 ;0; 0];

q = [1;0;0];
q1_theory = zeros(1,nmax+1);
q1_theory(1) = q(1);

for n = 1:nmax
    q = P'*q;
    q1_theory(n+1) = q(1);
end


X = ones(N,1);
f = zeros(1,nmax+1);
f(1) = mean(X==1);

for n = 1:nmax
    r = rand(N,1);
    Xnew = X;

    % state 1
    idx = (X==1);
    Xnew(idx & (r < 1-a)) = 1;
    Xnew(idx & (r >= 1-a)) = 2;

    % state 2
    idx = (X==2);
    Xnew(idx & (r < a)) = 1;
    Xnew(idx & (r >= a)) = 3;

    % state 3
    idx = (X==3);
    Xnew(idx & (r < 1-a)) = 2;
    Xnew(idx & (r >= 1-a)) = 3;

    X = Xnew;
    f(n+1) = mean(X==1);
end

figure;
plot(0:nmax, f, 'LineWidth', 1.5)
hold on
plot(0:nmax, q1_theory, 'LineWidth', 2)
xlabel('n')
ylabel('Fraction in state 1')
legend('Simulation f_n', 'Theory q_n(1)', 'Location', 'best')
title(['N = ', num2str(N), ', a = 0.99'])
grid on


end