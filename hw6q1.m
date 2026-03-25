clc;
clear;
close all;

P = [0 1 0 0 0;
    1/3 0 2/3 0 0;
    0 1/2 0 1/2 0;
    0 0 2/3 0 1/3;
    0 0 0 1 0];

P50 = P^50;

q50 = P50(2,:)/sum(P50(2,:));
pi = [1/12 1/4 1/3 1/4 1/12];


i = 0:4;

figure;
plot(i,pi,i,q50);
legend("Stationary Distribution", "Step 50 Distribution");
xlabel("State");
ylabel("Probability");
title("Stationary vs Calculated Distribution")
