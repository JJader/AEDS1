clc
clear 

addpath('./Muller');
addpath('./WDBrent');

toler = 10^-5;
iterMax = 100;

f = inline('3*x^4+2*x^3+4*x^2+25*x-30')
printf('\n\n')
[raiz_muller,iter,info] = muller(0.5,2,toler,iterMax,f)
printf('\n\n')
[raiz_wdbrent,iter,info] = wdBrent(0.5,2,toler,iterMax,f)
printf('\n\n\n')

restoredefaultpath;