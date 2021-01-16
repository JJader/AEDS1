clc
clear

addpath('./Pegaso')
addpath('./Regular_falsi')
addpath('./Secante')

f = inline('10*cos(x.^3) + 10*cos(x.^9)')
a = -1.10;
b = -1.00;
toler = 10^-5;
iterMax = 100;


printf('\n\n')
[raiz_secante,iter,info] = secante(a,b,toler,iterMax,f)

printf('\n\n')
[raiz_regula_falsi,iter,info] = regula_falsi(a,b,toler,iterMax,f)

printf('\n\n')
[raiz_pegaso,iter,info] = pegaso(a,b,toler,iterMax,f)


restoredefaultpath;