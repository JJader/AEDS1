clc
clear

f = inline('1/(x*log(x))');

a = 2;
b = 5;
toler = 10^-10;
iterMax = 10;

[integral,delta,iter,info] = gauss_legendre_iterativo(a,b,toler,iterMax,f)