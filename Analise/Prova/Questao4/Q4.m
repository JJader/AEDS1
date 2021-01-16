clc
clear

addpath('./Newton_raphson')
addpath('./Teste_raiz')

f = inline('2.00*x.^5 + 1.00*x.^4 - 2.00*x.^3 - 7.00*x.^2 + 9.00*x + 1.00');

a = -0.5;
b = -0.2;
toler = 10^-1;
iterMax = 100;

[raiz,iter,info] = newton_raphson(a,b,toler,iterMax,f)



restoredefaultpath;