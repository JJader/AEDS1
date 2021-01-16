
clc
clear

f = inline('1/log(x)');
a = 2;
b = 5;

[integral,info] = gauss_legendre(a,b,4,f)
