clear;
clc;
close all;

N = 10^4;

vals = [];
vec1 = [];
vec2 = [];
vec3 = [];

for a = linspace(0,1,N)

    P = [1-a, a, 0;
    a, 0, 1-a;
    0, 1-a, a];

    [V,D] = eig(P');

    vals = [vals;sum(D, 1)];
    vec1 = [vec1,V(:,1)];
    vec2 = [vec2,V(:,2)];
    vec3 = [vec3,V(:,3)];

end

figure;
plot(linspace(0,1,N),vals);
xlabel("Value of a");
legend("Eigenvalue 1","Eigenvalue 2","Eigenvalue 3")
title("Eigenvalues");

figure;
plot(linspace(0,1,N),vec1);
xlabel("Value of a");
legend("X","Y","Z")
title("Eigenvector 1");

figure;
plot(linspace(0,1,N),vec2);
xlabel("Value of a");
legend("X","Y","Z")
title("Eigenvector 2");

figure;
plot(linspace(0,1,N),vec3);
xlabel("Value of a");
legend("X","Y","Z")
title("Eigenvector 3");
