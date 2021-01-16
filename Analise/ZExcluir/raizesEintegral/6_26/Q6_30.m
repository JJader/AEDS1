clc
clear 

addpath('./Muller');
addpath('./WDBrent');

toler = 10^-5;
iterMax = 100;

f = inline('log10(5+sqrt(x))+exp(x-2)-1')
printf('\n\n')
[raiz_muller,iter,info] = muller(0,2,toler,iterMax,f)
printf('\n\n')
[raiz_wdbrent,iter,info] = wdBrent(0,2,toler,iterMax,f)
printf('\n\n\n')

restoredefaultpath;