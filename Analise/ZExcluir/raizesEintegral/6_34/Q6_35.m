clc
clear 

addpath('./Halley');
addpath('./Newton_raphson');

toler = 10^-5;
iterMax = 100;

%6.31
f = inline('4*x^3+x+cos(x)-10')
[raiz_newton,iter,info] = newton_raphson(1,1.5,toler,iterMax,f)
printf('\n\n')
[raiz_halley,iter,info] = halley(1,1.5,toler,iterMax,f)
printf('\n\n\n')

%6.32
f = inline('exp(x) - pi^x + 25')
[raiz_newton,iter,info] = newton_raphson(3,4,toler,iterMax,f)
printf('\n\n')
[raiz_halley,iter,info] = halley(3,4,toler,iterMax,f)
printf('\n\n\n')

%6.33
f = inline('x^4-6*x^3+ 8*x^2 + 6*x - 9')
[raiz_newton,iter,info] = newton_raphson(2,4,toler,iterMax,f)
printf('\n\n')
[raiz_halley,iter,info] = halley(2,4,toler,iterMax,f)
printf('\n\n\n')


restoredefaultpath;