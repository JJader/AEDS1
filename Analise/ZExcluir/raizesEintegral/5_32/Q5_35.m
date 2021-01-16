clc
clear

f = inline('cos(2+cos(x)^3)^4');

a = -pi;
b = pi;
toler = 10^-10;
iterMax = 10;

[integral,delta,iter,info] = gauss_legendre_iterativo(a,b,toler,iterMax,f)