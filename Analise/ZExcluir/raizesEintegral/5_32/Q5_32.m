clc
clear

f = inline('sqrt(1+cos(x))');

a = 0;
b = pi;
toler = 10^-10;
iterMax = 10;

[integral,delta,iter,info] = gauss_legendre_iterativo(a,b,toler,iterMax,f)

