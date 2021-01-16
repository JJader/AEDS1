clc
clear 

addpath('./Bissecao');

%6.16

f = inline('exp(2*x)-2*x^3-5')
[raiz,iter,info] = bissecao(-1,5,10^-3,100,f)

printf('\n\n')
f = inline('2*x^3-5*x^2-x+3')
[raiz,iter,info] = bissecao(-5,5,10^-3,100,f)

printf('\n\n')
f = inline('5*x^2 + log10(x+1) - 2')
[raiz,iter,info] = bissecao(-0.5,5,10^-3,100,f)

restoredefaultpath;