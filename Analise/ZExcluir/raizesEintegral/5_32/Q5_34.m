clc
clear

f = inline('e^(1-x^2)*sin(10*x)');

a = 0;
b = pi;
toler = 10^-10;
iterMax = 10;

[integral,delta,iter,info] = gauss_legendre_iterativo(a,b,toler,iterMax,f)