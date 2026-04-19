clear; 
clc;
close all;

syms f(t) n(t) d(t)


eq1 = diff(f,t) == -2*f + n + d;
eq2 = diff(n,t) == f - n;
eq3 = diff(d,t) == f - d;

cond1 = f(0) == 0;
cond2 = n(0) == 1;
cond3 = d(0) == 0;

S = dsolve([eq1, eq2, eq3], [cond1, cond2, cond3]);

fsol = simplify(S.f);
nsol = simplify(S.n);
dsol = simplify(S.d);