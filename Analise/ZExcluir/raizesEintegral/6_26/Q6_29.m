clc
clear 

addpath('./Muller');
addpath('./WDBrent');

toler = 10^-5;
iterMax = 100;

f = inline('exp(-cos(x)) + 2*x^4 - 8*x^2 - 10')
printf('\n\n')
[raiz_muller,iter,info] = muller(1,3,toler,iterMax,f)
printf('\n\n')
[raiz_wdbrent,iter,info] = wdBrent(1,3,toler,iterMax,f)
printf('\n\n\n')

restoredefaultpath;