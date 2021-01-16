
clc
clear

f = inline('sqrt(x^3+1)');
a = 0;
b = 1;

[integral,info] = gauss_legendre(a,b,4,f)
