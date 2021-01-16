clc
clear
close all

addpath('./Newton_raphson')
addpath('./Secante')

a = -1;
b = 1;
toler = 10^-4;
iterMax = 100;

f = inline('25*x^2 + 3*x -4')
[raiz_newton_r,iter,info] = newton_raphson(a,b,toler,iterMax,f)
printf('\n\n')
[raiz_secante,iter,info] = secante(a,b,toler,iterMax,f)

printf('\n\n')
printf('\n\n')


a = -10;
b = -1;
toler = 10^-4;
iterMax = 100;

f = inline('x^5 + 3*x^4 -4*x^3 - 8*x^2 + 2*x -10')
[raiz_newton_r,iter,info] = newton_raphson(a,b,toler,iterMax,f)
printf('\n\n')
[raiz_secante,iter,info] = secante(a,b,toler,iterMax,f)



restoredefaultpath;