clear;
clc;
close all;

p = [1 0 0 0 0;
    1/3 0 2/3 0 0;
    0 1/3 0 2/3 0;
    0 0 1/3 0 2/3;
    0 0 0 0 1];

P = p^5;

y = [];
for i = 1:10
    x = 1/3*1/3*(2/9)^(i-1)
    y = [y,x];
    z(i) = sum(y);
end

plot(1:10,z);