clc
clear 

addpath('./Muller');
addpath('./WDBrent');

toler = 10^-5;
iterMax = 100;

f = inline('x^5-x^4-x^3-x^2-x-1')
printf('\n\n')
[raiz_muller,iter,info] = muller(1.5,3,toler,iterMax,f)
printf('\n\n')
[raiz_wdbrent,iter,info] = wdBrent(1.5,3,toler,iterMax,f)
printf('\n\n\n')

restoredefaultpath;