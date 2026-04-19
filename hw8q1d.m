clear; 
clc;
close all;

syms y1(t) y2(t) y3(t) y4(t)

eq1 = diff(y1,t) == -y1 + y4;
eq2 = diff(y2,t) == -y2 + y1;
eq3 = diff(y3,t) == -y3 + y2;
eq4 = diff(y4,t) == -y4 + y3;

icond1 = y1(0) == 1/3;
icond2 = y2(0) == 2/3;
icond3 = y3(0) == 0;
icond4 = y4(0) == 0;

S = dsolve([eq1, eq2, eq3, eq4], [icond1, icond2, icond3, icond4]);

y1sol = simplify(S.y1);
y2sol = simplify(S.y2);
y3sol = simplify(S.y3);
y4sol = simplify(S.y4);