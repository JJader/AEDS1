clc
clear 

addpath('./Pegaso');
addpath('./Regular_falsi');
addpath('./Secante');

toler = 10^-4;
iterMax = 100;


f = inline('2*x^3-5*x^2-10*x+20')
printf('\n\n')
[raiz_pegaso,iter,info] = pegaso(-5,5,toler,iterMax,f)
printf('\n\n')
[raiz_regula_falsi,iter,info] = regula_falsi(-5,5,toler,iterMax,f)
printf('\n\n')
[raiz_secante,iter,info] = secante(-5,5,toler,iterMax,f)
printf('\n\n\n')

f = inline('5*log10(x) + 3*x^4 - 7')
printf('\n\n')
[raiz_pegaso,iter,info] = pegaso(1,2,toler,iterMax,f)
printf('\n\n')
[raiz_regula_falsi,iter,info] = regula_falsi(1,2,toler,iterMax,f)
printf('\n\n')
[raiz_secante,iter,info] = secante(1,2,toler,iterMax,f)
printf('\n\n\n')

f = inline('2^x + x^2*cos(x)')
printf('\n\n')
[raiz_pegaso,iter,info] = pegaso(-2,1,toler,iterMax,f)
printf('\n\n')
[raiz_regula_falsi,iter,info] = regula_falsi(-2,1,toler,iterMax,f)
printf('\n\n')
[raiz_secante,iter,info] = secante(-2,1,toler,iterMax,f)
printf('\n\n\n')

restoredefaultpath;