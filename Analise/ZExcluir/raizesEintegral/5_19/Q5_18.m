
clc
clear

f = inline('sin(x)/x');
a = 0;
b = pi;

[integral,info] = gauss_legendre(a,b,4,f)
