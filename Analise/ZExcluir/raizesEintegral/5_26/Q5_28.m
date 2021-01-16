clc
clear

f = inline('0.2*x^4 + sin(x) +2');

a = 0;
b = pi;
m = 6;

printf("\n\nPor regra do 3/8 de simpson \n")
[integral,info] = newton_cotes(a,b,3,m,f)

printf("\n\nPor regra do gauss_legendre \n")
[integral,info] = gauss_legendre(a,b,7,f)