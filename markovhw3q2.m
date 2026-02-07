clear;
clc;
close all;

p = [9/10,1/10,0; 0,7/8,1/8;2/5,0,3/5];

P = p^50;

state = 1;

N = 10000;

for i = 1:N
    traj(i) = state;

    u = rand;
    cum = cumsum(P(state,:));
    state = find(u <= cum, 1);

end

frac = mean(traj == 1);