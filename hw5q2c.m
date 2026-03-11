clear;
clc;
close all;

N = 10^6;

a = 0.04;
b = 0.16;
K = 0.1;

X0 = 1;

states = 1:5;
p = K*exp(a*states);
q = K*exp(b*(states-1));

%% Part B

P = [1-p(1), p(1), 0, 0, 0;
    q(2), 1-p(2)-q(2), p(2), 0, 0;
    0, q(3), 1-p(3)-q(3), p(3), 0;
    0, 0, q(4), 1-p(4)-q(4), p(4);
    0, 0, 0, q(5), 1-q(5)];

[V,D] = eig(P');

pi_eigenvectors = V(:,4)/sum(V(:,4));


X = exp((a-b).*(states-1).*states/2);
C = 1/(sum(X));

pi_th = C*X;


%% Part C

X = X0;

for i = 1:N
    Xchance = rand();

    switch X
        case 1
            if Xchance < 1-p(1)
                Xnew = 1;
            else 
                Xnew = 2;
            end
        case 5
            if Xchance < q(5)
                Xnew = 4;
            else
                Xnew = 5;
            end
        otherwise 
            if Xchance < p(X)
                Xnew = X+1;
            elseif Xchance < p(X)+q(X)
                Xnew = X-1;
            else
                Xnew = X;
            end
    end
                
    X = Xnew;
    Xhistory(i) = X;
end


counts = zeros(1,5);

for s = 1:5
    counts(s) = sum(Xhistory == s);
end

pi_num = counts / N;


%% Part D

bar(1:5, pi_num)

hold on
plot(1:5, pi_th,'ro-','LineWidth',2)
plot(1:5, pi_eigenvectors,'gx-','LineWidth',1)
legend('Simulation','Theory','Eigenvector')

xlabel('State')
ylabel('Fraction of time')
title('stationary distribution')