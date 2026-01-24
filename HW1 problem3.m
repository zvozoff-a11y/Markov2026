clear;
clc;
close all;

startpt = 0;
endpt = 1;

f_u = @(u) (1./(u.^2+(1./u.^4)));

E_N = [];
totN = []';

x = 1:0.1:5;
N = floor(10.^x);
for x = 1:0.1:5
    N = floor(10^x);

    U = rand(N,1);
    V = rand(N,1);

    test = f_u(U);

    under = V <= f_u(U);
    E_N = [E_N,mean(under)];
    totN = [totN,N];
end


semilogx(totN,E_N);
yline(0.14343);
xlabel("Number of Trials");
ylabel("Expected Mean");
